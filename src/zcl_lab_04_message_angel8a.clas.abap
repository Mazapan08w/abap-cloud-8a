CLASS zcl_lab_04_message_angel8a DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS zcl_lab_04_message_angel8a IMPLEMENTATION.

METHOD if_oo_adt_classrun~main.

* 1 . Símbolos de texto
    " Nota: Si text-001 marca error, es que falta crearlo en 'Text Elements'
    out->write( text-001 ).

* 2 . Funciones de descripción
    DATA: lv_order_status TYPE string VALUE `Purchase Completed Successfully`,
          lv_char_number  TYPE i.

    " * Longitud: STRLEN cuenta caracteres ocupados
    lv_char_number = strlen( lv_order_status ).
    out->write( |Longitud STRLEN: { lv_char_number }| ).

    lv_char_number = numofchar( lv_order_status ).
    out->write( |Longitud NUMOFCHAR: { lv_char_number }| ).

    " * Conteo de 'A'
    lv_char_number = count( val = lv_order_status pcre = '(?i)a' ).
    out->write( |Cantidad de 'A': { lv_char_number }| ).

    " * Buscar patrón 'Exit'
    lv_char_number = find( val = lv_order_status sub = 'Exit' ).
    out->write( |Posición de 'Exit': { lv_char_number }| ).

* 3 . Funciones de procesamiento
    out->write( to_upper( lv_order_status ) ).
    out->write( to_lower( lv_order_status ) ).

    " * Desplazar primeros 9 caracteres al final (Estilo Profe)
    lv_order_status = lv_order_status+9 && lv_order_status(9).
    out->write( |Desplazado: { lv_order_status }| ).

    " * Extraer palabra 'Completed'
    lv_order_status = `Purchase Completed Successfully`.
    DATA(lv_extracted) = lv_order_status+9(9).
    out->write( |Palabra extraída: { lv_extracted }| ).

    out->write( reverse( lv_order_status ) ).

* 4 . Funciones de contenido
    DATA(lv_pattern) = `\d{3}-\d{3}-\d{4}`.
    DATA(lv_phone)   = `555-123-4567`.

    IF contains( val = lv_phone pcre = lv_pattern ).
      out->write( 'Teléfono con formato correcto' ).
    ELSE.
      out->write( 'Teléfono con formato incorrecto' ).
    ENDIF.

* 5 . Funciones con expresiones regulares
    DATA(lv_email) = `angel8a@ejemplo.com`.
    lv_pattern = `\b[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Z|a-z]{2,}\b`.

    IF contains( val = lv_email pcre = lv_pattern ).
      out->write( |Email válido: { lv_email }| ).
    ELSE.
      out->write( 'Email no válido' ).
    ENDIF.

  ENDMETHOD.

ENDCLASS.
