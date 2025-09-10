@AbapCatalog.sqlViewName: 'ZIQMMA'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Quality Notification Activity'

define view ZI_QMMA
  as select from qmma
  association to parent ZI_QUALITYNOTIFICATION as _Notification on $projection.QualityNotification = _Notification.QualityNotification
{
  key qmma.qmnum as QualityNotification,
  key qmma.manum as ActivityKey,
      qmma.matxt as ActivityText,
      qmma.zz_custom_field_qmma as CustomFieldQmma,
      _Notification
}
