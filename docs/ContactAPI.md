# ContactAPI

All URIs are relative to *https://api.whappio.com*

Method | HTTP request | Description
------------- | ------------- | -------------
[**contactBlockPost**](ContactAPI.md#contactblockpost) | **POST** /contact/block | Kişiyi WhatsApp&#39;ta engeller veya engelini kaldırır.
[**contactCitiesGet**](ContactAPI.md#contactcitiesget) | **GET** /contact/cities | Kişi formundaki şehir seçimi için şehirleri listeler.
[**contactCreatePost**](ContactAPI.md#contactcreatepost) | **POST** /contact/create | Yeni kişi ekler.
[**contactDeletePost**](ContactAPI.md#contactdeletepost) | **POST** /contact/delete | Kişiyi siler.
[**contactDetailGet**](ContactAPI.md#contactdetailget) | **GET** /contact/detail | Kişinin tüm bilgilerini döner (düzenleme formu bu verilerle doldurulur).
[**contactListGet**](ContactAPI.md#contactlistget) | **GET** /contact/list | İşletmenin kişilerini sayfalı listeler.
[**contactUpdatePost**](ContactAPI.md#contactupdatepost) | **POST** /contact/update | Kişi bilgilerini günceller.


# **contactBlockPost**
```swift
    open class func contactBlockPost(setContactBlockedCommand: SetContactBlockedCommand? = nil, completion: @escaping (_ data: BooleanApiReturn?, _ error: Error?) -> Void)
```

Kişiyi WhatsApp'ta engeller veya engelini kaldırır.

Yetki: `contactspermission`. Engelli kişiden işletmeye mesaj gelmez.                - `isBlocked` istenen durumdur (true = engelle, false = engeli kaldır); kişi zaten o durumdaysa hiçbir    işlem yapılmadan `data` = true döner.  - İşlem WhatsApp (GupShup) tarafında yapılır ve başarısız olursa kişi değişmez, `success:false` döner.    WhatsApp kuralı gereği genellikle yalnızca son 24 saatte işletmeye yazmış müşteriler engellenebilir.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import BasefyWhappioSDK

let setContactBlockedCommand = SetContactBlockedCommand(id: 123, isBlocked: false) // SetContactBlockedCommand |  (optional)

// Kişiyi WhatsApp'ta engeller veya engelini kaldırır.
ContactAPI.contactBlockPost(setContactBlockedCommand: setContactBlockedCommand) { (response, error) in
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
 **setContactBlockedCommand** | [**SetContactBlockedCommand**](SetContactBlockedCommand.md) |  | [optional] 

### Return type

[**BooleanApiReturn**](BooleanApiReturn.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json, text/json, application/*+json
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **contactCitiesGet**
```swift
    open class func contactCitiesGet(Q: String? = nil, completion: @escaping (_ data: CityDtoListApiReturn?, _ error: Error?) -> Void)
```

Kişi formundaki şehir seçimi için şehirleri listeler.

Yetki: `contactspermission`. `q` şehir adında veya plaka kodunda arar (ör. \"ist\", \"34\"); boşsa tüm  şehirler alfabetik döner. Sayfalanmaz.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import BasefyWhappioSDK

let Q = "Q_example" // String | Şehir adında veya plaka kodunda geçen metin (ör. \"ist\" veya \"34\"). Boş bırakılırsa tüm şehirler. (optional)

// Kişi formundaki şehir seçimi için şehirleri listeler.
ContactAPI.contactCitiesGet(Q: Q) { (response, error) in
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
 **Q** | **String** | Şehir adında veya plaka kodunda geçen metin (ör. \&quot;ist\&quot; veya \&quot;34\&quot;). Boş bırakılırsa tüm şehirler. | [optional] 

### Return type

[**CityDtoListApiReturn**](CityDtoListApiReturn.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **contactCreatePost**
```swift
    open class func contactCreatePost(createContactCommand: CreateContactCommand? = nil, completion: @escaping (_ data: ContactDetailDtoApiReturn?, _ error: Error?) -> Void)
```

Yeni kişi ekler.

Yetki: `contactspermission`. Zorunlu alanlar: `fullName`, `phoneNumber`; diğerleri null bırakılabilir.                - Telefon 905321112233, 05321112233, 5321112233 gibi yazılabilir; 905321112233 biçiminde kaydedilir.    Aynı numarayla kayıtlı kişi varsa `success:false` döner.  - `dateOfBirth` ISO biçiminde gönderilir: \"1990-01-31\".  - `cityId` contact/cities listesinden seçilir.  - Yeni kişide AI chatbot açık başlar.                Yanıt eklenen kişinin detayıdır.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import BasefyWhappioSDK

let createContactCommand = CreateContactCommand(fullName: "fullName_example", emailAddress: "emailAddress_example", phoneNumber: "phoneNumber_example", gender: Gender(), dateOfBirth: Date(), cityId: 123, languageType: LanguageType(), isAcceptPublications: IsAcceptPublications()) // CreateContactCommand |  (optional)

// Yeni kişi ekler.
ContactAPI.contactCreatePost(createContactCommand: createContactCommand) { (response, error) in
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
 **createContactCommand** | [**CreateContactCommand**](CreateContactCommand.md) |  | [optional] 

### Return type

[**ContactDetailDtoApiReturn**](ContactDetailDtoApiReturn.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json, text/json, application/*+json
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **contactDeletePost**
```swift
    open class func contactDeletePost(deleteContactCommand: DeleteContactCommand? = nil, completion: @escaping (_ data: BooleanApiReturn?, _ error: Error?) -> Void)
```

Kişiyi siler.

Yetki: `contactspermission`. Kişi listeden kalkar; geçmiş mesajlar silinmez, sohbet listede kayıtsız  numara olarak görünmeye devam eder. `data` = true.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import BasefyWhappioSDK

let deleteContactCommand = DeleteContactCommand(id: 123) // DeleteContactCommand |  (optional)

// Kişiyi siler.
ContactAPI.contactDeletePost(deleteContactCommand: deleteContactCommand) { (response, error) in
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
 **deleteContactCommand** | [**DeleteContactCommand**](DeleteContactCommand.md) |  | [optional] 

### Return type

[**BooleanApiReturn**](BooleanApiReturn.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json, text/json, application/*+json
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **contactDetailGet**
```swift
    open class func contactDetailGet(id: Int? = nil, completion: @escaping (_ data: ContactDetailDtoApiReturn?, _ error: Error?) -> Void)
```

Kişinin tüm bilgilerini döner (düzenleme formu bu verilerle doldurulur).

Yetki: `contactspermission`. Kişi bulunamazsa `success:false` döner.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import BasefyWhappioSDK

let id = 987 // Int | Kişi id'si. (optional)

// Kişinin tüm bilgilerini döner (düzenleme formu bu verilerle doldurulur).
ContactAPI.contactDetailGet(id: id) { (response, error) in
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
 **id** | **Int** | Kişi id&#39;si. | [optional] 

### Return type

[**ContactDetailDtoApiReturn**](ContactDetailDtoApiReturn.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **contactListGet**
```swift
    open class func contactListGet(search: String? = nil, tagId: Int? = nil, isAcceptPublications: IsAcceptPublications? = nil, currentPage: Int? = nil, pageSize: Int? = nil, completion: @escaping (_ data: ContactListItemDtoPagedApiReturn?, _ error: Error?) -> Void)
```

İşletmenin kişilerini sayfalı listeler.

Yetki: `contactspermission`. En son eklenen kişi önce gelir. Filtreler birlikte kullanılabilir:  `search` ad soyad ve telefonda arar, `tagId` yalnızca o etikete sahip kişileri, `isAcceptPublications`  yalnızca o ileti izni durumundaki kişileri getirir.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import BasefyWhappioSDK

let search = "search_example" // String | Ad soyad veya telefonda geçen metin. Boş bırakılırsa filtre uygulanmaz. (optional)
let tagId = 987 // Int | Yalnızca bu etikete sahip kişiler. Boş bırakılırsa filtre uygulanmaz. (optional)
let isAcceptPublications = IsAcceptPublications() // IsAcceptPublications | Ticari ileti izni filtresi: 0 = Belirsiz, 1 = İzin verdi, 2 = İzin vermedi. Boş bırakılırsa filtre uygulanmaz. (optional)
let currentPage = 987 // Int | İstenen sayfa (1'den başlar). Varsayılan: 1. (optional)
let pageSize = 987 // Int | Sayfa başına kayıt. Varsayılan: 20, en fazla: 100. (optional)

// İşletmenin kişilerini sayfalı listeler.
ContactAPI.contactListGet(search: search, tagId: tagId, isAcceptPublications: isAcceptPublications, currentPage: currentPage, pageSize: pageSize) { (response, error) in
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
 **search** | **String** | Ad soyad veya telefonda geçen metin. Boş bırakılırsa filtre uygulanmaz. | [optional] 
 **tagId** | **Int** | Yalnızca bu etikete sahip kişiler. Boş bırakılırsa filtre uygulanmaz. | [optional] 
 **isAcceptPublications** | [**IsAcceptPublications**](.md) | Ticari ileti izni filtresi: 0 &#x3D; Belirsiz, 1 &#x3D; İzin verdi, 2 &#x3D; İzin vermedi. Boş bırakılırsa filtre uygulanmaz. | [optional] 
 **currentPage** | **Int** | İstenen sayfa (1&#39;den başlar). Varsayılan: 1. | [optional] 
 **pageSize** | **Int** | Sayfa başına kayıt. Varsayılan: 20, en fazla: 100. | [optional] 

### Return type

[**ContactListItemDtoPagedApiReturn**](ContactListItemDtoPagedApiReturn.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **contactUpdatePost**
```swift
    open class func contactUpdatePost(updateContactCommand: UpdateContactCommand? = nil, completion: @escaping (_ data: ContactDetailDtoApiReturn?, _ error: Error?) -> Void)
```

Kişi bilgilerini günceller.

Yetki: `contactspermission`. Tüm form alanları gönderilir (gönderilmeyen alan boşaltılır); kurallar  contact/create ile aynıdır. Engelleme bu uçla değiştirilmez, contact/block kullanılır.  Yanıt güncellenmiş kişinin detayıdır.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import BasefyWhappioSDK

let updateContactCommand = UpdateContactCommand(fullName: "fullName_example", emailAddress: "emailAddress_example", phoneNumber: "phoneNumber_example", gender: Gender(), dateOfBirth: Date(), cityId: 123, languageType: LanguageType(), isAcceptPublications: IsAcceptPublications(), id: 123) // UpdateContactCommand |  (optional)

// Kişi bilgilerini günceller.
ContactAPI.contactUpdatePost(updateContactCommand: updateContactCommand) { (response, error) in
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
 **updateContactCommand** | [**UpdateContactCommand**](UpdateContactCommand.md) |  | [optional] 

### Return type

[**ContactDetailDtoApiReturn**](ContactDetailDtoApiReturn.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json, text/json, application/*+json
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

