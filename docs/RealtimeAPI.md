# RealtimeAPI

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**realtimeTokenGet**](RealtimeAPI.md#realtimetokenget) | **GET** /realtime/token | Canlı mesaj bağlantısı (SignalR hub) için 24 saat geçerli bağlantı token&#39;ı üretir.


# **realtimeTokenGet**
```swift
    open class func realtimeTokenGet(completion: @escaping (_ data: RealtimeTokenDtoApiReturn?, _ error: Error?) -> Void)
```

Canlı mesaj bağlantısı (SignalR hub) için 24 saat geçerli bağlantı token'ı üretir.

Uygulama açıkken yeni mesajları anlık almak için kullanılır (web panelle aynı altyapı).                1. Bu uçtan `token` alınır.  2. Hookman hub'ına bağlanılır: `wss://{hookman adresi}/hub?token={token}` (SignalR istemcisi, WebSockets).  3. Olaylar dinlenir:     - `receiveMessage(json)`: gelen veya giden yeni mesaj (JSON metni).     - `assign(json)`: sohbetin atandığı temsilci değişti.     - `updateTicketStatus(phoneNumber, status)`: görüşme sonlandırıldı veya ticket durumu değişti.  4. Mesaj görüntülendiğinde hub'a `MarkMessageInboundAsRead(externalId)` çağrılabilir.  5. `expiresAt` dolmadan yeni token alınıp yeniden bağlanılır; süresi dolmuş token'la hub bağlantıyı kapatır.                Token işletme (tenant) bazlıdır: işletmenin tüm sohbetlerinin olayları gelir. Uygulama kapalıyken  bağlantı yoktur.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import BasefyWhappioSDK


// Canlı mesaj bağlantısı (SignalR hub) için 24 saat geçerli bağlantı token'ı üretir.
RealtimeAPI.realtimeTokenGet() { (response, error) in
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
This endpoint does not need any parameter.

### Return type

[**RealtimeTokenDtoApiReturn**](RealtimeTokenDtoApiReturn.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

