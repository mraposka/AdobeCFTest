<cfparam name="form.ad" default="">
<cfparam name="form.soyad" default="">
<cfprocessingdirective pageencoding="utf-8">
<cfif len(form.ad) eq 0 and len(form.soyad) eq 0>
    <cfset message = "Ad veya soyad girmediniz.">
    <cflocation url="ara.html?message=#message#" addtoken="no">
</cfif>

<cfquery name="searchQuery" datasource="admin">
    SELECT * FROM Employee WHERE NAME LIKE <cfqueryparam value="%#form.ad#%" cfsqltype="CF_SQL_VARCHAR"> AND SURNAME LIKE <cfqueryparam value="%#form.soyad#%" cfsqltype="CF_SQL_VARCHAR">
</cfquery>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Arama Sonuçları</title>
</head>
<body>
    <h2>Arama Sonuçları</h2>

    <table border="1">
        <tr>
            <th>EMPLOYEE_ID</th>
            <th>NAME</th>
            <th>SURNAME</th>
            <th>EMAIL</th>
            <th>Güncelle</th>
            <th>Sil</th>
        </tr>

        <cfloop query="#searchQuery#">
            <tr>
                <td><cfoutput>#EMPLOYEE_ID#</cfoutput></td>
                <td><cfoutput>#NAME#</cfoutput></td>
                <td><cfoutput>#SURNAME#</cfoutput></td>
                <td><cfoutput>#EMAIL#</cfoutput></td>
                <td><a href="guncelle.cfm?id=<cfoutput>#EMPLOYEE_ID#</cfoutput>">Güncelle</a></td>
                <td><a href="sil.cfm?id=<cfoutput>#EMPLOYEE_ID#</cfoutput>">Sil</a></td>
            </tr>
        </cfloop>
    </table>
</body>
</html>