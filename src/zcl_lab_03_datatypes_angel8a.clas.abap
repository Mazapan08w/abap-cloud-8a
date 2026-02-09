CLASS zcl_lab_03_datatypes_angel8a DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_lab_03_datatypes_angel8a IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

*  1. Conversiones de Tipo

    DATA mv_char(10) TYPE c VALUE 12345.
    DATA mv_num TYPE i.
    DATA mv_float TYPE f.

    mv_num = mv_char.

    mv_float = mv_num.

    out->write( |Variable Char:  { mv_char }| ).
    out->write( |Variable Entera: { mv_num }| ).
    out->write( |Variable Float:  { mv_float }| ).

*    2. Truncamiento y Redondeo

    DATA mv_trunc TYPE i.
    DATA mv_round TYPE i.

    mv_float = '123.45'.

    mv_trunc = mv_float.

    mv_round = mv_float + '0.5'.

    out->write( |Truncado: { mv_trunc }| ).
    out->write( |Redondeado:   { mv_round }| ).

* 3. Tipos en declaraciones en línea

    DATA(lv_abap) = 'ABAP'.
    out->write( |Variable en línea: { lv_abap }| ).

* 4. Conversiones del Tipo Forzado

    mv_num = CONV i( mv_char ).
    out->write( |Resultado Actividad 4: { mv_num }| ).


* 5. Cálculo de Fecha y Hora

    DATA mv_date_1 TYPE d.
    DATA mv_date_2 TYPE d.
    DATA mv_days TYPE i.
    DATA mv_time TYPE t.

    mv_date_1 = '20250922'.
    mv_date_2 = '20251231'.

    mv_days = mv_date_2 - mv_date_1.

    DATA(lv_day)   = mv_date_1+6(2).
    DATA(lv_month) = mv_date_1+4(2).
    DATA(lv_year)  = mv_date_1(4).


    out->write( |Días de diferencia: { mv_days }| ).
    out->write( |Fecha inicial (DDMMAAAA): { lv_day }{ lv_month }{ lv_year }| ).

* 6 . Campos Timestamp
    DATA mv_timestamp TYPE utclong.
    DATA mv_date_3 TYPE d.
    DATA mv_date_4 TYPE d.

    mv_timestamp = utclong_current( ).

    mv_date_2 = cl_abap_context_info=>get_system_date( ).
    mv_time   = cl_abap_context_info=>get_system_time( ).

    mv_date_3 = mv_date_2 - 2.
    mv_date_4 = mv_date_2 + 87.

    out->write( |Timestamp: { mv_timestamp }| ).
    out->write( |Fecha del sistema:    { mv_date_2 DATE = USER }| ).
    out->write( |Fecha menos 2 días:   { mv_date_3 DATE = USER }| ).
    out->write( |Fecha MAS 3 MESES:   { mv_date_4 DATE = USER }| ).

  ENDMETHOD.

ENDCLASS.
