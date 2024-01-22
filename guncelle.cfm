<cfparam name="id" default="0">
<cfprocessingdirective pageencoding="utf-8">

<cfif isDefined("form.ad" ) and isDefined("form.soyad" ) and isDefined("form.email" )>
    <cftry>
        <cfquery name="updateEmployeeQuery" datasource="admin">
            UPDATE Employee
            SET NAME = '#form.ad#',
            SURNAME = '#form.soyad#',
            EMAIL = '#form.email#'
            WHERE EMPLOYEE_ID = #id#
        </cfquery>
        <cfoutput>Kayıt güncellendi!</cfoutput>  
        <cflocation url="ara.html" addtoken="no">
        <cfcatch>
            <cfoutput>Güncelleme işlemi başarısız oldu.</cfoutput>
        </cfcatch>
    </cftry>
</cfif>

<cfquery name="getEmployeeQuery" datasource="admin">
    SELECT *
    FROM Employee
    WHERE EMPLOYEE_ID = #id#
</cfquery>

<cfif #getEmployeeQuery.recordcount# eq 0>
    <cflocation url="ara.html" addtoken="no">
</cfif>
<form action="guncelle.cfm" method="post">
    <input type="hidden" name="id" value="<cfoutput>#getEmployeeQuery.EMPLOYEE_ID#</cfoutput>">

    <table>
        <tr>
            <td>Ad</td>
            <td>
                <input type="text" name="ad" value="<cfoutput>#getEmployeeQuery.NAME#</cfoutput>">
            </td>
        </tr>
        <tr>
            <td>Soyad</td>
            <td>
                <input type="text" name="soyad"
                    value="<cfoutput>#getEmployeeQuery.SURNAME#</cfoutput>">
            </td>
        </tr>
        <tr>
            <td>E-posta</td>
            <td>
                <input type="text" name="email"
                    value="<cfoutput>#getEmployeeQuery.EMAIL#</cfoutput>">
            </td>
        </tr>
        <tr>
            <td></td>
            <td>
                <input type="submit" value="Güncelle">
            </td>
        </tr>
    </table>
</form> 