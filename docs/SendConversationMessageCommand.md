# SendConversationMessageCommand

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**phoneNumber** | **String** | Müşterinin telefonu (conversation/list içindeki phoneNumber). | [optional] 
**text** | **String** | Mesaj metni. Konum gönderilmiyorsa zorunlu. Konum gönderiliyorsa yok sayılır (konum mesajı metin taşımaz). | [optional] 
**latitude** | **String** | Konum gönderilecekse enlem, nokta ondalıklı (ör. \&quot;41.0082\&quot;). Konum yoksa null; longitude ile birlikte gönderilir. | [optional] 
**longitude** | **String** | Konum gönderilecekse boylam, nokta ondalıklı (ör. \&quot;28.9784\&quot;). Konum yoksa null; latitude ile birlikte gönderilir. | [optional] 
**externalIdOfReplied** | **String** | Bir mesaja yanıt veriliyorsa o mesajın externalId&#39;si (conversation/messages). Yanıt değilse null. | [optional] 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


