@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Hierarchy: Read Only: Employee'

@Metadata.allowExtensions: true
@Search.searchable: true

@OData.hierarchy.recursiveHierarchy:[{ entity.name: 'Z_I_EMPLOYEE_DATA_HN' }]

define view entity Z_C_EMPLOYEE_DATA
  as select from Z_I_EMPLOYEE_DATA
  association of many to one Z_C_EMPLOYEE_DATA as _Manager on $projection.Manager = _Manager.EmployeeId
{

  key EmployeeId,

      @Search: {
      defaultSearchElement: true}
      FirstName,

      LastName,

      Salary,

      SalaryCurrency,

      Manager,

      /* Associations */
      _Manager
}
