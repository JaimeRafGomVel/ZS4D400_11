CLASS zcl_11_branch DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_11_BRANCH IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

* Declarations
**************************

    DATA number1 TYPE i.
    DATA number2 TYPE i.

    DATA result TYPE p LENGTH 8 DECIMALS 2.
    DATA op      TYPE c LENGTH 1.

* Input Values
**************************

    number1 = 123.
    number2 = 2.
    op      = '/'.

* Calculation
**************************

    CASE op.
      WHEN '+'.
        result = number1 + number2.
      WHEN '-'.
        result = number1 - number2.
      WHEN '*'.
        result = number1 * number2.
      WHEN '/'.
        result = number1 / number2.
   ENDCASE.


* Output
**************************

     out->write( |{ number1 } { op } { number2 } = { result }| ).

  ENDMETHOD.
ENDCLASS.
