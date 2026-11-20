# TagAPI

All URIs are relative to *https://api.whappio.com*

Method | HTTP request | Description
------------- | ------------- | -------------
[**tagAddcontacttagPost**](TagAPI.md#tagaddcontacttagpost) | **POST** /tag/addcontacttag | Kişiye etiket ekler.
[**tagContacttagsGet**](TagAPI.md#tagcontacttagsget) | **GET** /tag/contacttags | Bir kişinin etiket ekranı: işletmenin tüm etiketleri, kişiye ekli olanlar işaretli.
[**tagCreatePost**](TagAPI.md#tagcreatepost) | **POST** /tag/create | Yeni etiket ekler.
[**tagDeletePost**](TagAPI.md#tagdeletepost) | **POST** /tag/delete | Etiketi siler.
[**tagListGet**](TagAPI.md#taglistget) | **GET** /tag/list | İşletmenin etiketlerini sayfalı listeler.
[**tagRemovecontacttagPost**](TagAPI.md#tagremovecontacttagpost) | **POST** /tag/removecontacttag | Kişiden etiketi kaldırır.
[**tagUpdatePost**](TagAPI.md#tagupdatepost) | **POST** /tag/update | Etiketin adını ve açıklamasını günceller.


# **tagAddcontacttagPost**
```swift
    open class func tagAddcontacttagPost(addContactTagCommand: AddContactTagCommand? = nil, completion: @escaping (_ data: BooleanApiReturn?, _ error: Error?) -> Void)
```

Kişiye etiket ekler.

Ek yetki gerekmez. Etiket zaten ekliyse hata vermez, yine `data` = true döner (tekrar denemek güvenlidir).  Kişi veya etiket bulunamazsa `success:false` döner.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import BasefyWhappioSDK

let addContactTagCommand = AddContactTagCommand(contactId: 123, tagId: 123) // AddContactTagCommand |  (optional)

// Kişiye etiket ekler.
TagAPI.tagAddcontacttagPost(addContactTagCommand: addContactTagCommand) { (response, error) in
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
 **addContactTagCommand** | [**AddContactTagCommand**](AddContactTagCommand.md) |  | [optional] 

### Return type

[**BooleanApiReturn**](BooleanApiReturn.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json, text/json, application/*+json
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **tagContacttagsGet**
```swift
    open class func tagContacttagsGet(contactId: Int? = nil, completion: @escaping (_ data: ContactTagDtoListApiReturn?, _ error: Error?) -> Void)
```

Bir kişinin etiket ekranı: işletmenin tüm etiketleri, kişiye ekli olanlar işaretli.

Ek yetki gerekmez. Her etikette `isAssigned` = true ise etiket kişide ekli, false ise eklenebilir.  Kişi bulunamazsa `success:false` döner.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import BasefyWhappioSDK

let contactId = 987 // Int | Kişi id'si (contact/list veya conversation/list içindeki contact.id). (optional)

// Bir kişinin etiket ekranı: işletmenin tüm etiketleri, kişiye ekli olanlar işaretli.
TagAPI.tagContacttagsGet(contactId: contactId) { (response, error) in
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
 **contactId** | **Int** | Kişi id&#39;si (contact/list veya conversation/list içindeki contact.id). | [optional] 

### Return type

[**ContactTagDtoListApiReturn**](ContactTagDtoListApiReturn.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **tagCreatePost**
```swift
    open class func tagCreatePost(createTagCommand: CreateTagCommand? = nil, completion: @escaping (_ data: TagDtoApiReturn?, _ error: Error?) -> Void)
```

Yeni etiket ekler.

Yetki: `tagcreatepermission`. Aynı adda etiket varsa `success:false` döner. Yanıt eklenen etikettir.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import BasefyWhappioSDK

let createTagCommand = CreateTagCommand(title: "title_example", description: "description_example") // CreateTagCommand |  (optional)

// Yeni etiket ekler.
TagAPI.tagCreatePost(createTagCommand: createTagCommand) { (response, error) in
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
 **createTagCommand** | [**CreateTagCommand**](CreateTagCommand.md) |  | [optional] 

### Return type

[**TagDtoApiReturn**](TagDtoApiReturn.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json, text/json, application/*+json
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **tagDeletePost**
```swift
    open class func tagDeletePost(deleteTagCommand: DeleteTagCommand? = nil, completion: @escaping (_ data: BooleanApiReturn?, _ error: Error?) -> Void)
```

Etiketi siler.

Yetki: `tagdeletepermission`. Etiket, eklenmiş olduğu tüm kişilerden de kaldırılır. `data` = true.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import BasefyWhappioSDK

let deleteTagCommand = DeleteTagCommand(id: 123) // DeleteTagCommand |  (optional)

// Etiketi siler.
TagAPI.tagDeletePost(deleteTagCommand: deleteTagCommand) { (response, error) in
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
 **deleteTagCommand** | [**DeleteTagCommand**](DeleteTagCommand.md) |  | [optional] 

### Return type

[**BooleanApiReturn**](BooleanApiReturn.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json, text/json, application/*+json
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **tagListGet**
```swift
    open class func tagListGet(search: String? = nil, currentPage: Int? = nil, pageSize: Int? = nil, completion: @escaping (_ data: TagDtoPagedApiReturn?, _ error: Error?) -> Void)
```

İşletmenin etiketlerini sayfalı listeler.

Yetki: `taglistpermission`. En son eklenen etiket önce gelir. `search` etiket adı ve açıklamasında arar.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import BasefyWhappioSDK

let search = "search_example" // String | Etiket adında veya açıklamasında geçen metin. Boş bırakılırsa tüm etiketler. (optional)
let currentPage = 987 // Int | İstenen sayfa (1'den başlar). Varsayılan: 1. (optional)
let pageSize = 987 // Int | Sayfa başına kayıt. Varsayılan: 20, en fazla: 100. (optional)

// İşletmenin etiketlerini sayfalı listeler.
TagAPI.tagListGet(search: search, currentPage: currentPage, pageSize: pageSize) { (response, error) in
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
 **search** | **String** | Etiket adında veya açıklamasında geçen metin. Boş bırakılırsa tüm etiketler. | [optional] 
 **currentPage** | **Int** | İstenen sayfa (1&#39;den başlar). Varsayılan: 1. | [optional] 
 **pageSize** | **Int** | Sayfa başına kayıt. Varsayılan: 20, en fazla: 100. | [optional] 

### Return type

[**TagDtoPagedApiReturn**](TagDtoPagedApiReturn.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **tagRemovecontacttagPost**
```swift
    open class func tagRemovecontacttagPost(removeContactTagCommand: RemoveContactTagCommand? = nil, completion: @escaping (_ data: BooleanApiReturn?, _ error: Error?) -> Void)
```

Kişiden etiketi kaldırır.

Ek yetki gerekmez. Etiket zaten ekli değilse hata vermez, yine `data` = true döner.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import BasefyWhappioSDK

let removeContactTagCommand = RemoveContactTagCommand(contactId: 123, tagId: 123) // RemoveContactTagCommand |  (optional)

// Kişiden etiketi kaldırır.
TagAPI.tagRemovecontacttagPost(removeContactTagCommand: removeContactTagCommand) { (response, error) in
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
 **removeContactTagCommand** | [**RemoveContactTagCommand**](RemoveContactTagCommand.md) |  | [optional] 

### Return type

[**BooleanApiReturn**](BooleanApiReturn.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json, text/json, application/*+json
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **tagUpdatePost**
```swift
    open class func tagUpdatePost(updateTagCommand: UpdateTagCommand? = nil, completion: @escaping (_ data: TagDtoApiReturn?, _ error: Error?) -> Void)
```

Etiketin adını ve açıklamasını günceller.

Yetki: `tageditpermission`. Yeni ad başka bir etiketle aynıysa ya da etiket bulunamazsa `success:false` döner.  Yanıt güncellenmiş etikettir.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import BasefyWhappioSDK

let updateTagCommand = UpdateTagCommand(id: 123, title: "title_example", description: "description_example") // UpdateTagCommand |  (optional)

// Etiketin adını ve açıklamasını günceller.
TagAPI.tagUpdatePost(updateTagCommand: updateTagCommand) { (response, error) in
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
 **updateTagCommand** | [**UpdateTagCommand**](UpdateTagCommand.md) |  | [optional] 

### Return type

[**TagDtoApiReturn**](TagDtoApiReturn.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json, text/json, application/*+json
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

