CLASS zcl_lab_02_arithmetic_angel8a DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_lab_02_arithmetic_angel8a IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

    DATA lv_base_rate TYPE i VALUE 20.
    DATA lv_corp_area_rate TYPE i VALUE 10.
    DATA lv_medical_service_rate TYPE i VALUE 15.
    DATA lv_total_rate TYPE i.

    lv_total_rate = lv_base_rate + lv_corp_area_rate + lv_medical_service_rate.

    ADD 5 TO lv_total_rate.

    out->write( |Resultado Actividad 1: { lv_total_rate }| ).

*   RESTA


    DATA lv_maintenance_rate TYPE i  VALUE 30.
    DATA lv_margin_rate TYPE i  VALUE 10.
    DATA lv_base_rate_RESTA TYPE i.

    lv_base_rate_RESTA = lv_maintenance_rate - lv_margin_rate.

    SUBTRACT 4 FROM lv_base_rate_RESTA.

    out->write( |Resultado Actividad 2: { lv_base_rate_RESTA }| ).
*    MULTIPLICACION

    DATA lv_package_weight TYPE i VALUE 2.
    DATA lv_cost_per_kg TYPE i VALUE 3.
    DATA lv_multi_rate TYPE i.


    lv_multi_rate = lv_package_weight * lv_cost_per_kg .

    MULTIPLY lv_multi_rate BY 2.

    out->write( |Resultado Actividad 3: { lv_multi_rate }| ).

*    División / Sentencia DIVIDE

    DATA lv_total_weight TYPE i VALUE 38.
    DATA lv_num_packages TYPE i VALUE 4.
    DATA lv_applied_rate(8) TYPE p DECIMALS 2.


    lv_applied_rate = lv_total_weight / lv_num_packages.


    DIVIDE lv_applied_rate BY 3.

    out->write( |Resultado Actividad 4: { lv_applied_rate }| ).

*5. División sin resto / Sentencia DIV

    DATA lv_total_costt TYPE i VALUE 17.
    DATA lv_discount_threshold TYPE i VALUE 4.
    DATA lv_result(4) TYPE p DECIMALS 2.


    lv_result = lv_total_costt DIV lv_discount_threshold.


    out->write( |Resultado Actividad 5: { lv_result }| ).

*    6. Resto (residuo) de división / Sentencia MOD

DATA LV_TOTAL_COST TYPE i VALUE 19.
DATA LV_DISCOUNT_THRESHOLD_2 TYPE i VALUE 4.
DATA LV_REMAINDER(4) TYPE P DECIMALS 2.

LV_REMAINDER = LV_TOTAL_COST MOD LV_DISCOUNT_THRESHOLD_2.

    out->write( |Resultado Actividad 6: { LV_REMAINDER }| ).




*  Exponenciación

DATA LV_WEIGHT TYPE i VALUE 5.
DATA LV_EXPO TYPE i.

LV_EXPO = LV_WEIGHT ** 2.

    out->write( |Resultado Actividad 7: { LV_EXPO }| ).

*    Raíz cuadrada

DATA LV_SQUARE_ROOT TYPE i.
LV_SQUARE_ROOT = sqrt( LV_EXPO ).
    out->write( |Resultado Actividad 8: { LV_SQUARE_ROOT }| ).


  ENDMETHOD.



ENDCLASS.
