# ConversationListItemDto

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**phoneNumber** | **String** | Müşterinin telefonu (sohbetin kimliği). Diğer tüm conversation uçlarına phoneNumber olarak verilir. | [optional] 
**contact** | [**ConversationContactDto**](ConversationContactDto.md) |  | [optional] 
**lastMessage** | [**ConversationLastMessageDto**](ConversationLastMessageDto.md) |  | [optional] 
**isUnread** | **Bool** | Okunmadı rozeti gösterilsin mi (web paneldeki \&quot;Görülmedi\&quot; ile aynı kural): elle okundu/okunmadı işaretlenmişse  o geçerlidir; işaret yoksa son mesaj müşteriden gelmiş ve okunmamışsa true. | [optional] 
**ticket** | [**ConversationTicketDto**](ConversationTicketDto.md) |  | [optional] 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


