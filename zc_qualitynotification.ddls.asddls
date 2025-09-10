@EndUserText.label: 'Quality Notification Projection View'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Metadata.allowExtensions: true

define view ZC_QUALITYNOTIFICATION
  as projection on ZI_QUALITYNOTIFICATION
{
  key QualityNotification,
      NotificationType,
      NotificationText,
      CreationDate,
      CreatedBy,
      LastChangeDate,
      LastChangedBy,
      CustomFieldQmel,

      /* Associations */
      _Items,
      _Tasks,
      _Activities,
      _Causes,
      _Texts
}
