<%@ page language="java" import="Controller.*, java.util.*, UI.*, Entity.*"%>
<%
AdminUI adminUi = (AdminUI)session.getAttribute("adminUi");
String username = request.getParameter("Username");
Account account = adminUi.viewOthersProfile(username);
%>
<html>
<head>

<title>Edit User Form</title>
<%
	String error = request.getParameter("Error");
	if(error != null && error.equals("-1")){
		out.println("Please input value in the required fields");
}
	if(error != null && error.equals("-2")){
		out.println("Invalid type, please input a(admin) or u(user)");
}
	if(error != null && error.equals("-3")){
		out.println("Invalid status, please input Y(active) or N(inactive)");
}
	if(error != null && error.equals("-4")){
		out.println("Add user failed, please try again");
}
%>
</head>
<body>
<br>
Edit User form:<br>
<br>

<%
    out.println("Edit user : " + username);
%>
<form method="post" action="EditUser_action.jsp" name="editUser"><br>
<table style="text-align: left; width: 266px; height: 228px;"
border="1" >
<tbody>
<tr>
<td style="vertical-align: top;">First Name<br>
</td>
<td style="vertical-align: top;"><input name="FirstName" value="<%out.print(account.getFirstName()); %>"><br>
</td>
</tr>
<tr>
<tr>
<td style="vertical-align: top;">Last Name<br>
</td>
<td style="vertical-align: top;"><input name="LastName" value="<%out.print(account.getLastName()); %>"><br>
</td>
</tr>
<tr>
<td style="vertical-align: top;">Username<br>
</td>
<td style="vertical-align: top;"><input name="Username" value="<%out.print(account.getUsername()); %>" readonly> </td>
</tr>
<tr>
<td style="vertical-align: top;">Password<br>
</td>
<td style="vertical-align: top;"><input name="Password" value="<%out.print(account.getPassword()); %>"> </td>
</tr>
<tr>
<td style="vertical-align: top;">Type<br>
</td>
<td style="vertical-align: top;"><input name="Type" value="<%out.print(account.getType()); %>"> </td>
</tr>
<tr>
<td style="vertical-align: top;">Status<br>
</td>
<td style="vertical-align: top;"><input name="Status" value="<%out.print(account.getStatus()); %>"> </td>
</tr>

<tr>
<td style="vertical-align: top;"><input value="Edit"
name="Edit" type="submit">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
<td style="vertical-align: top;"><input value="Reset"
name="Reset" type="reset"></td>
</tr>
</tbody>
</table>
<br>
</form>
<br>
</body>
</html>
