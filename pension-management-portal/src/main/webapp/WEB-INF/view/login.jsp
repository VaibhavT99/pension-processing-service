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
<script src='https://kit.fontawesome.com/a076d05399.js'
	crossorigin='anonymous'></script>
<title>Pension Management Login</title>
<style>
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
		</nav>
	</header>

	<section>
		<div class="container">

			<div class="float-none"
				style="margin: 0 auto; margin-top: 100px; background-color: rgba(255, 255, 255, 0.5); width: 400px; box-shadow: 5px 10px 8px 10px #888888; padding: 30px; border-radius: 5mm;">
				<div class="text-center text-dark font-light"
					style="margin-bottom: 40px;">
					<h2>Login</h2>
				</div>

				<form action="login" method="POST" modelAttribute="user">
					<%
					if (request.getAttribute("status") != null) {

						out.print("<p class='float-right' style='padding-bottom: 20px; color:red;'>" + request.getAttribute("status") + "</p>");
					}
					%>
					<div class="form-group">
						<input name="username" type="text" class="form-control"
							placeholder="Username" required="required" autofocus="autofocus">
					</div>

					<div class="form-group">
						<input name="password" type="password" class="form-control"
							placeholder="Password" required="required">
					</div>

					<div class="form-group float-right"
						style="margin-top: 10px; margin-bottom: 25px;">
						<input id="submitBtn" name="submit"
							class="btn btn-success btn-outline-white"
							style="cursor: pointer;" type="submit" value="Login"
							formmethod="post">
					</div>

					<div class="clearfix"></div>
				</form>
				<p style="color: RED" id="errorMessage">${msg}</p>
			</div>
		</div>
	</section>
</body>
</html>
