# ConversationMessageDto

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**id** | **Int** | Mesaj id&#39;si. Otomasyon iç notlarında 0&#39;dır (Message satırı yoktur). | [optional] 
**externalId** | **String** | WhatsApp mesaj id&#39;si. Yanıtlama (conversation/send externalIdOfReplied) ve hub&#39;daki MarkMessageInboundAsRead bununla yapılır. | [optional] 
**messageType** | [**MessageType**](MessageType.md) |  | [optional] 
**senderType** | [**MessageSenderType**](MessageSenderType.md) |  | [optional] 
**isIncoming** | **Bool** | true: müşteriden gelen mesaj (sol balon). false: işletmeden giden mesaj (sağ balon). | [optional] 
**text** | **String** | Gösterilecek düz metin (metin, buton/liste cevabı, CTA gövdesi vb.). | [optional] 
**contentJson** | **String** | Zengin tiplerin (liste, sipariş, ürün kartı, konum…) ham kanonik içeriği (JSON metni); istemci gerektiğinde çözer. | [optional] 
**mediaUrl** | **String** | Resim/ses/video/dosya mesajlarında medyanın adresi; diğer tiplerde null. | [optional] 
**date** | **Int64** | Mesaj zamanı, Unix milisaniye. | [optional] 
**isRead** | **Bool** | Mesaj okundu mu. | [optional] 
**sentByFullName** | **String** | Mesajı panelden/mobilden gönderen temsilci; temsilci mesajı değilse null. | [optional] 
**repliedTo** | [**RepliedMessageDto**](RepliedMessageDto.md) |  | [optional] 
**isInternalNote** | **Bool** | Otomasyonun bıraktığı iç not: müşteriye gitmez, yalnızca temsilci görür. | [optional] 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


