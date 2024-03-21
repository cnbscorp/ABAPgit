@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Interface view for employee demo data'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
@Metadata.allowExtensions: true
define view entity Z_I_EMPLOYEE_DATA as select from zmriemployee
  association of many to one Z_I_EMPLOYEE_DATA as _Manager on $projection.Manager = _Manager.EmployeeId
{
   key employee_id as EmployeeId,
    first_name as FirstName,
    last_name as LastName,
    salary as Salary,
    salary_currency as SalaryCurrency,
    manager as Manager,
    
    _Manager
}
