<cfprocessingdirective pageencoding="utf-8">

<cfquery name="searchQuery" datasource="admin">
    SELECT * FROM Employee
</cfquery>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Liste</title>
</head>
<body>
    <h2>Liste</h2> 
    <a href="ekle.html">Ekle</a>
    <a href="ara.html">Ara</a>
    <a href="list.cfm">Yenile</a>
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