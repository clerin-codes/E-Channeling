<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>

<!-- CSS only -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi"
	crossorigin="anonymous">

<!-- JavaScript Bundle with Popper -->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
	crossorigin="anonymous">
</script>
</head>
<body>

	<%@page import="java.sql.DriverManager"%>
	<%@page import="java.sql.ResultSet"%>
	<%@page import="java.sql.Statement"%>
	<%@page import="java.sql.Connection"%>

	<%
	String pid = request.getParameter("pid");
	String driverName = "com.mysql.jdbc.Driver";

	String url = "jdbc:mysql://localhost:3306/echanneling";
	String user = "root";
	String pass = "root";
	Connection con;
	//String mid = ;

	try {
		Class.forName(driverName);
	} catch (ClassNotFoundException e) {
		e.printStackTrace();
	}

	Connection connection = null;
	Statement statement = null;
	Statement statement2 = null;
	ResultSet resultSet = null;
	ResultSet resultSet2 = null;
	%>
	
	<div class="px-4 py-5  text-center">
		<img class="d-block mx-auto mb-4" src="images/icons8-tasklist-96.png"
			alt="">
		<h1 class="display-5 fw-bold">YOUR CHANNELLING APPOINMENTS</h1>
		<div class="col-lg-6 mx-auto">
			<p class="lead mb-4">Here You can edit the project details, add
				tasks to the project and you can edit or remove tasks.</p>
		</div>
	</div>
	
	<div id="mmenu_screen" class="container-fluid main_container d-flex">
		<div class="row flex-fill">
			<div class="col-sm-2 h-100">
			
			</div>
			<div class="col-sm-8 h-100">
				<div class="card">
					<div class="card-body">

	<table class="table table-striped pb-5">	
	  <thead>
	    <tr>
	      <th scope="col">Channel ID</th>
		  <th Style = "display:none;"scope="col">Doctor ID</th>
		  <th Style = "display:none;"scope="col">Patient ID</th>
	      <th scope="col">Patient Name</th> 
	      <th scope="col">Date</th>
	      <th scope="col">Age</th>
	      <th scope="col">Doctor Name</th>
	      <th scope="col">Doctor Type</th>
	      <th scope="col"> </th>
	      <th scope="col"> </th>
	    </tr>
	  </thead>
	  <tbody>

		<%
		try {
		connection = DriverManager.getConnection(url, user, pass);
		statement = connection.createStatement();
		statement2 = connection.createStatement();
		
		String sql = "select * from channel where idpatient='"+ pid +"'";
		resultSet = statement.executeQuery(sql);
		while (resultSet.next()) {
		%>

	    <tr>
	      <td class="align-middle"><%=resultSet.getString("idchannel")%></td>
	      <td Style = "display:none;" class="align-middle"><%=resultSet.getString("iddoctor")%></td>
	      <td Style = "display:none;" class="align-middle"><%=resultSet.getString("idpatient")%></td>
	      <td class="align-middle"><%=resultSet.getString("name")%></td>
	      <td class="align-middle"><%=resultSet.getString("date")%></td>
	      <td class="align-middle"><%=resultSet.getString("age")%></td>
	      
	     <%
	     try {
	     String did = resultSet.getString("iddoctor");
	     String sql2 = "select * from doctor where iddoctor='"+did+"'";
		 resultSet2 = statement2.executeQuery(sql2);
			
		 if(resultSet2.next()){
	     %>
			<td class="align-middle"><%=resultSet2.getString("dname")%></td>
			<td class="align-middle"><%=resultSet2.getString("type")%></td>
		 <%
		 }}catch(Exception e){
			 e.printStackTrace(); 
		 }
		 %>
			
	       
	      <td class="align-middle">
	      <c:url value="channelUpdate.jsp" var="channelUpdate">
			<c:param name="cid" value='<%=resultSet.getString("idchannel")%>'></c:param>
			<c:param name="did" value='<%=resultSet.getString("iddoctor")%>'></c:param>
			<c:param name="pid" value='<%=resultSet.getString("idpatient")%>'></c:param>
			<c:param name="name" value='<%=resultSet.getString("name")%>'></c:param>
			<c:param name="date" value='<%=resultSet.getString("date")%>'></c:param>
			<c:param name="age" value='<%=resultSet.getString("age")%>'></c:param>	
		  </c:url> 
		  
			<a href="${channelUpdate}">
			 <input class="btn btn-primary" type="button" name="update" value="UPDATE">
			</a>
		  </td>
		  
		  <td class="align-middle">
	     <%--  <c:url value="channelDelete.jsp" var="channelDelete">
			<c:param name="cid" value='<%=resultSet.getString("idchannel")%>'></c:param>
			<c:param name="did" value='<%=resultSet.getString("iddoctor")%>'></c:param>
			<c:param name="pid" value='<%=resultSet.getString("idpatient")%>'></c:param>
			<c:param name="name" value='<%=resultSet.getString("name")%>'></c:param>
			<c:param name="date" value='<%=resultSet.getString("date")%>'></c:param>
			<c:param name="age" value='<%=resultSet.getString("age")%>'></c:param>	
		  </c:url> 
		  
			<a href="${channelDelete}">
			 <input class="btn btn-outline-danger" type="button"  value="CANCEL">
			</a> --%>
			
			<form action="deleteAppoinment" method="POST">
			<div class="mb-3" Style = "display:none;">
				<label for="exampleInputEmail1" class="form-label">Channel
					ID</label><br> <input class="form-control" type="text"
					value='<%=resultSet.getString("idchannel")%>' name="cid" readonly>
			</div>
			
			<div class="mb-3" Style = "display:none;">
				<label for="exampleInputEmail1" class="form-label">Channel
					ID</label><br> <input class="form-control" type="text"
					value='<%=resultSet.getString("idpatient")%>' name="pid" readonly>
			</div>
			
			<input class="btn btn-outline-danger" type="submit"
					name="submit" value="CANCEL">
			</form>	
		  </td>

			<%
			}
			} catch (Exception e) {
			e.printStackTrace();
			}
			%>
		</tbody>
	</table>

	</div>
				</div>
			</div>
			<div class="col-sm-2 mmenu_screen--direktaction flex-fill">
				
			</div>
		</div>
	</div>

</body>
</html>