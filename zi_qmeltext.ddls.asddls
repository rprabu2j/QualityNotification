@AbapCatalog.sqlViewName: 'ZIQMELTEXT'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Quality Notification Long Text'

define view ZI_QMELTEXT
  as select from qmeltext
  association to parent ZI_QUALITYNOTIFICATION as _Notification on $projection.QualityNotification = _Notification.QualityNotification
{
  key qmeltext.qmnum as QualityNotification,
  key qmeltext.text_line as TextLine,
      qmeltext.zz_custom_field_qmeltext as CustomFieldQmeltext,
      _Notification
}
