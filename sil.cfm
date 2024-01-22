<cfparam name="id" default="0">
<cfprocessingdirective pageencoding="utf-8">
<cfquery name="deleteQuery" datasource="admin">
    DELETE FROM Employee
    WHERE EMPLOYEE_ID = #id#
</cfquery>

<cflocation url="ara.html" addtoken="no">