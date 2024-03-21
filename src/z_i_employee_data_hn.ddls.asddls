@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Hierarchy: Read Only: Employee Hierarchy'

define hierarchy Z_I_EMPLOYEE_DATA_HN
  as parent child hierarchy(
    source Z_I_EMPLOYEE_DATA
    child to parent association _Manager
    start where
      Manager is initial
    siblings order by
      LastName ascending
  )
{
  key EmployeeId,
      Manager
}
