# LoginResponse

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**id** | **Int** | Kullanıcı id&#39;si. | [optional] 
**token** | **String** | JWT. Diğer isteklerde \&quot;Authorization: Bearer {token}\&quot; başlığıyla gönderilir. | [optional] 
**username** | **String** | Kullanıcı adı. | [optional] 
**fullName** | **String** | Ad soyad. | [optional] 
**emailAddress** | **String** | E-posta. | [optional] 
**tenantId** | **Int** | Kullanıcının bağlı olduğu işletme (tenant) id&#39;si. | [optional] 
**userType** | [**UserType**](UserType.md) |  | [optional] 
**permissions** | **[String]** | Kullanıcının yetki anahtarları (ör. contactspermission, taglistpermission). Yalnızca menü/buton göstermek  içindir; yönetici (userType&#x3D;1) bu listeden bağımsız olarak her uca erişir. | [optional] 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


