<%@page language="java" import="UI.*" import = "Entity.*"%>
<% UserUI uUI = (UserUI)session.getAttribute("userUi");
String error = request.getParameter("Error");
if(error !=null && error.equals("1")){
	out.println("You've already Saved");
}
%>

<html>
<style>
body {font-family: Verdana,sans-serif;margin:0}
#banner{
  width:100%;
  background-image:url(http://i.imgur.com/TsQQMTp.png);
  background-size:880px 680px;
  background-repeat:no-repeat;
  background-position:60% 46%;
  height: 99px;
  background-color: #333333;
}
</style>
<head>
  
  <meta content="text/html; charset=ISO-8859-1" http-equiv="content-type">
  <title>ManageSavedSchools</title>
  <%
	String success = request.getParameter("Success");
	if(success != null && success.equals("1")){
		out.println("School Removed Successfully!");
}
%>

  
</head>
<body>
<div id="banner"></div>
<h2 style="text-align: center;"> Manage Saved Schools </h2>


  

    <% if (uUI.viewSavedSchool().isEmpty()){ %>
    	<h4 style="text-align: center;"> You have no saved schools! </h4>
    	
<%} else { %>

  <div style="text-align: center;"> </div>
<table style="text-align: left; width: 955px; height: 33px;" border="1" cellpadding="2" cellspacing="2">
    <tbody>
    <% for (String u : uUI.viewSavedSchool()) {  %>
      <tr>
        <td style="vertical-align: top; width: 33%;">
         <form action="RemoveSavedSchool.jsp" name="RemoveSavedSchools">
         <input name="RemoveSchool" value="Remove" type="submit"><input name="schoolName"
			value="<%out.print(u);%>" type="hidden"></form>
         <br>
        </td>
        <td style="vertical-align: top; width: 33%;"><%out.print(u);%><br>
        </td>
        <td style="vertical-align: top;">
        <form action="ViewSchool.jsp" name="ViewSavedSchools">
        <input name="ViewSchool" value="View" type="submit">
        <input name="schoolName" value="<%out.print(u);%>" type="hidden"></form>
        </td>
      </tr>
      <%} %>
    </tbody>
  </table>
  
  <br>
  <br>
<form method="post" action="CompareSchools.jsp" name="CompareMethod">
<table style="text-align: left; width: 955px; height: 33px;" border="1" cellpadding="2" cellspacing="2">
<tbody> 
<tr>
<% for (String u : uUI.viewSavedSchool()) {  %>
<td><%out.print(u); %></td>
 <%} %>
</tr>

<tr>
<% for (String u : uUI.viewSavedSchool()) {  %>
<td><input type="checkbox" name ="CompareSchools" value="<%out.print(u); %>"></td>
  <%} %>
</tr>

</tbody>
</table>
<input type="submit" name="Compare">
</form>
<%
  String errorCompare = request.getParameter("Error");
  if(error != null && errorCompare.equals("1")){
		out.println("Please check 2 boxes");
	} %>
  <br>
<%} %>
</body></html>