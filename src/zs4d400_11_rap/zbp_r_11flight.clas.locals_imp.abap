CLASS lhc_zr_11flight DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.
    METHODS:
      get_global_authorizations FOR GLOBAL AUTHORIZATION
        IMPORTING
        REQUEST requested_authorizations FOR Flight
        RESULT result,
      validatePrice FOR VALIDATE ON SAVE
        IMPORTING keys FOR Flight~validatePrice.
ENDCLASS.

CLASS lhc_zr_11flight IMPLEMENTATION.
  METHOD get_global_authorizations.
  ENDMETHOD.
  METHOD validatePrice.

*  Estas estructuras se utilizarán para agregar filas a las tablas failed-flight y
*  reporting-flight , en caso de que la validación encuentre un error.

    DATA failed_record   LIKE LINE OF failed-flight.
    DATA reported_record LIKE LINE OF reported-flight.

*  Utilice una instrucción READ ENTITIES para leer la entrada del usuario desde el búfer
*  transaccional. Utilice la adición IN LOCAL MODE y asegúrese de que solo se lean los campos
*  clave y el campo Precio . Utilice una declaración en línea para el conjunto de resultados

    READ ENTITIES OF ZR_11Flight IN LOCAL MODE
        ENTITY Flight
            FIELDS ( Price )
            WITH CORRESPONDING #(  keys )
            RESULT DATA(flights).

*  Dentro del bucle, compruebe si el componente Precio es mayor que cero. Si no lo es, rellene la estructura
*  failed_record con la clave del vuelo actual y agréguela como una nueva fila a la tabla failed-flight .
*  De forma similar, rellene la estructura reported_record con la clave del vuelo actual y agréguela como una
*  nueva fila a la tabla reported-flight .

    LOOP AT flights INTO DATA(flight).
      IF flight-price <= 0.

        failed_record-%tky = flight-%tky.
        APPEND failed_record TO failed-flight.

        reported_record-%tky = flight-%tky.
        reported_record-%msg = new_message(
                          id       = '/LRN/S4D400'
                          number   = '101'
                          severity = ms-error ).
        APPEND reported_record TO reported-flight.

      ENDIF.
    ENDLOOP.

  ENDMETHOD.

ENDCLASS.
