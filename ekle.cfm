<cfparam name="form.ad" default="">
<cfparam name="form.soyad" default="">
<cfparam name="form.email" default="">
<cfprocessingdirective pageencoding="utf-8">
<cfif structKeyExists(form, "ad") and structKeyExists(form, "soyad") and structKeyExists(form, "email")>   
    <cfquery name="insertQuery" datasource="admin">
        INSERT INTO Employee (NAME, SURNAME, EMAIL)
        VALUES (
            <cfqueryparam value="#form.ad#" cfsqltype="CF_SQL_VARCHAR">,
            <cfqueryparam value="#form.soyad#" cfsqltype="CF_SQL_VARCHAR">,
            <cfqueryparam value="#form.email#" cfsqltype="CF_SQL_VARCHAR">
        )
    </cfquery>

    <cfoutput>
        <p>Kayıt başarıyla eklendi!</p> 
        
        <a href="ekle.html">Ekle</a>
        <a href="ara.html">Ara</a>
        <a href="list.cfm">Listele</a>
        <cfquery name="selectAllQuery" datasource="admin">
            SELECT * FROM Employee
        </cfquery> 
        <h2>Veritabanındaki Tüm Veriler</h2>
        <table border="1">
            <tr>
                <th>EMPLOYEE_ID</th>
                <th>NAME</th>
                <th>SURNAME</th>
                <th>EMAIL</th>
            </tr>

            <cfloop query="selectAllQuery">
                <tr>
                    <td>#EMPLOYEE_ID#</td>
                    <td>#NAME#</td>
                    <td>#SURNAME#</td>
                    <td>#EMAIL#</td>
                </tr>
            </cfloop>
        </table>
    </cfoutput>

<cfelse>
    <cfoutput>
        <p>Lütfen formu doğru bir şekilde doldurun.</p>
    </cfoutput>
</cfif>
