# ContactDetailDto

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**id** | **Int** | Kişi id&#39;si. | [optional] 
**fullName** | **String** | Ad soyad. | [optional] 
**emailAddress** | **String** | E-posta; girilmemişse null. | [optional] 
**phoneNumber** | **String** | Ülke kodlu telefon, yalnızca rakam (ör. 905321112233). | [optional] 
**gender** | [**Gender**](Gender.md) |  | [optional] 
**dateOfBirth** | **Date** | Doğum tarihi (ISO 8601, ör. 1990-01-31T00:00:00); girilmemişse null. | [optional] 
**cityId** | **Int** | Şehir id&#39;si (contact/cities listesinden); girilmemişse null. | [optional] 
**cityName** | **String** | Şehir adı (gösterim için); şehir yoksa null. | [optional] 
**languageType** | [**LanguageType**](LanguageType.md) |  | [optional] 
**isAcceptPublications** | [**IsAcceptPublications**](IsAcceptPublications.md) |  | [optional] 
**isBlocked** | **Bool** | Kişi WhatsApp&#39;ta engelli mi. Değiştirmek için contact/block kullanılır. | [optional] 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


