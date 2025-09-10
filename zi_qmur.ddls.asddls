@AbapCatalog.sqlViewName: 'ZIQMUR'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Quality Notification Cause'

define view ZI_QMUR
  as select from qmur
  association to parent ZI_QUALITYNOTIFICATION as _Notification on $projection.QualityNotification = _Notification.QualityNotification
{
  key qmur.qmnum as QualityNotification,
  key qmur.urnum as CauseKey,
      qmur.urtxt as CauseText,
      qmur.zz_custom_field_qmur as CustomFieldQmur,
      _Notification
}
