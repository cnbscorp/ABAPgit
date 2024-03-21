CLASS z_fill_employee_data DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .

    DATA:
        lt_employees TYPE TABLE OF zmriemployee.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS z_fill_employee_data IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    APPEND VALUE #(
      employee_id = '00000001'
      first_name = 'John'
      last_name = 'Travolta'
      salary = '100000.99'
      salary_currency = 'CHF'
 ) TO lt_employees.


    APPEND VALUE #(
      employee_id = '00000002'
      first_name = 'Will'
      last_name = 'Smith'
      salary = '80000.99'
      salary_currency = 'USD'
      manager = '00000001' ) TO lt_employees.


    APPEND VALUE #(
      employee_id = '00000003'
      first_name = 'Jessica'
      last_name = 'Alba'
      salary = '85000.99'
      salary_currency = 'CHF'
      manager = '00000002' ) TO lt_employees.


    APPEND VALUE #(
      employee_id = '00000004'
      first_name = 'Monica'
      last_name = 'Belucci'
      salary = '45987.99'
      salary_currency = 'EUR'
      manager = '00000002' ) TO lt_employees.


    APPEND VALUE #(
      employee_id = '00000005'
      first_name = 'Jack'
      last_name = 'Nicolson'
      salary = '80000.99'
      salary_currency = 'CHF'
      manager = '00000002' ) TO lt_employees.

    APPEND VALUE #(
      employee_id = '00000006'
      first_name = 'Cameron'
      last_name = 'Diaz'
      salary = '47856.99'
      salary_currency = 'USD'
      manager = '00000005' ) TO lt_employees.


    out->write( name = `Employee data to be inserted:` data = lt_employees ).

    DELETE FROM zmriemployee.

    INSERT zmriemployee FROM TABLE @lt_employees.

    COMMIT WORK.

    CLEAR lt_employees.

    out->write( `Insert successful ` ).

  ENDMETHOD.
ENDCLASS.
