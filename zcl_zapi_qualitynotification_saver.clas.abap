CLASS lcl_saver DEFINITION INHERITING FROM cl_abap_behavior_saver.
  PROTECTED SECTION.
    METHODS save_modified REDEFINITION.
    METHODS cleanup_finalize REDEFINITION.
ENDCLASS.

CLASS lcl_saver IMPLEMENTATION.
  METHOD save_modified.
    DATA: ls_qmel    TYPE qmel,
          lt_qmfe    TYPE STANDARD TABLE OF qmfe,
          lt_qmsm    TYPE STANDARD TABLE OF qmsm,
          lt_qmma    TYPE STANDARD TABLE OF qmma,
          lt_qmur    TYPE STANDARD TABLE OF qmur,
          lt_qmeltext TYPE STANDARD TABLE OF qmeltext.

    " Create
    LOOP AT create-qualitynotification INTO DATA(ls_create_qmel).
      ls_qmel-qmart = ls_create_qmel-NotificationType.
      ls_qmel-qmtxt = ls_create_qmel-NotificationText.
      ls_qmel-zz_custom_field_qmel = ls_create_qmel-CustomFieldQmel.

      CALL FUNCTION 'BAPI_QUALNOT_CREATE'
        EXPORTING
          notif_header = ls_qmel
        IMPORTING
          notifheader_export = ls_qmel.

      ls_create_qmel-QualityNotification = ls_qmel-qmnum.
      mapped-qualitynotification = ls_create_qmel.

      " Create Items
      LOOP AT ls_create_qmel-%target INTO DATA(ls_create_qmfe).
        DATA(ls_qmfe) = CORRESPONDING qmfe( ls_create_qmfe ).
        ls_qmfe-qmnum = ls_qmel-qmnum.
        APPEND ls_qmfe TO lt_qmfe.
      ENDLOOP.

      " Create Tasks, Activities, Causes, Texts in a similar way
    ENDLOOP.

    " Update
    LOOP AT update-qualitynotification INTO DATA(ls_update_qmel).
      " Similar logic using BAPI_QUALNOT_MODIFY_DATA
    ENDLOOP.

    " Delete
    LOOP AT delete-qualitynotification INTO DATA(ls_delete_qmel).
      CALL FUNCTION 'BAPI_QUALNOT_DEL_DATA'
        EXPORTING
          notif_no = ls_delete_qmel-QualityNotification.
    ENDLOOP.
  ENDMETHOD.

  METHOD cleanup_finalize.
  ENDMETHOD.
ENDCLASS.
