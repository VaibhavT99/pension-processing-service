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
<title>Pension Management</title>
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
				style="margin: 0 auto; margin-bottom: 10px; margin-top: 10px; font-family: sans-serif; color: white">
				Pension Management Portal</h2>
			<a href="/logout" style="color: white; align: right;">Logout</a>
		</nav>
	</header>
	<section>
		<div class="container" style="margin-top: 200px;">

			<h1 class="font-weight-bold" style="color: #336600" id="errorMessage">${msg}</h1>
			<br>
			<h3 class="text-success font-weight-bold" style="color: #145214"
				id="errorMessage">${info}</h3>
		</div>
	</section>
</body>
</html>
