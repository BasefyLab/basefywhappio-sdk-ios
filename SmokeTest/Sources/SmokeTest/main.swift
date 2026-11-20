// BasefyWhappioSDK duman testi.
//
// Gerekli ortam değişkenleri: SDK_USER, SDK_PASS
// Giriş bilgileri, token ve yanıt gövdeleri asla yazdırılmaz.

import Foundation
import BasefyWhappioSDK

// SDK yanıtları varsayılan olarak ana kuyruğa (DispatchQueue.main) teslim eder.
// Komut satırı aracında ana kuyruğun boşaltılmasına bağımlı kalmamak için global kuyruk kullanılır.
BasefyWhappioSDKAPI.apiResponseQueue = DispatchQueue.global(qos: .userInitiated)

// MARK: - Yardımcılar

func show<T>(_ value: T?) -> String {
    value.map { "\($0)" } ?? "nil"
}

/// Hatayı yanıt gövdesini yazdırmadan açıklar (gövde token içerebilir).
func describe(_ error: Error) -> String {
    if let response = error as? ErrorResponse, case let .error(statusCode, data, _, underlying) = response {
        return "ErrorResponse(statusCode: \(statusCode), gövde: \(data?.count ?? 0) bayt, alttaki hata: \(underlying))"
    }
    return "\(type(of: error)): \(error)"
}

var failures: [String] = []

func pass(_ message: String) {
    print("  OK: \(message)")
}

func fail(_ step: String, _ message: String) {
    print("  HATA: \(message)")
    failures.append(step)
}

// MARK: - Giriş bilgileri

let env = ProcessInfo.processInfo.environment
guard let username = env["SDK_USER"], !username.isEmpty,
      let password = env["SDK_PASS"], !password.isEmpty else {
    print("HATA: SDK_USER ve SDK_PASS ortam değişkenleri tanımlı olmalı.")
    print("GitHub Actions'ta repo ayarlarından (Settings > Secrets and variables > Actions) bu secret'ları ekleyin.")
    exit(1)
}

print("Sunucu: \(BasefyWhappioSDKAPI.basePath) (SDK varsayılanı)")

// MARK: - 1) Giriş

print("\n[1] AuthAPI.authLoginPost")
let login: LoginResponseApiReturn
do {
    login = try await AuthAPI.authLoginPost(loginRequest: LoginRequest(username: username, password: password))
} catch {
    print("  HATA: giriş isteği başarısız: \(describe(error))")
    exit(1)
}

print("  success: \(show(login.success))")
print("  message: \(show(login.message))")
let receivedUserType = login.data?.userType
print("  data.userType: \(show(receivedUserType.map { "\($0) (rawValue: \($0.rawValue))" }))")

guard login.success == true else {
    print("  HATA: giriş başarısız (success != true).")
    exit(1)
}
guard let userType = receivedUserType else {
    print("  HATA: data.userType boş geldi; sayısal enum okuması doğrulanamadı.")
    exit(1)
}
guard userType != .unknownDefaultOpenApi else {
    print("  HATA: data.userType SDK'nın tanımadığı bir değer (unknownDefaultOpenApi).")
    exit(1)
}
guard let token = login.data?.token, !token.isEmpty else {
    print("  HATA: data.token boş geldi.")
    exit(1)
}
pass("giriş başarılı, sayısal enum (userType) hatasız okundu")

// MARK: - 2) Geçerli token ile etiket listesi

print("\n[2] TagAPI.tagListGet (geçerli token)")
BasefyWhappioSDKAPI.customHeaders["Authorization"] = "Bearer \(token)"
do {
    let tags = try await TagAPI.tagListGet()
    print("  success: \(show(tags.success))")
    print("  message: \(show(tags.message))")
    if tags.success == true {
        pass("etiket listesi alındı")
    } else {
        fail("tagListGet", "success != true")
    }
} catch {
    fail("tagListGet", describe(error))
}

// MARK: - 3) Geçersiz token ile 401 beklentisi

print("\n[3] TagAPI.tagListGet (geçersiz token, HTTP 401 bekleniyor)")
BasefyWhappioSDKAPI.customHeaders["Authorization"] = "Bearer gecersiz-token"
do {
    let tags = try await TagAPI.tagListGet()
    fail("tagListGet-401", "401 bekleniyordu ama istek başarılı oldu (success: \(show(tags.success)))")
} catch let response as ErrorResponse {
    if case let .error(statusCode, _, _, _) = response, statusCode == 401 {
        pass("beklenen HTTP 401 alındı")
    } else {
        fail("tagListGet-401", "401 bekleniyordu, gelen: \(describe(response))")
    }
} catch {
    fail("tagListGet-401", "401 bekleniyordu, gelen: \(describe(error))")
}
BasefyWhappioSDKAPI.customHeaders.removeValue(forKey: "Authorization")

// MARK: - Sonuç

print("")
if failures.isEmpty {
    print("SONUÇ: tüm adımlar başarılı.")
    exit(0)
} else {
    print("SONUÇ: başarısız adımlar: \(failures.joined(separator: ", "))")
    exit(1)
}
