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

	<%
	String oid = request.getParameter("oid");
	String mid = request.getParameter("mid");
	String pid = request.getParameter("pid");
	String name = request.getParameter("name");
	String address = request.getParameter("address");
	String phone = request.getParameter("phone");
	String dname = "null";
	String dtype = "null";


	%>
	
	<div class="px-4 py-5  text-center">
		<img class="d-block mx-auto mb-4" src="images/icons8-health-64.png"
			alt="">
		<h1 class="display-5 fw-bold">UPDATE ORDER</h1>
		<div class="col-lg-6 mx-auto">
			<p class="lead mb-4">Here You can edit the order details</p>
		</div>
	</div>
	
	<div id="mmenu_screen" class="container-fluid main_container d-flex">
		<div class="row flex-fill">
			<div class="col-sm-4 h-100">
				
			</div>
			<div class="col-sm-4 h-100">

					 
	

	<div class="card">
		<div class="card-body">
			<form action="orderUpdate" method="POST">

				<label Style = "display:none;" class="form-label"><b>EDIT DETAILS</b></label>
				
				<div class="mb-3">
					<div id="emailHelp" class="form-text">Order Details</div>
						<%try {
							connection = DriverManager.getConnection(url, user, pass);
							statement = connection.createStatement();
							String sql = "SELECT idmedicine, mname, price from medicine where idmedcine = '"+ mid +"'";
							resultSet2 = statement.executeQuery(sql);
							while (resultSet2.next()) {
						%>
						
						<input style = "display : none;" class="form-control" type="text" name="lid" value='<%=mid%>' readonly>
						<p><%=resultSet2.getString("mname")%> ,Rs. <%=resultSet2.getString("price")%></p>

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
					<label for="exampleInputEmail1" class="form-label">Order ID</label><br> 
					<input class="form-control" type="text" value="<%=oid%>" name="oid" readonly>
				</div>
				
				<div class="mb-3" Style = "display:none;">
					<label for="exampleInputEmail1" class="form-label">Medicine ID</label><br> 
					<input class="form-control" type="text" value="<%=mid %>" name="mid" readonly>
				</div>

				<div class="mb-3">
					<label class="form-label">Reciver Name</label> 
					<input
						class="form-control" type="text" name="name" Style="" value='<%=name %>'>
				</div>

				<div class="mb-3">
					<label class="form-label">Delivery Address</label> 
					<input
						class="form-control" type="text" name="address" value='<%=address %>'>
				</div>
				
				<div class="mb-3">
					<label class="form-label">Contact Number</label> 
					<input
						class="form-control" type="text" name="phone" value='<%=phone %>'>
				</div>

				<input class="w-100 btn btn-primary" type="submit" name="submit"
					value="Update Order Details">
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