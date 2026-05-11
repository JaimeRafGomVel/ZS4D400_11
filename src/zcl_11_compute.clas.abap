CLASS zcl_11_compute DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .

    DATA number1 TYPE i.
    DATA number2 TYPE i.


  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_11_compute IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

  number1 = 3.
  number2 = 24.

  DATA(result) = number2 / number1.

  DATA(output) = |{ number2 } / { number1 } = { result }|.

  out->write( output ).

  out->write( |------------------------------| ).


  ENDMETHOD.
ENDCLASS.
