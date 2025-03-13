<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
     
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Patient Home</title>

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
<body style="padding-left: 80px; padding-right: 80px; padding-bottom: 20px;">

	<%@page import="java.sql.DriverManager"%>
	<%@page import="java.sql.ResultSet"%>
	<%@page import="java.sql.Statement"%>
	<%@page import="java.sql.Connection"%>

	<c:forEach var="p" items="${pDetails}">

		<c:set var="id" value="${p.id}" />

	</c:forEach>
	
<!-- Database Connection -->

	<%
	String pid = request.getParameter("id");
	String driverName = "com.mysql.jdbc.Driver";

	String url = "jdbc:mysql://localhost:3306/echanneling";
	String user = "root";
	String pass = "root";

	Connection con;
	String pID = pid;
	//String mid = ;

	try {
		Class.forName(driverName);
	} catch (ClassNotFoundException e) {
		e.printStackTrace();
	}

	Connection connection = null;
	Statement statement = null;
	ResultSet resultSet = null;
	ResultSet resultSet2 = null;
	ResultSet resultSet3 = null;
	%>

	<div class="px-4 py-5  text-center">
		<img class="d-block mx-auto mb-4" src="images/icons8-health-64.png"
			alt="">
		<h1 class="display-5 fw-bold">MediConnect-E-channeling Platform</h1>
		<div class="col-lg-6 mx-auto">
			<p class="lead mb-4">The eChannelling portfolio at present
				includes a doctor Channeling System and Service that has been
				implemented in 260-plus hospitals both Private and Ayurvedic; over
				5500 doctors; 2000-plus channeling agents; a Hospital Information
				system; an eChannelling member card; and a mobile application.</p>
		</div>
	</div>

<!-- Channeling Section -->
	<div class="card">
		<div class="card-body">

			<div id="mmenu_screen" class="container-fluid main_container d-flex">
				<div class="row flex-fill">
					<div class="col-sm-4 h-100"
						style="padding-left: 0px; padding-right: 0px;">
						<div class="card">
							<div class="card-body">
								<form action="addAppoinment" method="POST">

									<label class="form-label"><b>ADD APPOINMENT</b></label>

									<div Style="display: none;" class="mb-3">
										<label for="exampleInputEmail1" class="form-label">Patient
											ID</label><br> <input class="form-control" type="text"
											value='${id}' name="pid" readonly>
									</div>

									<div class="mb-3">
										<label class="form-label">Channeling Name</label> <input
											class="form-control" type="text" name="pname" Style=""
											placeholder="Enter name">
									</div>

									<div class="mb-3">
										<label class="form-label">Patient age</label> <input
											class="form-control" type="text" name="age"
											placeholder="Type the age">
									</div>

									<div class="mb-3">
										<label class="form-label">Select Doctor</label>
										<div id="emailHelp" class="form-text">Select doctor from
											the list below.</div>
										<select class="form-control" name="select">
											<%
											try {
												connection = DriverManager.getConnection(url, user, pass);
												statement = connection.createStatement();
												String sql = "SELECT iddoctor, dname, type from doctor;";
												resultSet = statement.executeQuery(sql);
												while (resultSet.next()) {
											%>
											<option value="<%=resultSet.getString("iddoctor")%>"><%=resultSet.getString("dname")%>
												, (<%=resultSet.getString("type")%>)
											</option>
											<%
											}

											} catch (Exception e) {
											e.printStackTrace();
											}
											%>
										</select>

									</div>

									<div class="mb-3">
										<label class="form-label">Channel Date</label> <input
											class="form-control" type="date" name="date">
									</div>

									<input class="w-100 btn btn-primary" type="submit"
										name="submit" value="Add Appointment">
								</form>

							</div>
						</div>
					</div>

					<div class="col-sm-4 mmenu_screen--direktaction flex-fill">

						<div class="px-4 py-5 text-center">
							<img class="d-block mx-auto mb-4"
								src="images/18707003_TaeAugust11.jpg" alt="" width="auto"
								height="250">
							<h1 class="display-5 fw-bold">Appointments</h1>
							<div class="col-lg-6 mx-auto">
								<div class="d-grid gap-2 d-sm-flex justify-content-sm-center">
									<form action="viewAppoinment" method="POST">
										<div class="mb-3" Style="display: none;">
											<label for="exampleInputEmail1" class="form-label">Patient
												ID</label><br> <input class="form-control" type="text"
												value='${id}' name="pid" readonly>
										</div>

										<input class="btn btn-primary  px-4 gap-3" type="submit"
											name="submit" value="View Appointments">
									</form>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>

		</div>
	</div>
	<br>

	
<!-- LabTest Section -->
	<div class="card">
		<div class="card-body">

			<div id="mmenu_screen" class="container-fluid main_container d-flex">
				<div class="row flex-fill">
					<div class="col-sm-4 h-100"
						style="padding-left: 0px; padding-right: 0px;">
						<div class="card">
							<div class="card-body" style="height: 555px;">
								<form action="addLabTest" method="POST">

									<label class="form-label"><b>Request Lab Test</b></label>

									<div class="mb-3" Style="display: none;">
										<label for="exampleInputEmail1" class="form-label">PatientID</label>
										<input class="form-control" type="text" value='${id}'
											name="pid" readonly>
									</div>

									<div class="mb-3">
										<label class="form-label">Test Name</label> <input
											class="form-control" type="text" name="name" Style=""
											placeholder="Enter name">
									</div>

									<div class="mb-3">
										<label class="form-label">Select Lab</label>
										<div id="emailHelp" class="form-text">Select Lab from
											the list below.</div>
										<select class="form-control" name="lab">
											<%
											try {
												connection = DriverManager.getConnection(url, user, pass);
												statement = connection.createStatement();
												String sql2 = "SELECT idlabs,larea,lname from labs;";
												resultSet2 = statement.executeQuery(sql2);
												while (resultSet2.next()) {
											%>
											<option value="<%=resultSet2.getString("idlabs")%>"><%=resultSet2.getString("lname")%>
												,<%=resultSet2.getString("larea")%></option>
											<%
											}

											} catch (Exception e) {
											e.printStackTrace();
											}
											%>
										</select>

									</div>

									<div class="mb-3">
										<label class="form-label">Contact Number</label> <input
											class="form-control" type="text" name="phone" Style=""
											placeholder="Enter Number">
									</div>

									<input class="w-100 btn btn-primary" type="submit"
										name="submit" value="Request">
								</form>

							</div>
						</div>
					</div>

					<div class="col-sm-4 mmenu_screen--direktaction flex-fill">


								<div class="px-4 py-5 text-center">
									<img class="d-block mx-auto mb-4"
										src="images/8511043_3905089.jpg" alt="" width="auto"
										height="300">
									<h1 class="display-5 fw-bold">Lab Tests</h1>
									<div class="col-lg-6 mx-auto">
										<div class="d-grid gap-2 d-sm-flex justify-content-sm-center">
											<form action="labTestView.jsp" method="POST">
												<div class="mb-3" Style="display: none;">
													<label for="exampleInputEmail1" class="form-label">Patient
														ID</label><br> <input class="form-control" type="text"
														value='${id}' name="pid" readonly>
												</div>

												<input class="btn btn-primary  px-4 gap-3" type="submit"
													name="submit" value="View Lab Tests">
											</form>
										</div>
									</div>
								</div>

					</div>
				</div>
			</div>

		</div>
	</div>
	<br>
	
<!-- Order Section -->		
	<div class="card">
		<div class="card-body">

			<div id="mmenu_screen" class="container-fluid main_container d-flex">
				<div class="row flex-fill">
					<div class="col-sm-4 h-100"
						style="padding-left: 0px; padding-right: 0px;">
						<div class="card" style="height: 555px;">
							<div class="card-body">
								<form action="addorder" method="POST">

									<label class="form-label"><b>Order Medicine</b></label>

									<div class="mb-3" Style="display: none;">
										<label for="exampleInputEmail1" class="form-label">PatientID</label>
										<input class="form-control" type="text" value='${id}'
											name="pid" readonly>
									</div>

									<div class="mb-3">
										<label class="form-label">Reciver Name</label> <input
											class="form-control" type="text" name="name" Style=""
											placeholder="Enter name">
									</div>

									<div class="mb-3">
										<label class="form-label">Contact Number</label> <input
											class="form-control" type="text" name="phone" Style=""
											placeholder="Enter Number">
									</div>

									<div class="mb-3">
										<label class="form-label">Address</label> <input
											class="form-control" type="text" name="address" Style=""
											placeholder="Enter Address">
									</div>

									<div class="mb-3">
										<label class="form-label">Select Medicine</label>
										<div id="emailHelp" class="form-text">Select Medicine
											you need to order from the list below.</div>
										<select class="form-control" name="mid">
											<%
											try {
												connection = DriverManager.getConnection(url, user, pass);
												statement = connection.createStatement();
												String sql3 = "SELECT idmedicine,mname,price from medicine;";
												resultSet3 = statement.executeQuery(sql3);
												while (resultSet3.next()) {
											%>
											<option value="<%=resultSet3.getString("idmedicine")%>"><%=resultSet3.getString("mname")%>
												- Rs.<%=resultSet3.getString("price")%></option>
											<%
											}

											} catch (Exception e) {
											e.printStackTrace();
											}
											%>
										</select>

									</div>
									<input class="w-100 btn btn-primary" type="submit"
										name="submit" value="Order">
								</form>

							</div>
						</div>
					</div>

					<div class="col-sm-4 mmenu_screen--direktaction flex-fill">

								<div class="px-4 py-5 text-center">
									<img class="d-block mx-auto mb-4"
										src="images/9650843_7882.jpg" alt="" width="auto"
										height="300">
									<h1 class="display-5 fw-bold">Order Medicine</h1>
									<div class="col-lg-6 mx-auto">
										<div class="d-grid gap-2 d-sm-flex justify-content-sm-center">
											<form action="orderView.jsp" method="POST">
												<div class="mb-3" Style="display: none;">
													<label for="exampleInputEmail1" class="form-label">Patient
														ID</label><br> <input class="form-control" type="text"
														value='${id}' name="pid" readonly>
												</div>

												<input class="btn btn-primary  px-4 gap-3" type="submit"
													name="submit" value="View Orders">
											</form>
										</div>
									</div>
								</div>

					</div>
				</div>
			</div>
		</div>
	</div>
	
	<br/>

	<!-- Payment Section -->
	<div class="card">
		<div class="card-body">

			<div id="mmenu_screen" class="container-fluid main_container d-flex">
				<div class="row flex-fill">
					<div class="col-sm-4 h-100"
						style="padding-left: 0px; padding-right: 0px;">
						<div class="card">
							<div class="card-body" style="height: 555px;">
								    <form action="addPayment" method="POST" class="mx-1 mx-md-4">

                  <div class="mb-3">
                    <div class="form-outline flex-fill mb-0">
                      <label class="form-label" for="patientId">Patient ID</label>
                      <input name="pid" type="text" id="patientId" class="form-control" required />
                    </div>
                  </div>

                  <div class="mb-3">
  				
  				<div class="form-outline flex-fill mb-0">
    			<label class="form-label" for="paymentAmount">Payment Amount</label>
   				 <input name="amount" type="number" id="paymentAmount" class="form-control" required min="1" />
    			<small id="amountError" style="color: red; display: none;">Payment amount must be greater than zero.</small>
  				</div>
				</div>

				<script>
  					document.getElementById('paymentAmount').addEventListener('input', function() {
   					 var amountInput = this.value;
   					 var amountError = document.getElementById('amountError');
    					if (amountInput <= 0) {
      					amountError.style.display = 'block';}
    					else {
      					amountError.style.display = 'none';}
  						});
				</script>


                  <div class="mb-3">
                    <div class="form-outline flex-fill mb-0">
                      <label class="form-label" for="paymentDate">Payment Date</label>
                      <input name="date" type="date" id="paymentDate" class="form-control" required />
                    </div>
                  </div>

                  <div class="mb-3">
                    <label class="form-label">Select Payment Method</label>
                    <select class="form-control" name="payment_method" required>
                      <option value="CREDIT_CARD">Credit Card</option>
                      <option value="DEBIT_CARD">Debit Card</option>
                      <option value="CASH">Cash</option>
                      <option value="ONLINE">Online Transfer</option>
                    </select>
                    <div id="methodHelp" class="form-text">Select the payment method from the list below.</div>
                  </div>

              <div class="mb-3">
  <div class="form-outline flex-fill mb-0">
    <label class="form-label" for="phone">Contact Number</label>
    <input name="phone" type="text" id="phone" class="form-control" pattern="[0-9]{10}" title="Please enter a valid 10-digit phone number" required />
    <small id="phoneError" style="color: red; display: none;">Phone number must be exactly 10 digits.</small>
  </div>
</div>

<script>
  document.getElementById('phone').addEventListener('input', function() {
    var phoneInput = this.value;
    var phoneError = document.getElementById('phoneError');
    var phonePattern = /^[0-9]{10}$/;
    
    // Only show error if the input is not 10 digits
    if (!phonePattern.test(phoneInput)) {
      phoneError.style.display = 'block';
    } else {
      phoneError.style.display = 'none';
    }
  });
</script>



                  <div class="d-flex justify-content-center mx-4 mb-3 mb-lg-4">
                    <button type="submit" class="w-100 btn btn-primary">Add Payment</button>
                  </div>

                </form>
							</div>
						</div>
					</div>

					<div class="col-sm-4 mmenu_screen--direktaction flex-fill">


								<div class="px-4 py-5 text-center">
									<img class="d-block mx-auto mb-4"
										src="images/8511043_3905089.jpg" alt="" width="auto"
										height="300">
									<h1 class="display-5 fw-bold">Payments</h1>
									<div class="col-lg-6 mx-auto">
										<div class="d-grid gap-2 d-sm-flex justify-content-sm-center">
											<form action="paymentView.jsp" method="POST">
												<div class="mb-3" Style="display: none;">
													<label for="exampleInputEmail1" class="form-label">Patient
														ID</label><br> <input class="form-control" type="text"
														value='${id}' name="pid" readonly>
												</div>

												<input class="btn btn-primary  px-4 gap-3" type="submit"
													name="submit" value="View Payments">
											</form>
										</div>
									</div>
								</div>

					</div>
				</div>
			</div>

		</div>
	</div>
	<br>
	
	
	<div class="footer-basic">
    
        
    <p class="copyright">Echanneling pvt.LTD @2024</p>

   
    


</div>
	

</body>
</html>