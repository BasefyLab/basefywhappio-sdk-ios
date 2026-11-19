# MeAPI

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**meStatusGet**](MeAPI.md#mestatusget) | **GET** /me/status | Kullanıcının çevrimiçi olup olmadığını döner.
[**meStatusPost**](MeAPI.md#mestatuspost) | **POST** /me/status | Kullanıcıyı çevrimiçi veya çevrimdışı yapar.


# **meStatusGet**
```swift
    open class func meStatusGet(completion: @escaping (_ data: BooleanApiReturn?, _ error: Error?) -> Void)
```

Kullanıcının çevrimiçi olup olmadığını döner.

`data` = true: çevrimiçi; sohbetler bu temsilciye atanabilir ve conversation/assigntome kullanılabilir.  false: çevrimdışı. Durum web panelle ortaktır (web'de değiştirilirse burada da görünür).

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import BasefyWhappioSDK


// Kullanıcının çevrimiçi olup olmadığını döner.
MeAPI.meStatusGet() { (response, error) in
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

[**BooleanApiReturn**](BooleanApiReturn.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **meStatusPost**
```swift
    open class func meStatusPost(setMyStatusCommand: SetMyStatusCommand? = nil, completion: @escaping (_ data: BooleanApiReturn?, _ error: Error?) -> Void)
```

Kullanıcıyı çevrimiçi veya çevrimdışı yapar.

`isOnline` istenen durumdur (değiştirme değil; tekrar göndermek durumu geri çevirmez).                - **true:** Çevrimiçi olunur. Yeni sohbetler bu temsilciye otomatik atanabilir, \"üstüme al\" kullanılabilir.  - **false:** Çevrimdışı olunur. Üzerindeki kapanmamış sohbetlerin ataması kaldırılır (havuza bırakılır) ve    açık ekranlar canlı bağlantıda `assign` olayıyla (`UserId` = 0) güncellenir.                Durum web panelle ortaktır. `data` = yeni durum.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import BasefyWhappioSDK

let setMyStatusCommand = SetMyStatusCommand(isOnline: false) // SetMyStatusCommand |  (optional)

// Kullanıcıyı çevrimiçi veya çevrimdışı yapar.
MeAPI.meStatusPost(setMyStatusCommand: setMyStatusCommand) { (response, error) in
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
 **setMyStatusCommand** | [**SetMyStatusCommand**](SetMyStatusCommand.md) |  | [optional] 

### Return type

[**BooleanApiReturn**](BooleanApiReturn.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json, text/json, application/*+json
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

