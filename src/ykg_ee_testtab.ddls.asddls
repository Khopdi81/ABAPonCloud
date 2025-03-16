@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Test tab from S4'
define external entity YKG_EE_TESTTAB external name Z93_STUDENT
{
  key MANDT      : abap.char(3)  external name mandt;
  key STUDENT_NO : abap.char(20) external name STUDENT_NO;
      COLLEGE    : abap.char(10) external name COLLEGE;
      COURSE     : abap.char(10) external name COURSE;
      FIRST_NAME : abap.char(20) external name FIRST_NAME;
      LAST_NAME  : abap.char(20) external name LAST_NAME;
      EMAIL      : abap.char(60) external name EMAIL;

}
with federated data provided at runtime
