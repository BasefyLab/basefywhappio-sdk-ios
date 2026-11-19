# UpdateContactCommand

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**fullName** | **String** | Ad soyad. Zorunlu. | [optional] 
**emailAddress** | **String** | E-posta. Opsiyonel; girilirse geçerli bir adres olmalı. | [optional] 
**phoneNumber** | **String** | Telefon. Zorunlu; tenant içinde benzersiz. 905321112233, 05321112233, 5321112233 veya boşluk/tireli  yazımlar kabul edilir; ülke kodlu, yalnızca rakam biçimine (905321112233) çevrilerek kaydedilir. | [optional] 
**gender** | [**Gender**](Gender.md) |  | [optional] 
**dateOfBirth** | **Date** | Doğum tarihi, ISO biçiminde (ör. \&quot;1990-01-31\&quot;). Opsiyonel. \&quot;31.01.1990\&quot; biçimi kabul edilmez. | [optional] 
**cityId** | **Int** | Şehir id&#39;si (contact/cities listesinden). Opsiyonel. | [optional] 
**languageType** | [**LanguageType**](LanguageType.md) |  | [optional] 
**isAcceptPublications** | [**IsAcceptPublications**](IsAcceptPublications.md) |  | [optional] 
**id** | **Int** | Güncellenecek kişinin id&#39;si. | [optional] 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


