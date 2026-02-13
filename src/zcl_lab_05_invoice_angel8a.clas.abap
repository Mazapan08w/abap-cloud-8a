CLASS zcl_lab_05_invoice_angel8a DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
  INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_lab_05_invoice_angel8a IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

    DATA MV_EXERCISE(4) TYPE N.
    DATA MV_INVOICE_NO(8) TYPE N.
    DATA MV_INVOICE_CODE TYPE string.

    " Asignación de valores
    mv_exercise   = '2026'.
    mv_invoice_no = '00012345'.

    " Concatenación separada por "/"
    MV_INVOICE_CODE = mv_exercise && `/` && mv_invoice_no.

    out->write( MV_INVOICE_CODE ).


    SELECT * FROM zemp_logali INTO TABLE @DATA(lt_employees).

    DATA mv_employees_text TYPE string VALUE ''.


LOOP AT lt_employees INTO DATA(ls_employee).
  mv_employees_text = mv_employees_text && ls_employee-name && ` `.
ENDLOOP.

out->write( mv_employees_text ).


data MV_CASE1 type string VALUE 'Sales invoice with      status in process'.
data MV_CASE2 type string VALUE '***ABAP*Cloud***'.

out->write( MV_CASE1 ).
out->write( MV_CASE2 ).


CONDENSE MV_CASE1.

REPLACE ALL OCCURRENCES OF '*' IN mv_case2 WITH ''.


out->write( MV_CASE1 ).
out->write( MV_CASE2 ).


DATA MV_DATA type string value '0001111111;LOGALI GROUP;2024'.

SPLIT MV_DATA AT ';' INTO DATA(MV_ID_CUSTOMER)
                          DATA(MV_CUSTOMER)
                          DATA(MV_YEAR).

 out->write( MV_ID_CUSTOMER ).
   out->write( MV_CUSTOMER ).
   out->write( MV_YEAR ).

DATA MV_INVOICE_NUM TYPE STRING VALUE '2015ABCD'.

SHIFT mv_invoice_num LEFT BY 2 PLACES.
SHIFT mv_invoice_num RIGHT BY 2 PLACES.

 out->write( mv_invoice_num ).

DATA MV_RESPONSE TYPE STRING VALUE ' Generating Invoice  ' .

DATA(MV_STRLEN) = STRLEN( MV_RESPONSE ).

OUT->write( MV_STRLEN ).

DATA(MV_NUMOFCHAR) = NUMOFCHAR( MV_RESPONSE ).

OUT->write( MV_NUMOFCHAR ).


DATA MV_TRANSLATE_INVOICE TYPE STRING VALUE 'Report the issuance of this invoice'.
DATA mv_upper TYPE string.
DATA mv_LOWER TYPE string.

mv_upper = mv_translate_invoice.
TRANSLATE MV_UPPER TO UPPER CASE.
out->write( mv_upper ).

mv_LOWER = mv_translate_invoice.
TRANSLATE MV_LOWER TO LOWER CASE.
out->write( mv_LOWER ).


mv_translate_invoice =
  mv_translate_invoice && ' to client'.

out->write( mv_translate_invoice ).

mv_translate_invoice =
  reverse( mv_translate_invoice ).

out->write( mv_translate_invoice ).




  ENDMETHOD.

ENDCLASS.
