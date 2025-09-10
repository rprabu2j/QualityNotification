@AbapCatalog.sqlViewName: 'ZIQUALNOT'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Quality Notification'

define view ZI_QUALITYNOTIFICATION
  as select from qmel
  association to parent ZI_QUALITYNOTIFICATION as _Parent on $projection.QualityNotification = _Parent.QualityNotification
  association [0..*] to ZI_QMFE as _Items on $projection.QualityNotification = _Items.QualityNotification
  association [0..*] to ZI_QMSM as _Tasks on $projection.QualityNotification = _Tasks.QualityNotification
  association [0..*] to ZI_QMMA as _Activities on $projection.QualityNotification = _Activities.QualityNotification
  association [0..*] to ZI_QMUR as _Causes on $projection.QualityNotification = _Causes.QualityNotification
  association [0..*] to ZI_QMELTEXT as _Texts on $projection.QualityNotification = _Texts.QualityNotification
{
  key qmel.qmnum as QualityNotification,
      qmel.qmart as NotificationType,
      qmel.qmtxt as NotificationText,
      qmel.erdat as CreationDate,
      qmel.ernam as CreatedBy,
      qmel.aedat as LastChangeDate,
      qmel.aenam as LastChangedBy,
      qmel.zz_custom_field_qmel as CustomFieldQmel,

      _Parent,
      _Items,
      _Tasks,
      _Activities,
      _Causes,
      _Texts
}
