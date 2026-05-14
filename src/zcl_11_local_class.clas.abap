CLASS zcl_11_local_class DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .


  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_11_local_class IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    DATA conection TYPE REF TO lcl_conect.
    DATA conections TYPE TABLE OF REF TO lcl_conect.

*PRIMERA INSTANCIA
************************************************************

    conection = NEW #(  ).

    conection->carrier_id    = 'LH'.
    conection->connection_id = '0400'.

    APPEND conection TO conections.

*SEGUNDA INSTANCIA
**********************************************************************

    conection = NEW #(  ).

    conection->carrier_id    = 'AA'.
    conection->connection_id = '0017'.

    APPEND conection TO conections.


*TERCERA INSTANCIA
**********************************************************************

    conection = NEW #(  ).

    conection->carrier_id    = 'BA'.
    conection->connection_id = '0020'.

    APPEND conection TO conections.


*CUARTA INSTANCIA
**********************************************************************

    conection = NEW #(  ).

    conection->carrier_id    = 'SQ'.
    conection->connection_id = '0001'.

    APPEND conection TO conections.


  ENDMETHOD.
ENDCLASS.
