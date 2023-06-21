<%@page import="com.pensionManagementSystem.model.PensionDetail"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.6.3/css/all.css">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<title>Pension Management</title>
<style>
.box-design {
	width: 350px;
	background-color: transparent;
	margin: 20px;
	padding: 20px;
	box-shadow: 5px 10px 8px 10px #888888;
	padding: 30px;
	border-radius: 5mm;
}
</style>
<script type="text/javascript">
	window.history.forward();
	function noBack() {
		window.history.forward();
	}
</script>
</head>
<body>
	<header>
		<nav class="navbar bg-dark p-3 bg-dark text-white">
			<h2 class="font-weight-light display-5 text-uppercase"
				style="margin: 0 auto; margin-top: 10px; margin-bottom: 10px; font-family: sans-serif; color: white">
				Pension Management Portal</h2>
			<a href="/logout" style="color: white; align: right;">Logout</a>
		</nav>
	</header>
	<section>
		<div class="container">
			<p class="lead text-center" style="color: RED" id="errorMessage">${status}</p>

			<%
			SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");
			PensionDetail pd = (PensionDetail) request.getAttribute("pensionDetail");
			String dob = sdf.format(pd.getDateOfBirth().getTime() + (1000 * 3600 * 24));
			%>

			<div class="col float-none box-design"
				style="margin: 0 auto; margin-top: 40px; padding-bottom: 60px; background-color: rgba(255, 255, 255, 0.5);">

				<div class="text-center text-dark font-light"
					style="margin-bottom: 20px;">
					<h4>Pensioner Details:</h4>
				</div>

				<div class="form-group">
					<label>Pensioner Name:</label>
					<p class="form-control is-valid">${pensionDetail.name}</p>
				</div>

				<div class="form-group">
					<label>Pensioner PAN:</label>
					<p class="form-control is-valid">${pensionDetail.pan}</p>
				</div>
				<div class="form-group">
					<label>Pension Type:</label>
					<p class="form-control is-valid">${pensionDetail.pensionType}</p>
				</div>
				<div class="form-group">
					<label>Pensioner DOB:</label>
					<p class="form-control is-valid"><%=dob%></p>
				</div>
				<div class="form-group">
					<label>Calculated Pension Amount:</label>
					<p class="form-control">${pensionDetail.pensionAmount}</p>
				</div>
				<div class="form-group float-right">
					<form:form method="GET" action="/disbursement">
						<input id="verifyBtn" name="verify" class="btn btn-dark"
							style="cursor: pointer;" type="submit" value="Disburse Pension" />
					</form:form>
				</div>
			</div>
		</div>
	</section>
</body>
</html>
