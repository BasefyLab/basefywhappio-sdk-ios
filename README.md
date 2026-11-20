# BasefyWhappioSDK (iOS)

Whappio mobil API'si için Swift SDK'sı. WhatsApp sohbetlerini listeleme, mesaj gönderme, sohbet atama,
kişi ve etiket yönetimi gibi işlemleri `async/await` ile yapan hazır metotlar içerir.

İçindekiler:
[Gereksinimler](#gereksinimler) ·
[Kurulum](#kurulum) ·
[Hızlı başlangıç](#hızlı-başlangıç) ·
[Temel kurallar](#temel-kurallar) ·
[Hata yönetimi](#hata-yönetimi) ·
[Metotlar](#metotlar) ·
[Sık kullanılan akışlar](#sık-kullanılan-akışlar) ·
[Canlı mesajlar](#canlı-mesajlar-realtime) ·
[Enum değerleri](#enum-değerleri)

---

## Gereksinimler

- iOS 13+ (ayrıca macOS 10.15+, tvOS 13+, watchOS 6+)
- Xcode 14+ / Swift 5.7+
- Tek bağımlılık: [AnyCodable](https://github.com/Flight-School/AnyCodable) (SPM otomatik çeker)

## Kurulum

SDK, Swift Package Manager ile dağıtılır.

**Xcode'da:** File → Add Package Dependencies… → adres alanına şunu yazın:

```
https://github.com/BasefyLab/basefywhappio-sdk-ios
```

Sürüm kuralı olarak "Up to Next Major Version" seçin ve uygulama hedefinize `BasefyWhappioSDK` ürününü ekleyin.

**`Package.swift` ile:**

```swift
dependencies: [
    .package(url: "https://github.com/BasefyLab/basefywhappio-sdk-ios", from: "1.0.3"),
],
targets: [
    .target(
        name: "App",
        dependencies: [.product(name: "BasefyWhappioSDK", package: "basefywhappio-sdk-ios")]
    ),
]
```

Sürümler repodaki git tag'leridir. En güncel sürüm için repodaki son tag'e bakın.

## Hızlı başlangıç

```swift
import BasefyWhappioSDK

// 1) Giriş yap
let login = try await AuthAPI.authLoginPost(
    loginRequest: LoginRequest(username: "kullanici", password: "parola")
)
guard login.success == true, let token = login.data?.token else {
    // Hatalı parola, kilitli/pasif hesap vb. Mesaj kullanıcıya gösterilebilir.
    showAlert(login.message ?? "Giriş yapılamadı")
    return
}

// 2) Token'ı sonraki tüm isteklere ekle (token'ı Keychain'de saklayın)
BasefyWhappioSDKAPI.customHeaders["Authorization"] = "Bearer \(token)"

// 3) Sohbetleri listele
let result = try await ConversationAPI.conversationListGet(currentPage: 1, pageSize: 20)
for conversation in result.data?.results ?? [] {
    print(conversation.contact?.fullName ?? conversation.phoneNumber ?? "",
          conversation.lastMessage?.preview ?? "")
}
```

Uygulama yeniden açıldığında Keychain'deki token'ı aynı şekilde `customHeaders` içine koymanız yeterlidir.
Tekrar giriş yapmaya gerek yoktur.

---

## Temel kurallar

### Yapılandırma

Tüm ayarlar `BasefyWhappioSDKAPI` üzerindeki statik değişkenlerdir:

| Değişken | Varsayılan | Açıklama |
|---|---|---|
| `basePath` | `https://api.whappio.com` | Sunucu adresi. Normalde değiştirmeyin. |
| `customHeaders` | `[:]` | Her isteğe eklenen başlıklar. Token buraya konur. |
| `apiResponseQueue` | `.main` | Yanıtların teslim edildiği kuyruk. Uygulamalarda varsayılan uygundur. |

### Token

- `AuthAPI.authLoginPost` ile alınır ve uzun ömürlüdür (şu an 200 gün). Yenileme (refresh) ucu yoktur.
- Herhangi bir uç **HTTP 401** dönerse token geçersizdir: Keychain'deki token'ı silip kullanıcıyı giriş ekranına
  yönlendirin.
- Çıkış yaparken `BasefyWhappioSDKAPI.customHeaders.removeValue(forKey: "Authorization")` çağırın.

### Yanıt biçimi

Her metot aynı yapıda bir nesne döner:

| Alan | Anlamı |
|---|---|
| `success` | İşlem başarılı mı. |
| `message` | Kullanıcıya gösterilebilecek açıklama (özellikle `success == false` iken). |
| `data` | Asıl veri (liste, detay, `Bool` vb.). |
| `errors` | Varsa doğrulama hataları. |

**Dikkat:** İş kuralı hataları ("Etiket bulunamadı", "24 saat penceresi kapalı" vb.) hata fırlatmaz.
HTTP 200 ile `success == false` döner. Bu yüzden her yanıtta `success` değerini kontrol edin.

### Biçimler

- **Telefon numaraları** ülke kodlu ve yalnızca rakamdır: `905321112233`.
- **Sohbetin kimliği telefon numarasıdır.** `conversationListGet` içindeki `phoneNumber` değeri diğer tüm
  `ConversationAPI` metotlarına aynen verilir.
- **Mesaj tarihleri** (`date`, `lastIncomingMessageDate`, `nextBeforeDate`) Unix **milisaniye** cinsinden `Int64` değerlerdir:
  ```swift
  let date = Date(timeIntervalSince1970: TimeInterval(message.date ?? 0) / 1000)
  ```
- **Sayfalama:** `currentPage` 1'den başlar. Yanıttaki `rowCount` toplam kayıt, `pageCount` toplam sayfa sayısıdır.
- **Enum'lar** sunucuya sayı olarak gider ve sayı olarak gelir. Swift'te case adları `._1`, `._2` biçimindedir.
  Anlamları [Enum değerleri](#enum-değerleri) bölümündedir.
- **Tüm parametreler ve alanlar `Optional`'dır.** Zorunlu olanlar metot açıklamalarında belirtilmiştir.

### Yetkiler

Girişte dönen `login.data?.permissions` listesi (ör. `contactspermission`, `taglistpermission`) yalnızca menü ve
düğmeleri göstermek ya da gizlemek içindir. Asıl yetki kontrolü her istekte sunucuda yapılır. Yönetici
kullanıcılar (`userType == ._1`) bu listeden bağımsız olarak her şeye erişir.

---

## Hata yönetimi

| Durum | Nasıl gelir | Ne yapmalı |
|---|---|---|
| İş kuralı hatası | Yanıt döner, `success == false` | `message` değerini kullanıcıya gösterin. |
| Token geçersiz / hesap pasif | `ErrorResponse.error(401, …)` fırlatılır | Kullanıcıyı giriş ekranına gönderin. |
| Yetki yok / WhatsApp kurulumu eksik | `ErrorResponse.error(403, …)` | "Bu işlem için yetkiniz yok" gösterin. |
| Sunucu hatası | `ErrorResponse.error(500, …)` | Genel hata mesajı gösterin. Yanıttaki hata kodunu destek ekibine iletin. |
| Bağlantı yok / zaman aşımı | `ErrorResponse.error(-1, …)`, alttaki hata `URLError` | "İnternet bağlantınızı kontrol edin" gösterin. |
| Yanıt çözülemedi | `ErrorResponse.error(<HTTP kodu>, …)`, alttaki hata `DecodingError` | SDK ile sunucu uyumsuz. SDK'yı güncelleyin, sorun sürerse bildirin. |

Örnek, merkezi bir yardımcı:

```swift
enum ApiFailure: Error {
    case business(String)     // success == false
    case unauthorized         // 401 → giriş ekranı
    case forbidden            // 403
    case network              // bağlantı yok
    case server(Int)          // diğer
}

func call<T>(_ request: () async throws -> T,
             success: (T) -> Bool?,
             message: (T) -> String?) async throws -> T {
    do {
        let response = try await request()
        guard success(response) == true else {
            throw ApiFailure.business(message(response) ?? "İşlem başarısız")
        }
        return response
    } catch ErrorResponse.error(let code, _, _, let underlying) {
        switch code {
        case 401: throw ApiFailure.unauthorized
        case 403: throw ApiFailure.forbidden
        case -1 where underlying is URLError: throw ApiFailure.network
        default: throw ApiFailure.server(code)
        }
    }
}

// Kullanım
let tags = try await call({ try await TagAPI.tagListGet() },
                          success: { $0.success }, message: { $0.message })
```

---

## Metotlar

Tüm metotlar `async throws` ve statiktir: `try await SınıfAdı.metot(...)`.
⚠️ işaretli metotlar müşteriye **gerçek WhatsApp mesajı** gönderir.

### AuthAPI: Giriş

| Metot | Ne yapar |
|---|---|
| `authLoginPost(loginRequest: LoginRequest(username:password:))` | Backoffice kullanıcı adı ve parolasıyla giriş yapar. `data` içinde `token`, `id`, `fullName`, `tenantId`, `userType` ve `permissions` döner. Hatalı parola, kilitli ya da pasif hesapta `success == false` döner. Art arda hatalı denemelerde bekleme süresi uygulanır ve hesap kilitlenebilir. |

### MeAPI: Temsilci durumu

| Metot | Ne yapar |
|---|---|
| `meStatusGet()` | Kullanıcı çevrimiçi mi (`data: Bool`). Durum web panelle ortaktır. |
| `meStatusPost(setMyStatusCommand: SetMyStatusCommand(isOnline:))` | Çevrimiçi ya da çevrimdışı yapar. `isOnline` istenen durumdur. Aynı değeri tekrar göndermek durumu geri çevirmez. **Çevrimdışı olunca** kullanıcının üzerindeki açık sohbetlerin ataması kaldırılır. Yeni sohbetler yalnızca çevrimiçi temsilcilere atanır. |

### ConversationAPI: Sohbetler

**Okuma**

| Metot | Ne yapar |
|---|---|
| `conversationListGet(currentPage:pageSize:)` | Sohbet listesi. En son yazışılan sohbet önce gelir. Her satırda `phoneNumber` (sohbet kimliği), `contact` (kayıtlı kişi değilse `nil`), `lastMessage` (`preview`, `messageType`, `date`, `isIncoming`), `isUnread` (okunmadı rozeti) ve `ticket` (`status`, atanan temsilci) bulunur. `pageSize` en fazla 100 olabilir. |
| `conversationMessagesGet(phoneNumber:beforeDate:beforeId:pageSize:)` | Mesaj geçmişi. Sayfa içinde mesajlar eskiden yeniye sıralıdır. İlk istekte yalnızca `phoneNumber` gönderin, en yeni mesajlar gelir. Yukarı kaydırınca yanıttaki `nextBeforeDate` ve `nextBeforeId` değerlerini `beforeDate` ve `beforeId` olarak gönderin. `hasMore == false` olduğunda sohbetin başına gelinmiştir. `pageSize` en fazla 50 olabilir. Ayrıntı için [Mesaj geçmişi](#mesaj-geçmişi-sonsuz-kaydırma) bölümüne bakın. |
| `conversationWindowGet(phoneNumber:)` | WhatsApp 24 saat penceresi. `isOpen == false` ise müşteri son 24 saatte yazmamıştır ve serbest mesaj gönderilemez, mesaj kutusunu kapatın. `remainingSeconds` geri sayım için kullanılabilir. |
| `conversationChatbotGet(phoneNumber:)` | AI chatbot bu sohbette açık mı (`data: Bool`). `true` ise AI müşteriye otomatik cevap verir. |
| `conversationAssignableusersGet()` | Sohbetin devredilebileceği temsilciler: aynı işletmenin şu an çevrimiçi olan temsilcileri, giriş yapan kullanıcı hariç. |

**Atama ve durum**

| Metot | Ne yapar |
|---|---|
| `conversationAssigntomePost(assignConversationToMeCommand: AssignConversationToMeCommand(phoneNumber:))` | Sohbeti giriş yapan temsilcinin üzerine alır ("Üstüme al"). Kullanıcı çevrimiçi olmalıdır. |
| `conversationAssignPost(assignConversationCommand: AssignConversationCommand(phoneNumber:userId:))` | Size atanmış sohbeti başka bir temsilciye devreder. `userId` değerini `conversationAssignableusersGet` listesinden alın. |
| `conversationMarkasreadPost(phoneNumberRequest: PhoneNumberRequest(phoneNumber:))` | Okundu olarak işaretler, okunmadı rozeti kalkar. Müşteriden yeni mesaj gelince rozet yeniden görünür. |
| `conversationMarkasunreadPost(phoneNumberRequest: PhoneNumberRequest(phoneNumber:))` | Okunmadı olarak işaretler. |
| `conversationChatbotPost(setChatBotCommand: SetChatBotCommand(phoneNumber:isActive:))` | AI chatbot'u açar ya da kapatır. `isActive` istenen durumdur. Numara kişilerde kayıtlı değilse `success == false` döner. |
| `conversationTerminatePost(terminateConversationCommand: TerminateConversationCommand(phoneNumber:))` | Görüşmeyi sonlandırır: ticket kapanır ve atama kaldırılır. ⚠️ İşletmenin tanımlı bir kapanış mesajı varsa ve pencere açıksa bu mesaj müşteriye gönderilir. Sohbet size atanmış olmalıdır. |

**Mesaj gönderme.** Tümünde sohbet size atanmış ve 24 saat penceresi açık olmalıdır. Değilse `success == false` döner.

| Metot | Ne yapar |
|---|---|
| ⚠️ `conversationSendPost(sendConversationMessageCommand: SendConversationMessageCommand(...))` | Metin ya da konum gönderir. **Metin:** `phoneNumber` + `text`. **Konum:** `phoneNumber` + `latitude` + `longitude` (nokta ondalıklı metin, ör. `"41.0082"`). **Yanıt (alıntı):** ayrıca `externalIdOfReplied` = yanıtlanan mesajın `externalId` değeri. |
| ⚠️ `conversationSendmediaPost(phoneNumber:file:caption:externalIdOfReplied:)` | Dosya gönderir. `file` cihazdaki dosyanın yerel `URL`'idir. Desteklenen türler: resim jpg/jpeg/png (en fazla 5 MB), video mp4, ses mp3/m4a, doküman pdf (hepsi en fazla 16 MB). `caption` yalnızca resim ve videoda müşteriye gider. |
| ⚠️ `conversationSendfeedbackPost(sendFeedbackMessageCommand: SendFeedbackMessageCommand(phoneNumber:))` | Memnuniyet (NPS) puanlama mesajı gönderir. Ardından ticket durumu "Kapanış bekliyor" (`._3`) olur. |

Gönderdiğiniz mesaj canlı bağlantıda `receiveMessage` olayıyla da gelir. Listeye eklemek için bu olayı bekleyebilirsiniz.

### ContactAPI: Kişiler

Tüm kişi metotları `contactspermission` yetkisi ister.

| Metot | Ne yapar |
|---|---|
| `contactListGet(search:tagId:isAcceptPublications:currentPage:pageSize:)` | Kişileri sayfalı listeler, en son eklenen önce gelir. `search` ad soyad ve telefonda arar. `tagId` ve `isAcceptPublications` filtreleri birlikte kullanılabilir. |
| `contactDetailGet(id:)` | Kişinin tüm bilgileri (düzenleme formu için). |
| `contactCitiesGet(Q:)` | Şehir seçimi için şehir listesi. `Q` şehir adında ya da plaka kodunda arar (`"ist"`, `"34"`), boşsa tüm şehirler döner. |
| `contactCreatePost(createContactCommand: CreateContactCommand(...))` | Yeni kişi ekler. Zorunlu alanlar `fullName` ve `phoneNumber`. Telefon `05321112233` ya da `5321112233` biçiminde de yazılabilir, sunucu `90…` biçimine çevirir. Aynı numara kayıtlıysa `success == false` döner. Yanıt eklenen kişinin detayıdır. |
| `contactUpdatePost(updateContactCommand: UpdateContactCommand(..., id:))` | Kişiyi günceller. **Tüm form alanlarını gönderin**, gönderilmeyen alan boşaltılır. Engelleme bu metotla değişmez. |
| `contactDeletePost(deleteContactCommand: DeleteContactCommand(id:))` | Kişiyi siler. Geçmiş mesajlar kalır, sohbet kayıtsız numara olarak görünmeye devam eder. |
| `contactBlockPost(setContactBlockedCommand: SetContactBlockedCommand(id:isBlocked:))` | WhatsApp'ta engeller ya da engeli kaldırır. WhatsApp kuralı gereği genelde yalnızca son 24 saatte yazmış müşteriler engellenebilir. |

### TagAPI: Etiketler

| Metot | Yetki | Ne yapar |
|---|---|---|
| `tagListGet(search:currentPage:pageSize:)` | `taglistpermission` | İşletmenin etiketlerini sayfalı listeler. |
| `tagContacttagsGet(contactId:)` | yok | Bir kişinin etiket ekranı: işletmenin tüm etiketleri döner, kişiye ekli olanlarda `isAssigned == true` olur. |
| `tagAddcontacttagPost(addContactTagCommand: AddContactTagCommand(contactId:tagId:))` | yok | Kişiye etiket ekler. Zaten ekliyse de `data == true` döner, tekrar denemek güvenlidir. |
| `tagRemovecontacttagPost(removeContactTagCommand: RemoveContactTagCommand(contactId:tagId:))` | yok | Kişiden etiketi kaldırır. |
| `tagCreatePost(createTagCommand: CreateTagCommand(title:description:))` | `tagcreatepermission` | Yeni etiket ekler. Aynı adda etiket varsa `success == false` döner. |
| `tagUpdatePost(updateTagCommand: UpdateTagCommand(id:title:description:))` | `tageditpermission` | Etiketin adını ve açıklamasını günceller. |
| `tagDeletePost(deleteTagCommand: DeleteTagCommand(id:))` | `tagdeletepermission` | Etiketi siler. Etiket tüm kişilerden de kaldırılır. |

### RealtimeAPI: Canlı bağlantı

| Metot | Ne yapar |
|---|---|
| `realtimeTokenGet()` | Canlı mesaj bağlantısı için 24 saat geçerli token (`token`, `expiresAt`). [Canlı mesajlar](#canlı-mesajlar-realtime) bölümüne bakın. |

---

## Sık kullanılan akışlar

### Sohbet ekranı

```swift
let phone = conversation.phoneNumber!   // conversationListGet'ten

// Ekran açılırken
async let messages = ConversationAPI.conversationMessagesGet(phoneNumber: phone)
async let window   = ConversationAPI.conversationWindowGet(phoneNumber: phone)
let (m, w) = try await (messages, window)

let canType = w.data?.isOpen == true            // false → mesaj kutusunu kapat
let isMine  = conversation.ticket?.assignedUserId == currentUserId
// isMine false ise "Üstüme al" düğmesi göster → conversationAssigntomePost

_ = try await ConversationAPI.conversationMarkasreadPost(
    phoneNumberRequest: PhoneNumberRequest(phoneNumber: phone))

// Mesaj gönder
let r = try await ConversationAPI.conversationSendPost(
    sendConversationMessageCommand: SendConversationMessageCommand(phoneNumber: phone, text: "Merhaba"))
if r.success != true { showAlert(r.message ?? "Gönderilemedi") }
```

### Mesaj geçmişi (sonsuz kaydırma)

```swift
var beforeDate: Int64? = nil
var beforeId: Int? = nil
var hasMore = true

func loadOlder() async throws {
    guard hasMore else { return }
    let r = try await ConversationAPI.conversationMessagesGet(
        phoneNumber: phone, beforeDate: beforeDate, beforeId: beforeId, pageSize: 30)
    let page = r.data?.messages ?? []           // eskiden yeniye sıralı
    messages.insert(contentsOf: page, at: 0)    // listenin başına ekle
    beforeDate = r.data?.nextBeforeDate
    beforeId   = r.data?.nextBeforeId
    hasMore    = r.data?.hasMore ?? false
}
```

Mesaj alanları:
- `isIncoming == true` ise mesaj müşteriden gelmiştir (sol balon).
- `isInternalNote == true` ise mesaj otomasyonların bıraktığı iç nottur. Müşteri bunu görmez, farklı bir stille gösterin.
- `text` gösterilecek düz metindir.
- `mediaUrl` medya mesajlarında dosyanın adresidir.
- `contentJson` liste, sipariş, ürün kartı, konum gibi zengin tiplerin ham JSON içeriğidir.
- `repliedTo` alıntılanan mesajdır.
- `sentByFullName` mesajı gönderen temsilcinin adıdır.

### Kişi etiketleri ekranı

```swift
let r = try await TagAPI.tagContacttagsGet(contactId: contactId)
// r.data: tüm etiketler; isAssigned == true olanlar seçili gösterilir

// Kullanıcı bir etiketi işaretlediğinde / kaldırdığında
_ = try await TagAPI.tagAddcontacttagPost(
    addContactTagCommand: AddContactTagCommand(contactId: contactId, tagId: tag.id))
_ = try await TagAPI.tagRemovecontacttagPost(
    removeContactTagCommand: RemoveContactTagCommand(contactId: contactId, tagId: tag.id))
```

---

## Canlı mesajlar (realtime)

Uygulama açıkken yeni mesajları anlık almak için SignalR bağlantısı kullanılır. Sohbet listesini tekrar tekrar
sorgulamanıza gerek kalmaz. **Bu SDK SignalR istemcisi içermez.** Ayrı bir Swift SignalR kütüphanesi
(WebSockets taşıması) eklemeniz gerekir.

1. `RealtimeAPI.realtimeTokenGet()` ile `token` alın.
2. Hub'a bağlanın: `wss://{hookman adresi}/hub?token={token}`. Token'ı URL-encode edin. Hub adresini backend ekibinden alın.
3. Şu olayları dinleyin:
   - `receiveMessage(json)`: gelen ya da giden yeni mesaj (JSON metni)
   - `assign(json)`: sohbetin atandığı temsilci değişti
   - `updateTicketStatus(phoneNumber, status)`: görüşme sonlandırıldı ya da ticket durumu değişti
4. Bir mesaj ekranda görüntülendiğinde hub'da `MarkMessageInboundAsRead(externalId)` metodunu çağırabilirsiniz.
5. `expiresAt` dolmadan yeni token alıp yeniden bağlanın. Süresi dolan token'la hub bağlantıyı kapatır.

Token işletme bazlıdır: işletmenin tüm sohbetlerinin olayları gelir. Uygulama kapalıyken bağlantı yoktur.

---

## Enum değerleri

Swift'te case adları sayıdır (`._1`). Sunucunun gönderdiği ama SDK'nın tanımadığı bir değer gelirse hata
fırlatılmaz, değer `.unknownDefaultOpenApi` olur. Bu durumu "Bilinmiyor" olarak gösterin.

**`UserType`** (kullanıcı tipi): `0` Belirsiz · `1` Yönetici · `2` Kullanıcı

**`TicketStatus`** (görüşme durumu): `1` Açık · `2` İşlemde · `3` Kapanış bekliyor · `4` Kapalı · `5` Temsilci talep edildi

**`MessageSenderType`** (mesajı gönderen): `0` Bilinmiyor · `1` Müşteri · `2` Temsilci · `3` AI · `4` Otomasyon · `5` Kampanya · `6` Sistem

**`Gender`**: `1` Kadın · `2` Erkek

**`LanguageType`**: `1` Türkçe · `2` İngilizce

**`IsAcceptPublications`** (ticari ileti izni): `0` Belirsiz · `1` İzin verdi · `2` İzin vermedi

**`MessageType`**:

| Değer | Tip | Değer | Tip |
|---|---|---|---|
| `0` | Desteklenmeyen | `10` | Ürün kartı |
| `1` | Metin | `11` | Sipariş |
| `2` | Resim | `12` | Konum |
| `3` | Ses | `13` | Ödeme bağlantısı |
| `4` | Video | `14` | Düğme yanıtı |
| `5` | Dosya | `15` | Şablon mesaj |
| `6` | Hızlı yanıt | `16` | Konum isteği |
| `7` | Liste yanıtı | `17` | Bağlantı düğmesi (CTA URL) |
| `8` | Liste | `18` | Çıkartma (sticker) |
| `9` | Kişi kartı | | |

Arayüzde okunabilir ad göstermek için kendi uzantınızı yazabilirsiniz:

```swift
extension TicketStatus {
    var title: String {
        switch self {
        case ._1: return "Açık"
        case ._2: return "İşlemde"
        case ._3: return "Kapanış bekliyor"
        case ._4: return "Kapalı"
        case ._5: return "Temsilci talep edildi"
        case .unknownDefaultOpenApi: return "Bilinmiyor"
        }
    }
}
```

---

## SDK hakkında

- Bu SDK, API'nin OpenAPI şemasından [OpenAPI Generator](https://openapi-generator.tech) (swift5) ile üretilir.
  `Sources/` altındaki kodu elle değiştirmeyin, değişiklikler bir sonraki üretimde kaybolur.
- Model ve metotların alan alan ayrıntısı [`docs/`](docs/) klasöründedir.
- Bu README elle yazılmıştır ve `.openapi-generator-ignore` sayesinde yeniden üretimde ezilmez.
  API değiştiğinde güncellenmelidir.
