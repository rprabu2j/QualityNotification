@AbapCatalog.sqlViewName: 'ZIQMFE'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Quality Notification Item'

define view ZI_QMFE
  as select from qmfe
  association to parent ZI_QUALITYNOTIFICATION as _Notification on $projection.QualityNotification = _Notification.QualityNotification
{
  key qmfe.qmnum as QualityNotification,
  key qmfe.fenum as NotificationItem,
      qmfe.fetxt as ItemText,
      qmfe.zz_custom_field_qmfe as CustomFieldQmfe,
      _Notification
}
