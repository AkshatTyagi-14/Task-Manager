<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Login - Task Manager</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
<link rel="icon" href="data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 32 32'%3E%3Crect width='32' height='32' rx='8' fill='%234f46e5'/%3E%3Cpath d='M9 17l5 5 9-11' stroke='white' stroke-width='3' fill='none' stroke-linecap='round' stroke-linejoin='round'/%3E%3C/svg%3E">
<link rel="stylesheet" href="css/style.css">
</head>
<body>
<main class="container py-4">
<div class="login-wrap">
<div class="card shadow-sm">
<div class="card-body p-4 text-center">
<% 
 String user = request.getParameter("abc");
 String pass = request.getParameter("xyz");
 try{
	 Class.forName("com.mysql.cj.jdbc.Driver");
	 Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/yourdb", "root", "your_password");
	 PreparedStatement preparedStatement = connection.prepareStatement("select * from softcopy where Name=? and Password=?");
	 preparedStatement.setString(1,user);
	 preparedStatement.setString(2,pass);
	 ResultSet set = preparedStatement.executeQuery();
	 if(set.next()){
		 out.println("Login Success");
		 session.setAttribute("Id",set.getInt(1));
		 session.setAttribute("UserName",set.getString(2));
		 session.setAttribute("Password",set.getString(3));
		 session.setAttribute("Mobile",set.getString(4));
		 session.setAttribute("Role",set.getInt(5));
		 session.setAttribute("Is Activee",set.getInt(6));
		 session.setAttribute("Managed",set.getInt(7));
		
		 response.sendRedirect("home.jsp");
		 
	 }
	 else{
	     response.sendRedirect("login1.jsp");
	 }
	 
 }
 catch (Exception e){
	 out.println("<h3>error " + e.getMessage()+"</h3>");
	 
 }
%>
</div>
</div>
</div>
</main>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
