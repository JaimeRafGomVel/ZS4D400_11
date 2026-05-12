CLASS zcl_11_condicionales DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .

        DATA x TYPE i VALUE 3.
        DATA y TYPE i VALUE 5.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_11_condicionales IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    IF x = y.
      out->write( 'X es igual a Y' ).
    ELSEIF x > y.
      out->write( 'X es mayor que Y' ).
    ELSE.
      out->write( 'X es menor que Y' ).
    ENDIF.


  ENDMETHOD.
ENDCLASS.
