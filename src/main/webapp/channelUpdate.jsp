<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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



<%@page import="com.channel.Channel"%>
	
	<%
	String cid = request.getParameter("cid");
	String did = request.getParameter("did");
	String pid = request.getParameter("pid");
	String name = request.getParameter("name");
	String date = request.getParameter("date");
	String age = request.getParameter("age");
	String dname = "null";
	String dtype = "null";


	String date1= date.substring(0, 10);
	%>
	
	<div class="px-4 py-5  text-center">
		<img class="d-block mx-auto mb-4" src="images/icons8-health-64.png"
			alt="">
		<h1 class="display-5 fw-bold">UPDATE APPOINMENT</h1>
		<div class="col-lg-6 mx-auto">
			<p class="lead mb-4">Here You can edit the appoinment details</p>
		</div>
	</div>
	
	<div id="mmenu_screen" class="container-fluid main_container d-flex">
		<div class="row flex-fill">
			<div class="col-sm-4 h-100">
				
			</div>
			<div class="col-sm-4 h-100">

					 
	

	<div class="card">
		<div class="card-body">
			<form action="channelUpdate" method="POST">

				<label Style = "display:none;" class="form-label"><b>EDIT DETAILS</b></label>
				
				<div class="mb-3">
					<div id="emailHelp" class="form-text">Current Doctor Details</div>
						<%try {
							connection = DriverManager.getConnection(url, user, pass);
							statement = connection.createStatement();
							String sql = "SELECT iddoctor, dname, type from doctor where iddoctor = '"+ did +"'";
							resultSet2 = statement.executeQuery(sql);
							while (resultSet2.next()) {
						%>
						
						<input style = "display : none;" class="form-control" type="text" name="select" value='<%=did%>' readonly>
						<p><%=resultSet2.getString("dname")%> ,<%=resultSet2.getString("type")%></p>

						<%
						}

						} catch (Exception e) {
						e.printStackTrace();
						}
						%>
				</div>

				<div class="mb-3" Style = "display:none;">
					<label for="exampleInputEmail1" class="form-label">Patient ID</label><br> 
					<input class="form-control" type="text" value="<%=pid %>" name="pid" readonly>
				</div>
				
				<div class="mb-3">
					<label for="exampleInputEmail1" class="form-label">Channeling ID</label><br> 
					<input class="form-control" type="text" value="<%=cid %>" name="cid" readonly>
				</div>
				
				<div class="mb-3" Style = "display:none;">
					<label for="exampleInputEmail1" class="form-label">Doctor ID</label><br> 
					<input class="form-control" type="text" value="<%=did %>" name="did" readonly>
				</div>

				<div class="mb-3">
					<label class="form-label">Channeling Name</label> 
					<input
						class="form-control" type="text" name="pname" Style="" value='<%=name %>'>
				</div>

				<div class="mb-3">
					<label class="form-label">Patient age</label> 
					<input
						class="form-control" type="text" name="age" value='<%=age %>'>
				</div>

				

				<div class="mb-3">
					<label class="form-label">Channel Date</label>
					<%-- <div id="emailHelp" class="form-text">Current Date</div>
					<input class="form-control" type="text" name="date" value='<%=date%>' readonly> --%>
					<!-- <div id="emailHelp" class="form-text">New Date</div> -->
					<input class="form-control" value = "<%=date%>" type="date" name="date">
				</div>

				<input class="w-100 btn btn-primary" type="submit" name="submit"
					value="Update Appointment">
			</form>

		</div>
	</div>


			</div>
			<div class="col-sm-4 mmenu_screen--direktaction flex-fill">
				
			</div>
		</div>
	</div>
</body>
</html>