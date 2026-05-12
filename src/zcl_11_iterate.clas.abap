CLASS zcl_11_iterate DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
    DATA recuento TYPE i VALUE 20.
    DATA numbers TYPE TABLE OF i.
    DATA salida TYPE TABLE OF string.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_11_iterate IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

*TAREA 1
*****************************************************************
    DO recuento TIMES.
      CASE sy-index.
        WHEN 1.
          APPEND 0 TO numbers.
        WHEN 2.
          APPEND 1 TO numbers.
        WHEN OTHERS.
          APPEND numbers[ sy-index - 2 ] + numbers[ sy-index - 1 ] TO numbers.
      ENDCASE.
    ENDDO.

    out->write( numbers ).


    out->write( |----------------------------------------------------| ).
*TAREA 2
*****************************************************************
    DATA(counter) = 0.
    LOOP AT numbers INTO DATA(number).

      counter = counter + 1.
      APPEND |{ counter WIDTH = 4 }: { number WIDTH = 10 ALIGN = RIGHT }| TO salida.
    ENDLOOP.

    out->write(
         data   = salida                                                                     "Si en el out->write escribes un data y un name el name se colocara como cabecera
         name   = |The first { recuento } Fibonacci Numbers|                                 "y el data sera el salida por pantalla o lo demas
                ) .


  ENDMETHOD.
ENDCLASS.
