<%@page language="java" import="UI.*" import = "Entity.*"%>
<%
String error = request.getParameter("Error");
if(error != null && error.equals("1")){
	out.println("Delete Failed");
}
else if(error != null && error.equals("2")){
	out.println("Edit Failed");
}
AdminUI aUI = (AdminUI)session.getAttribute("adminUi");
%>
<html>
<head>
<title></title>
</head>
<body>

Hello User <%out.println(aUI.viewProfile().getUsername());%>
<table style="text-align: left; width: 100%;" border="1" cellpadding="2"
cellspacing="2">
<tbody>
<tr align="center">

<td colspan="10" rowspan="1" style="vertical-align: top;"><a
href="AddUser.jsp">ADD A USER</a>
</td>

</tr>
<tr>
<td style="vertical-align: top;">
Edit
<td style="vertical-align: top; text-align: center;">FirstName
</td>
<td style="vertical-align: top; text-align: center;">LastName
</td>
<td style="vertical-align: top; text-align: center;">Username
</td>
<td style="vertical-align: top; text-align: center;">Password
</td>
<td style="vertical-align: top; text-align: center;">Type
</td>
<td style="vertical-align: top; text-align: center;">Status
</td>
<td style="vertical-align: top;">Deactivate
</td>
<td style="vertical-align: top;">Reactivate
</td>
<td style="vertical-align: top;">Delete
</td>
</tr>
<%
for(Account account: aUI.viewAllUser()){
%>
<tr>
<td style="vertical-align: top;">
<form method="post" action="EditUser.jsp" name="EditUser">
    <input name="Edit" value="Edit" type="submit">
    <input name="Username" value=<%out.print(account.getUsername());%> type="hidden">
</form>
<td style="vertical-align: top;"><%out.println(account.getFirstName());%>
</td>
<td style="vertical-align: top;"><%out.println(account.getLastName());%>
</td>
<td style="vertical-align: top;"><%out.println(account.getUsername());%>
</td>
<td style="vertical-align: top;"><%out.println(account.getPassword());%>
</td>
<td style="vertical-align: top;"><%out.println(account.getType());%>
</td>
<td style="vertical-align: top;"><%out.println(account.getStatus());%>
</td>
<td style="vertical-align: top;">
<form method="post" action="Deactivate.jsp" name="Deactivate">
    <input name="Deactivate" value="Deactivate" type="submit">
    <input name="Username" value="<%out.print(account.getUsername());%>" type="hidden">
</form>
</td>
<td style="vertical-align: top;">
<form method="post" action="Reactivate.jsp" name="Reactivate">
    <input name="Reactivate" value="Reactivate" type="submit">
    <input name="Username" value="<%out.print(account.getUsername());%>" type="hidden">
</form>
</td>
<td style="vertical-align: top;">
<form method="post" action="DeleteUser.jsp" name="DeleteUser">
    <input name="Delete" value="Delete" type="submit">
    <input name="Username" value="<%out.print(account.getUsername());%>" type="hidden">
</form>
</td>
</tr>
<%} %>
</tbody>
</table>
</body>
</html>

