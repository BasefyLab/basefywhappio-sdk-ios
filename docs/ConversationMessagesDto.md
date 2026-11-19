# ConversationMessagesDto

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**messages** | [ConversationMessageDto] | Bu sayfadaki mesajlar, eskiden yeniye sıralı. | [optional] 
**hasMore** | **Bool** | Daha eski mesaj var mı. false ise sohbetin başına gelindi. | [optional] 
**nextBeforeDate** | **Int64** | Daha eski sayfa için bir sonraki istekte beforeDate olarak gönderilir; HasMore&#x3D;false ise null. | [optional] 
**nextBeforeId** | **Int** | Daha eski sayfa için bir sonraki istekte beforeId olarak gönderilir; HasMore&#x3D;false ise null. | [optional] 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


