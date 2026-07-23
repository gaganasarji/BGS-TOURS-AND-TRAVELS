<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>Login / Sign Up | BGS Tours & Travels</title>

<link
	href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap"
	rel="stylesheet">

<style>
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
	font-family: 'Inter', sans-serif;
}

body {
	background: linear-gradient(135deg, #f4f7fa, #dfe9f3);
	min-height: 100vh;
	display: flex;
	justify-content: center;
	align-items: center;
	padding: 30px;
}

.container {
	width: 100%;
	max-width: 950px;
	background: #fff;
	border-radius: 20px;
	overflow: hidden;
	display: flex;
	box-shadow: 0 15px 35px rgba(0,0,0,0.15);
}

.form-container {
	flex: 1;
	padding: 45px;
}

.form-section {
	display: none;
}

.form-section.active {
	display: block;
}

.form-section h2 {
	margin-bottom: 25px;
	color: #1a2c3e;
	font-size: 30px;
	font-weight: 700;
}

.form-group {
	margin-bottom: 18px;
}

.form-label {
	display: block;
	margin-bottom: 7px;
	font-size: 14px;
	font-weight: 600;
	color: #444;
}

.form-input {
	width: 100%;
	padding: 12px 15px;
	border: 1px solid #dcdcdc;
	border-radius: 8px;
	font-size: 15px;
	transition: 0.3s;
}

.form-input:focus {
	border-color: #27ae60;
	outline: none;
	box-shadow: 0 0 5px rgba(39,174,96,.3);
}

.btn-login,
.btn-signup {
	width: 100%;
	padding: 13px;
	border: none;
	border-radius: 8px;
	background: #27ae60;
	color: white;
	font-size: 16px;
	font-weight: bold;
	cursor: pointer;
	transition: .3s;
	margin-top: 10px;
}

.btn-login:hover,
.btn-signup:hover {
	background: #219150;
}

.toggle-text {
	margin-top: 18px;
	text-align: center;
	font-size: 14px;
}

.toggle-text a {
	color: #27ae60;
	font-weight: bold;
	cursor: pointer;
	text-decoration: none;
}

.alert {
	padding: 12px;
	border-radius: 8px;
	margin-bottom: 20px;
	font-size: 14px;
	text-align: center;
}

.alert-error {
	background: #fdecea;
	color: #c0392b;
}

.alert-success {
	background: #eafaf1;
	color: #27ae60;
}

.info-panel {
	flex: 1;
	background: linear-gradient(rgba(0,0,0,.45), rgba(0,0,0,.45)),
		url("https://images.unsplash.com/photo-1507525428034-b723cf961d3e")
		center center/cover;
	color: white;
	display: flex;
	flex-direction: column;
	justify-content: center;
	align-items: center;
	padding: 40px;
	text-align: center;
}

.info-panel h1 {
	font-size: 42px;
	margin-bottom: 20px;
}

.info-panel p {
	font-size: 17px;
	line-height: 1.7;
}

@media(max-width:850px){

.container{
	flex-direction:column;
}

.info-panel{
	display:none;
}

.form-container{
	padding:30px;
}

}
</style>

</head>

<body>

<div class="container">

<div class="form-container">

<%
if(request.getAttribute("loginError")!=null){
%>

<div class="alert alert-error">
<%=request.getAttribute("loginError")%>
</div>

<%
}
%>

<%
if(request.getAttribute("signupError")!=null){
%>

<div class="alert alert-error">
<%=request.getAttribute("signupError")%>
</div>

<%
}
%>

<%
if(request.getAttribute("signupSuccess")!=null){
%>

<div class="alert alert-success">
<%=request.getAttribute("signupSuccess")%>
</div>

<%
}
%>

<!-- Login Form -->

<div id="loginForm" class="form-section active">

	<h2>Welcome Back</h2>

	<form action="login" method="POST">

		<div class="form-group">
			<label class="form-label">Email Address</label>
			<input type="email"
				   name="mail"
				   class="form-input"
				   placeholder="Enter your email"
				   required>
		</div>

		<div class="form-group">
			<label class="form-label">Password</label>
			<input type="password"
				   name="password"
				   class="form-input"
				   placeholder="Enter your password"
				   required>
		</div>

		<button type="submit" class="btn-login">
			Login
		</button>

	</form>

	<div class="toggle-text">
		Don't have an account?
		<a onclick="toggleForms()">Sign Up</a>
	</div>

</div>



<!-- Signup Form -->

<div id="signupForm" class="form-section">

	<h2>Create Account</h2>

	<form action="signup" method="POST">

		<div class="form-group">
			<label class="form-label">Full Name</label>
			<input type="text"
				   name="userName"
				   class="form-input"
				   placeholder="Enter your full name"
				   required>
		</div>

		<div class="form-group">
			<label class="form-label">Phone Number</label>
			<input type="text"
				   name="phone"
				   class="form-input"
				   placeholder="Enter phone number"
				   required>
		</div>

		<div class="form-group">
			<label class="form-label">Email Address</label>
			<input type="email"
				   name="userEmail"
				   class="form-input"
				   placeholder="Enter your email"
				   required>
		</div>

		<div class="form-group">
			<label class="form-label">Address</label>
			<input type="text"
				   name="address"
				   class="form-input"
				   placeholder="Enter your address"
				   required>
		</div>

		<div class="form-group">
			<label class="form-label">Password</label>
			<input type="password"
				   name="password"
				   class="form-input"
				   placeholder="Create password"
				   required>
		</div>

		<div class="form-group">
			<label class="form-label">Confirm Password</label>
			<input type="password"
				   name="confirm"
				   class="form-input"
				   placeholder="Confirm password"
				   required>
		</div>

		<button type="submit" class="btn-signup">
			Create Account
		</button>

	</form>

	<div class="toggle-text">
		Already have an account?
		<a onclick="toggleForms()">Login</a>
	</div>

</div>

</div>



<!-- Right Side Panel -->

<div class="info-panel">

	<h1>BGS Tours & Travels</h1>

	<p>
		Explore Karnataka's most beautiful destinations with
		BGS Tours & Travels.
		Book exciting travel packages,
		manage your bookings,
		and enjoy a seamless travel experience.
	</p>

</div>

</div>

<script>

function toggleForms() {

    document.getElementById("loginForm").classList.toggle("active");
    document.getElementById("signupForm").classList.toggle("active");

}

// Automatically show Signup form if signup fails or succeeds
window.onload = function () {

<%
if (request.getAttribute("signupError") != null ||
    request.getAttribute("signupSuccess") != null) {
%>

    document.getElementById("loginForm").classList.remove("active");
    document.getElementById("signupForm").classList.add("active");

<%
}
%>

};

</script>

</body>

</html>