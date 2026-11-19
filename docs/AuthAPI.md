# AuthAPI

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**authLoginPost**](AuthAPI.md#authloginpost) | **POST** /auth/login | Kullanıcı adı ve parola ile giriş yapar, JWT döner.


# **authLoginPost**
```swift
    open class func authLoginPost(loginRequest: LoginRequest? = nil, completion: @escaping (_ data: LoginResponseApiReturn?, _ error: Error?) -> Void)
```

Kullanıcı adı ve parola ile giriş yapar, JWT döner.

Backoffice kullanıcı adı/parolası kullanılır. Dönen `data.token` diğer tüm isteklerde  `Authorization: Bearer {token}` başlığıyla gönderilir.                - Token uzun ömürlüdür (ayara bağlı, şu an 200 gün); yenileme (refresh) ucu yoktur. Herhangi bir uç    HTTP 401 döndüğünde kullanıcı yeniden giriş yapmalıdır.  - Hatalı parola, kilitli hesap, pasif hesap veya işletmeye bağlı olmayan hesapta HTTP 200 +    `success:false` ve açıklayıcı `message` döner.  - Art arda hatalı denemelerde bekleme süresi uygulanır ve hesap kilitlenebilir (Backoffice ile ortak sayaç).  - `permissions` yalnızca menü/buton göstermek içindir; yetki her istekte sunucuda yeniden kontrol edilir.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import BasefyWhappioSDK

let loginRequest = LoginRequest(username: "username_example", password: "password_example") // LoginRequest |  (optional)

// Kullanıcı adı ve parola ile giriş yapar, JWT döner.
AuthAPI.authLoginPost(loginRequest: loginRequest) { (response, error) in
    guard error == nil else {
        print(error)
        return
    }

    if (response) {
        dump(response)
    }
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **loginRequest** | [**LoginRequest**](LoginRequest.md) |  | [optional] 

### Return type

[**LoginResponseApiReturn**](LoginResponseApiReturn.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json, text/json, application/*+json
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

