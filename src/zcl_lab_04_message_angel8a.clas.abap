CLASS zcl_lab_04_message_angel8a DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
ENDCLASS.

CLASS zcl_lab_04_message_angel8a IMPLEMENTATION.

 METHOD if_oo_adt_classrun~main.

* 1. Símbolos de texto
    out->write( text-001 ).

* 2. Funciones de descripción
    DATA: lv_order_status TYPE string VALUE 'Purchase Completed Successfully',
          lv_char_number  TYPE i.

    " Longitud con STRLEN y NUMOFCHAR
    lv_char_number = strlen( lv_order_status ).
    out->write( |Longitud STRLEN: { lv_char_number }| ).

    lv_char_number = numofchar( lv_order_status ).
    out->write( |Longitud NUMOFCHAR: { lv_char_number }| ).

    " Contar caracteres "A" (mayúsculas y minúsculas)
    lv_char_number = count( val = lv_order_status pcre = '(?i)a' ).
    out->write( |Cantidad de letras A: { lv_char_number }| ).

    " Encontrar posición del patrón "Exit"
    lv_char_number = find( val = lv_order_status sub = 'Exit' ).
    out->write( |Posicion de 'Exit': { lv_char_number }| ).

* 3. Funciones de procesamiento
    out->write( to_upper( lv_order_status ) ).
    out->write( to_lower( lv_order_status ) ).

    " Desplazar los 9 primeros caracteres al final
    DATA(lv_shifted) = lv_order_status+9 && lv_order_status(9).
    out->write( |Desplazado: { lv_shifted }| ).

    " Extraer la palabra "Completed"
    DATA(lv_extracted) = substring( val = lv_order_status off = 9 len = 9 ).
    out->write( |Palabra extraida: { lv_extracted }| ).

    out->write( reverse( lv_order_status ) ).

* 4. Funciones de contenido
    DATA: lv_pattern TYPE string VALUE '\d{3}-\d{3}-\d{4}',
          lv_phone   TYPE string VALUE '555-123-4567'.

    IF contains( val = lv_phone pcre = lv_pattern ).
      out->write( 'Formato de telefono correcto' ).
    ELSE.
      out->write( 'Formato de telefono incorrecto' ).
    ENDIF.

* 5. Funciones con expresiones regulares
    DATA(lv_email) = 'angel8a@abapgmail.com'.
    lv_pattern = '\b[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Z|a-z]{2,}\b'.

    IF contains( val = lv_email pcre = lv_pattern ).
      out->write( |Email valido: { lv_email }| ).
    ELSE.
      out->write( 'Email no valido' ).
    ENDIF.

  ENDMETHOD.
ENDCLASS.
