@AbapCatalog.sqlViewName: 'ZIQMSM'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Quality Notification Task'

define view ZI_QMSM
  as select from qmsm
  association to parent ZI_QUALITYNOTIFICATION as _Notification on $projection.QualityNotification = _Notification.QualityNotification
{
  key qmsm.qmnum as QualityNotification,
  key qmsm.manum as TaskKey,
      qmsm.matxt as TaskText,
      qmsm.zz_custom_field_qmsm as CustomFieldQmsm,
      _Notification
}
