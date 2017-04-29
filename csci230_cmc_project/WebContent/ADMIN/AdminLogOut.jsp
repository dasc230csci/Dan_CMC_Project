<%@page language="java" import="UI.*" import = "Entity.*"%>
<%
AdminUI adminUi = (AdminUI)session.getAttribute("adminUi");
if(adminUi.logOff()){
	session.removeAttribute("adminUi");
	response.sendRedirect("index.jsp");
}
%>