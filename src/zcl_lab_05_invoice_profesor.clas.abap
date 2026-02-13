CLASS zcl_lab_05_invoice_profesor DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
ENDCLASS.



CLASS zcl_lab_05_invoice_profesor IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

*-------------------------------------------------------
* 1. CONCATENACIÓN
*-------------------------------------------------------
    DATA mv_exercise(4)   TYPE n.
    DATA mv_invoice_no(8) TYPE n.
    DATA mv_invoice_code  TYPE string.

    mv_exercise   = '2026'.
    mv_invoice_no = '00012345'.

    mv_invoice_code = mv_exercise && '/' && mv_invoice_no.

    out->write( mv_invoice_code ).


*-------------------------------------------------------
* 2. CONCATENACIÓN DE LÍNEAS DE TABLA
*-------------------------------------------------------
    SELECT * FROM zemp_logali INTO TABLE @DATA(lt_employees).

    DATA mv_employees_text TYPE string VALUE ''.

    LOOP AT lt_employees INTO DATA(ls_employee).
      mv_employees_text =
        mv_employees_text &&
        ls_employee-name && space.
    ENDLOOP.

    out->write( mv_employees_text ).


*-------------------------------------------------------
* 3. CONDENSACIÓN
*-------------------------------------------------------
    DATA mv_case1 TYPE string VALUE
      'Sales invoice with      status in process'.

    DATA mv_case2 TYPE string VALUE
      '***ABAP*Cloud***'.

    CONDENSE mv_case1.

    REPLACE ALL OCCURRENCES OF '*'
      IN mv_case2
      WITH ''.

    out->write( mv_case1 ).
    out->write( mv_case2 ).


*-------------------------------------------------------
* 4. SPLIT
*-------------------------------------------------------
    DATA mv_data TYPE string VALUE
      '0001111111;LOGALI GROUP;2024'.

    DATA mv_id_customer TYPE string.
    DATA mv_customer    TYPE string.
    DATA mv_year        TYPE string.

    SPLIT mv_data AT ';'
      INTO mv_id_customer
           mv_customer
           mv_year.

    out->write( mv_id_customer ).
    out->write( mv_customer ).
    out->write( mv_year ).


*-------------------------------------------------------
* 5. SHIFT
*-------------------------------------------------------
    DATA mv_invoice_num TYPE string VALUE '2015ABCD'.

    SHIFT mv_invoice_num LEFT  BY 2 PLACES.
    SHIFT mv_invoice_num RIGHT BY 2 PLACES.

    out->write( mv_invoice_num ).


*-------------------------------------------------------
* 6. STRLEN y NUMOFCHAR
*-------------------------------------------------------
    DATA mv_response TYPE string VALUE
      ' Generating Invoice  '.

    DATA mv_count TYPE i.

    mv_count = strlen( mv_response ).
    out->write( mv_count ).

    mv_count = numofchar( mv_response ).
    out->write( mv_count ).


*-------------------------------------------------------
* 7. TO_UPPER y TO_LOWER (TRANSLATE)
*-------------------------------------------------------
    DATA mv_translate_invoice TYPE string VALUE
      'Report the issuance of this invoice'.

    DATA mv_upper TYPE string.
    DATA mv_lower TYPE string.

    mv_upper = mv_translate_invoice.
    TRANSLATE mv_upper TO UPPER CASE.
    out->write( mv_upper ).

    mv_lower = mv_translate_invoice.
    TRANSLATE mv_lower TO LOWER CASE.
    out->write( mv_lower ).


*-------------------------------------------------------
* 8. INSERT y REVERSE
*-------------------------------------------------------
    mv_translate_invoice =
      insert(
        val = mv_translate_invoice
        sub = ' to client'
        off = strlen( mv_translate_invoice )
      ).

    out->write( mv_translate_invoice ).

    mv_translate_invoice =
      reverse( mv_translate_invoice ).

    out->write( mv_translate_invoice ).


  ENDMETHOD.

ENDCLASS.

