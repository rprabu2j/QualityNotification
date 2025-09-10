CLASS zcl_zapi_qualitynotification DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_rap_query_provider.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_ZAPI_QUALITYNOTIFICATION IMPLEMENTATION.
  METHOD if_rap_query_provider~select.
    " The RAP query provider is not used in this scenario,
    " as the data is fetched by the unmanaged save implementation.
  ENDMETHOD.
ENDCLASS.
