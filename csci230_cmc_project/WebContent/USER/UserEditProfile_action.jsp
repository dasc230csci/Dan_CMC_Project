<%@page language="java" import="UI.*" import = "Entity.*"%>
<%@include file="userVerifyLogin.jsp"%>
<%
UserUI userUi = (UserUI)session.getAttribute("userUi");
String firstName = request.getParameter("FirstName");
String lastName = request.getParameter("LastName");
String userName = request.getParameter("Username");
String password = request.getParameter("Password");
String type = request.getParameter("Type");
String status = request.getParameter("Status");
if(userUi.editProfile(firstName, lastName, password)){
	response.sendRedirect("UserEditProfile.jsp");
}
else{
	response.sendRedirect("UserEditProfile.jsp?Error=1");
}
%>