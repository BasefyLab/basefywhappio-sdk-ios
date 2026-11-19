# ConversationAPI

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**conversationAssignPost**](ConversationAPI.md#conversationassignpost) | **POST** /conversation/assign | Sohbeti başka bir temsilciye atar.
[**conversationAssignableusersGet**](ConversationAPI.md#conversationassignableusersget) | **GET** /conversation/assignableusers | Sohbetin atanabileceği temsilciler.
[**conversationAssigntomePost**](ConversationAPI.md#conversationassigntomepost) | **POST** /conversation/assigntome | Sohbeti giriş yapan temsilcinin üzerine alır.
[**conversationChatbotGet**](ConversationAPI.md#conversationchatbotget) | **GET** /conversation/chatbot | Sohbette AI chatbot&#39;un açık olup olmadığını döner.
[**conversationChatbotPost**](ConversationAPI.md#conversationchatbotpost) | **POST** /conversation/chatbot | Sohbette AI chatbot&#39;u açar veya kapatır.
[**conversationListGet**](ConversationAPI.md#conversationlistget) | **GET** /conversation/list | Sohbet listesi: her müşteri için son mesaj, okunmadı durumu, kişi ve ticket bilgisi.
[**conversationMarkasreadPost**](ConversationAPI.md#conversationmarkasreadpost) | **POST** /conversation/markasread | Sohbeti okundu olarak işaretler (okunmadı rozeti kalkar).
[**conversationMarkasunreadPost**](ConversationAPI.md#conversationmarkasunreadpost) | **POST** /conversation/markasunread | Sohbeti okunmadı olarak işaretler (okunmadı rozeti görünür).
[**conversationMessagesGet**](ConversationAPI.md#conversationmessagesget) | **GET** /conversation/messages | Bir sohbetin mesaj geçmişi (imleçli sayfalama).
[**conversationSendPost**](ConversationAPI.md#conversationsendpost) | **POST** /conversation/send | Müşteriye metin veya konum mesajı gönderir. GERÇEK WhatsApp mesajı gider.
[**conversationSendfeedbackPost**](ConversationAPI.md#conversationsendfeedbackpost) | **POST** /conversation/sendfeedback | Müşteriye geri bildirim (memnuniyet puanlama) mesajı gönderir. GERÇEK WhatsApp mesajı gider.
[**conversationSendmediaPost**](ConversationAPI.md#conversationsendmediapost) | **POST** /conversation/sendmedia | Müşteriye resim, video, ses veya PDF gönderir. GERÇEK WhatsApp mesajı gider.
[**conversationTerminatePost**](ConversationAPI.md#conversationterminatepost) | **POST** /conversation/terminate | Görüşmeyi sonlandırır (ticket&#39;ı kapatır).
[**conversationWindowGet**](ConversationAPI.md#conversationwindowget) | **GET** /conversation/window | WhatsApp 24 saat mesaj penceresinin durumu.


# **conversationAssignPost**
```swift
    open class func conversationAssignPost(assignConversationCommand: AssignConversationCommand? = nil, completion: @escaping (_ data: BooleanApiReturn?, _ error: Error?) -> Void)
```

Sohbeti başka bir temsilciye atar.

Yalnızca size atanmış sohbet başkasına devredilebilir. `userId` conversation/assignableusers listesinden  seçilir; açık ekranlar canlı bağlantıda `assign` olayıyla güncellenir. Sohbet size atanmamışsa veya temsilci  bulunamazsa `success:false`. `data` = true.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import BasefyWhappioSDK

let assignConversationCommand = AssignConversationCommand(phoneNumber: "phoneNumber_example", userId: 123) // AssignConversationCommand |  (optional)

// Sohbeti başka bir temsilciye atar.
ConversationAPI.conversationAssignPost(assignConversationCommand: assignConversationCommand) { (response, error) in
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
 **assignConversationCommand** | [**AssignConversationCommand**](AssignConversationCommand.md) |  | [optional] 

### Return type

[**BooleanApiReturn**](BooleanApiReturn.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json, text/json, application/*+json
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **conversationAssignableusersGet**
```swift
    open class func conversationAssignableusersGet(completion: @escaping (_ data: AssignableUserDtoListApiReturn?, _ error: Error?) -> Void)
```

Sohbetin atanabileceği temsilciler.

Aynı işletmenin şu an çevrimiçi ve aktif temsilcileri; giriş yapan kullanıcı listede yer almaz  (kendine atamak için conversation/assigntome). Parametre almaz.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import BasefyWhappioSDK


// Sohbetin atanabileceği temsilciler.
ConversationAPI.conversationAssignableusersGet() { (response, error) in
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

[**AssignableUserDtoListApiReturn**](AssignableUserDtoListApiReturn.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **conversationAssigntomePost**
```swift
    open class func conversationAssigntomePost(assignConversationToMeCommand: AssignConversationToMeCommand? = nil, completion: @escaping (_ data: BooleanApiReturn?, _ error: Error?) -> Void)
```

Sohbeti giriş yapan temsilcinin üzerine alır.

Kullanıcı çevrimiçi olmalıdır; çevrimdışıysa `success:false` döner. Açık ekranlar `assign` olayıyla güncellenir.  `data` = true.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import BasefyWhappioSDK

let assignConversationToMeCommand = AssignConversationToMeCommand(phoneNumber: "phoneNumber_example") // AssignConversationToMeCommand |  (optional)

// Sohbeti giriş yapan temsilcinin üzerine alır.
ConversationAPI.conversationAssigntomePost(assignConversationToMeCommand: assignConversationToMeCommand) { (response, error) in
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
 **assignConversationToMeCommand** | [**AssignConversationToMeCommand**](AssignConversationToMeCommand.md) |  | [optional] 

### Return type

[**BooleanApiReturn**](BooleanApiReturn.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json, text/json, application/*+json
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **conversationChatbotGet**
```swift
    open class func conversationChatbotGet(phoneNumber: String? = nil, completion: @escaping (_ data: BooleanApiReturn?, _ error: Error?) -> Void)
```

Sohbette AI chatbot'un açık olup olmadığını döner.

`data` = true: AI bu müşteriye otomatik cevap verir. false: AI susar, sohbet temsilcidedir.  Numara kişilerde kayıtlı değilse varsayılan olarak true döner.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import BasefyWhappioSDK

let phoneNumber = "phoneNumber_example" // String | Müşterinin telefonu (conversation/list içindeki phoneNumber). (optional)

// Sohbette AI chatbot'un açık olup olmadığını döner.
ConversationAPI.conversationChatbotGet(phoneNumber: phoneNumber) { (response, error) in
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
 **phoneNumber** | **String** | Müşterinin telefonu (conversation/list içindeki phoneNumber). | [optional] 

### Return type

[**BooleanApiReturn**](BooleanApiReturn.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **conversationChatbotPost**
```swift
    open class func conversationChatbotPost(setChatBotCommand: SetChatBotCommand? = nil, completion: @escaping (_ data: BooleanApiReturn?, _ error: Error?) -> Void)
```

Sohbette AI chatbot'u açar veya kapatır.

`isActive` istenen durumdur (açma/kapama değiştirme değil; tekrar göndermek durumu geri çevirmez).  Ayar kişi kaydında tutulduğu için numara kişilerde kayıtlı değilse `success:false` döner.  `data` = yeni durum.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import BasefyWhappioSDK

let setChatBotCommand = SetChatBotCommand(phoneNumber: "phoneNumber_example", isActive: false) // SetChatBotCommand |  (optional)

// Sohbette AI chatbot'u açar veya kapatır.
ConversationAPI.conversationChatbotPost(setChatBotCommand: setChatBotCommand) { (response, error) in
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
 **setChatBotCommand** | [**SetChatBotCommand**](SetChatBotCommand.md) |  | [optional] 

### Return type

[**BooleanApiReturn**](BooleanApiReturn.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json, text/json, application/*+json
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **conversationListGet**
```swift
    open class func conversationListGet(currentPage: Int? = nil, pageSize: Int? = nil, completion: @escaping (_ data: ConversationListItemDtoPagedApiReturn?, _ error: Error?) -> Void)
```

Sohbet listesi: her müşteri için son mesaj, okunmadı durumu, kişi ve ticket bilgisi.

En son yazışılan sohbet önce gelir. Her satırdaki `phoneNumber` sohbetin kimliğidir ve diğer tüm  conversation uçlarına bu değer gönderilir. Numara kişilerde kayıtlı değilse `contact` null,  sohbet hiç ticket'a dönüşmemişse `ticket` null gelir. Toplu (kampanya) gönderimler listede yer almaz.                Liste açıkken yeni mesajlar için realtime/token ile canlı bağlantı kurulur; tekrar tekrar istek atmaya gerek yoktur.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import BasefyWhappioSDK

let currentPage = 987 // Int | İstenen sayfa (1'den başlar). Varsayılan: 1. (optional)
let pageSize = 987 // Int | Sayfa başına kayıt. Varsayılan: 20, en fazla: 100. (optional)

// Sohbet listesi: her müşteri için son mesaj, okunmadı durumu, kişi ve ticket bilgisi.
ConversationAPI.conversationListGet(currentPage: currentPage, pageSize: pageSize) { (response, error) in
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
 **currentPage** | **Int** | İstenen sayfa (1&#39;den başlar). Varsayılan: 1. | [optional] 
 **pageSize** | **Int** | Sayfa başına kayıt. Varsayılan: 20, en fazla: 100. | [optional] 

### Return type

[**ConversationListItemDtoPagedApiReturn**](ConversationListItemDtoPagedApiReturn.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **conversationMarkasreadPost**
```swift
    open class func conversationMarkasreadPost(phoneNumberRequest: PhoneNumberRequest? = nil, completion: @escaping (_ data: BooleanApiReturn?, _ error: Error?) -> Void)
```

Sohbeti okundu olarak işaretler (okunmadı rozeti kalkar).

İşaret web panelle ortaktır. Müşteriden yeni mesaj geldiğinde işaret sıfırlanır ve rozet yeniden görünür.  Numara kişilerde kayıtlı değilse işaret saklanamaz ama hata dönmez. `data` = true.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import BasefyWhappioSDK

let phoneNumberRequest = PhoneNumberRequest(phoneNumber: "phoneNumber_example") // PhoneNumberRequest |  (optional)

// Sohbeti okundu olarak işaretler (okunmadı rozeti kalkar).
ConversationAPI.conversationMarkasreadPost(phoneNumberRequest: phoneNumberRequest) { (response, error) in
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
 **phoneNumberRequest** | [**PhoneNumberRequest**](PhoneNumberRequest.md) |  | [optional] 

### Return type

[**BooleanApiReturn**](BooleanApiReturn.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json, text/json, application/*+json
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **conversationMarkasunreadPost**
```swift
    open class func conversationMarkasunreadPost(phoneNumberRequest: PhoneNumberRequest? = nil, completion: @escaping (_ data: BooleanApiReturn?, _ error: Error?) -> Void)
```

Sohbeti okunmadı olarak işaretler (okunmadı rozeti görünür).

İşaret web panelle ortaktır. `data` = true.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import BasefyWhappioSDK

let phoneNumberRequest = PhoneNumberRequest(phoneNumber: "phoneNumber_example") // PhoneNumberRequest |  (optional)

// Sohbeti okunmadı olarak işaretler (okunmadı rozeti görünür).
ConversationAPI.conversationMarkasunreadPost(phoneNumberRequest: phoneNumberRequest) { (response, error) in
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
 **phoneNumberRequest** | [**PhoneNumberRequest**](PhoneNumberRequest.md) |  | [optional] 

### Return type

[**BooleanApiReturn**](BooleanApiReturn.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json, text/json, application/*+json
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **conversationMessagesGet**
```swift
    open class func conversationMessagesGet(phoneNumber: String? = nil, beforeDate: Int64? = nil, beforeId: Int? = nil, pageSize: Int? = nil, completion: @escaping (_ data: ConversationMessagesDtoApiReturn?, _ error: Error?) -> Void)
```

Bir sohbetin mesaj geçmişi (imleçli sayfalama).

Mesajlar sayfa içinde eskiden yeniye sıralıdır.                1. İlk istekte yalnızca `phoneNumber` (ve isteğe bağlı `pageSize`) gönderilir: en yeni mesajlar gelir.  2. Kullanıcı yukarı kaydırdığında, yanıttaki `nextBeforeDate` ve `nextBeforeId` değerleri `beforeDate`     ve `beforeId` olarak gönderilir: bir önceki (daha eski) sayfa gelir.  3. `hasMore` false olduğunda sohbetin başına gelinmiştir.                Otomasyonların bıraktığı iç notlar da `isInternalNote` = true olarak araya karışık gelir (müşteri görmez).

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import BasefyWhappioSDK

let phoneNumber = "phoneNumber_example" // String | Müşterinin telefonu (conversation/list içindeki phoneNumber). (optional)
let beforeDate = 987 // Int64 | İlk istekte boş bırakılır (en yeni mesajlar). Daha eskiler için önceki yanıttaki nextBeforeDate gönderilir. (optional)
let beforeId = 987 // Int | beforeDate ile birlikte, önceki yanıttaki nextBeforeId gönderilir. (optional)
let pageSize = 987 // Int | Sayfa başına mesaj. Varsayılan: 20, en fazla: 50. (optional)

// Bir sohbetin mesaj geçmişi (imleçli sayfalama).
ConversationAPI.conversationMessagesGet(phoneNumber: phoneNumber, beforeDate: beforeDate, beforeId: beforeId, pageSize: pageSize) { (response, error) in
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
 **phoneNumber** | **String** | Müşterinin telefonu (conversation/list içindeki phoneNumber). | [optional] 
 **beforeDate** | **Int64** | İlk istekte boş bırakılır (en yeni mesajlar). Daha eskiler için önceki yanıttaki nextBeforeDate gönderilir. | [optional] 
 **beforeId** | **Int** | beforeDate ile birlikte, önceki yanıttaki nextBeforeId gönderilir. | [optional] 
 **pageSize** | **Int** | Sayfa başına mesaj. Varsayılan: 20, en fazla: 50. | [optional] 

### Return type

[**ConversationMessagesDtoApiReturn**](ConversationMessagesDtoApiReturn.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **conversationSendPost**
```swift
    open class func conversationSendPost(sendConversationMessageCommand: SendConversationMessageCommand? = nil, completion: @escaping (_ data: BooleanApiReturn?, _ error: Error?) -> Void)
```

Müşteriye metin veya konum mesajı gönderir. GERÇEK WhatsApp mesajı gider.

- Metin mesajı: `text` dolu; `latitude`, `longitude`, `externalIdOfReplied` null.  - Konum mesajı: `latitude` ve `longitude` birlikte, nokta ondalıklı sayı olarak (\"41.0082\", \"28.9784\").  - Yanıt (alıntı): `externalIdOfReplied` = yanıtlanan mesajın `externalId` değeri.                Sohbet size atanmış olmalıdır (değilse önce conversation/assigntome). 24 saat penceresi kapalıysa `success:false` döner (bkz. conversation/window). Gönderilen mesaj canlı  bağlantıda `receiveMessage` olayıyla da gelir; listeye eklemek için o olay beklenebilir. `data` = true.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import BasefyWhappioSDK

let sendConversationMessageCommand = SendConversationMessageCommand(phoneNumber: "phoneNumber_example", text: "text_example", latitude: "latitude_example", longitude: "longitude_example", externalIdOfReplied: "externalIdOfReplied_example") // SendConversationMessageCommand |  (optional)

// Müşteriye metin veya konum mesajı gönderir. GERÇEK WhatsApp mesajı gider.
ConversationAPI.conversationSendPost(sendConversationMessageCommand: sendConversationMessageCommand) { (response, error) in
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
 **sendConversationMessageCommand** | [**SendConversationMessageCommand**](SendConversationMessageCommand.md) |  | [optional] 

### Return type

[**BooleanApiReturn**](BooleanApiReturn.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json, text/json, application/*+json
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **conversationSendfeedbackPost**
```swift
    open class func conversationSendfeedbackPost(sendFeedbackMessageCommand: SendFeedbackMessageCommand? = nil, completion: @escaping (_ data: BooleanApiReturn?, _ error: Error?) -> Void)
```

Müşteriye geri bildirim (memnuniyet puanlama) mesajı gönderir. GERÇEK WhatsApp mesajı gider.

Web'deki \"Geri bildirim mesajı gönder\" işlemi.                - İşletmenin tanımlı NPS liste mesajı kişinin dilinde (yoksa işletmenin varsayılan dilinde) gönderilir;    tanımlı mesaj yoksa `success:false`.  - Gönderim sonrası ticket durumu \"Kapanış bekliyor\" (3) olur; açık ekranlar `updateTicketStatus` olayıyla güncellenir.  - Müşterinin verdiği puan otomatik işlenir; otomatik kapatma açıksa görüşme sistem tarafından kapatılır.  - Sohbet size atanmış olmalı ve 24 saat penceresi açık olmalıdır; değilse `success:false`.                `data` = true.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import BasefyWhappioSDK

let sendFeedbackMessageCommand = SendFeedbackMessageCommand(phoneNumber: "phoneNumber_example") // SendFeedbackMessageCommand |  (optional)

// Müşteriye geri bildirim (memnuniyet puanlama) mesajı gönderir. GERÇEK WhatsApp mesajı gider.
ConversationAPI.conversationSendfeedbackPost(sendFeedbackMessageCommand: sendFeedbackMessageCommand) { (response, error) in
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
 **sendFeedbackMessageCommand** | [**SendFeedbackMessageCommand**](SendFeedbackMessageCommand.md) |  | [optional] 

### Return type

[**BooleanApiReturn**](BooleanApiReturn.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json, text/json, application/*+json
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **conversationSendmediaPost**
```swift
    open class func conversationSendmediaPost(phoneNumber: String? = nil, file: URL? = nil, caption: String? = nil, externalIdOfReplied: String? = nil, completion: @escaping (_ data: BooleanApiReturn?, _ error: Error?) -> Void)
```

Müşteriye resim, video, ses veya PDF gönderir. GERÇEK WhatsApp mesajı gider.

`multipart/form-data` ile gönderilir: `phoneNumber` ve `file` zorunlu, `caption` ve `externalIdOfReplied` opsiyonel.                | Tür | Uzantı | En fazla |  |---|---|---|  | Resim | jpg, jpeg, png | 5 MB |  | Video | mp4 | 16 MB |  | Ses | mp3, m4a | 16 MB |  | Doküman | pdf | 16 MB |                - `caption` yalnızca resim ve videoda müşteriye gider; WhatsApp ses ve PDF'te açıklama taşımaz.  - PDF müşterinin WhatsApp'ında yüklenen dosyanın adıyla görünür.  - Sohbet size atanmış olmalıdır (değilse önce conversation/assigntome).  - Desteklenmeyen tür, büyük dosya, size atanmamış sohbet veya kapalı 24 saat penceresinde `success:false` döner.  - Gönderilen mesaj canlı bağlantıda `receiveMessage` olayıyla gelir (`MediaContentUrl` dolu). `data` = true.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import BasefyWhappioSDK

let phoneNumber = "phoneNumber_example" // String | Müşterinin telefonu (conversation/list içindeki phoneNumber). (optional)
let file = URL(string: "https://example.com")! // URL | Gönderilecek dosya (jpg, jpeg, png, mp4, mp3, m4a, pdf). (optional)
let caption = "caption_example" // String | Resim/video altındaki açıklama. Opsiyonel; ses ve PDF'te müşteriye gitmez. (optional)
let externalIdOfReplied = "externalIdOfReplied_example" // String | Bir mesaja yanıt veriliyorsa o mesajın externalId'si. Yanıt değilse boş bırakılır. (optional)

// Müşteriye resim, video, ses veya PDF gönderir. GERÇEK WhatsApp mesajı gider.
ConversationAPI.conversationSendmediaPost(phoneNumber: phoneNumber, file: file, caption: caption, externalIdOfReplied: externalIdOfReplied) { (response, error) in
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
 **phoneNumber** | **String** | Müşterinin telefonu (conversation/list içindeki phoneNumber). | [optional] 
 **file** | **URL** | Gönderilecek dosya (jpg, jpeg, png, mp4, mp3, m4a, pdf). | [optional] 
 **caption** | **String** | Resim/video altındaki açıklama. Opsiyonel; ses ve PDF&#39;te müşteriye gitmez. | [optional] 
 **externalIdOfReplied** | **String** | Bir mesaja yanıt veriliyorsa o mesajın externalId&#39;si. Yanıt değilse boş bırakılır. | [optional] 

### Return type

[**BooleanApiReturn**](BooleanApiReturn.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: multipart/form-data
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **conversationTerminatePost**
```swift
    open class func conversationTerminatePost(terminateConversationCommand: TerminateConversationCommand? = nil, completion: @escaping (_ data: BooleanApiReturn?, _ error: Error?) -> Void)
```

Görüşmeyi sonlandırır (ticket'ı kapatır).

- Sohbetin son ticket'ı kapatılır ve temsilci ataması kaldırılır.  - \"Temsilciye devredildi\" etiketi kişiden kaldırılır; müşteri yeniden yazdığında akış baştan başlar.  - İşletmenin tanımlı bir kapanış hazır mesajı varsa ve 24 saat penceresi açıksa bu mesaj müşteriye    GERÇEKTEN gönderilir.  - Açık ekranlar `updateTicketStatus` ve `assign` olaylarıyla güncellenir.                Sohbet size atanmış olmalıdır. Ticket zaten kapalıysa hiçbir şey yapmadan `data` = true döner. Sohbette hiç  ticket yoksa veya sohbet size atanmamışsa `success:false`.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import BasefyWhappioSDK

let terminateConversationCommand = TerminateConversationCommand(phoneNumber: "phoneNumber_example") // TerminateConversationCommand |  (optional)

// Görüşmeyi sonlandırır (ticket'ı kapatır).
ConversationAPI.conversationTerminatePost(terminateConversationCommand: terminateConversationCommand) { (response, error) in
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
 **terminateConversationCommand** | [**TerminateConversationCommand**](TerminateConversationCommand.md) |  | [optional] 

### Return type

[**BooleanApiReturn**](BooleanApiReturn.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json, text/json, application/*+json
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **conversationWindowGet**
```swift
    open class func conversationWindowGet(phoneNumber: String? = nil, completion: @escaping (_ data: ChatWindowDtoApiReturn?, _ error: Error?) -> Void)
```

WhatsApp 24 saat mesaj penceresinin durumu.

WhatsApp, işletmenin müşteriye serbest mesaj atmasına yalnızca müşterinin son mesajından sonraki 24 saat  içinde izin verir. `isOpen` false ise conversation/send reddedilir; mesaj kutusu kapatılmalıdır.  `remainingSeconds` ile geri sayım gösterilebilir. Müşteriden yeni mesaj geldiğinde pencere yeniden açılır.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import BasefyWhappioSDK

let phoneNumber = "phoneNumber_example" // String | Müşterinin telefonu (conversation/list içindeki phoneNumber). (optional)

// WhatsApp 24 saat mesaj penceresinin durumu.
ConversationAPI.conversationWindowGet(phoneNumber: phoneNumber) { (response, error) in
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
 **phoneNumber** | **String** | Müşterinin telefonu (conversation/list içindeki phoneNumber). | [optional] 

### Return type

[**ChatWindowDtoApiReturn**](ChatWindowDtoApiReturn.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

