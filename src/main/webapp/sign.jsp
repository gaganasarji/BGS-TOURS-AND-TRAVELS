<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Login / Sign Up | BGS Tours and Travels</title>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">
    <style>
        * { box-sizing: border-box; margin: 0; padding: 0; }
        body { font-family: 'Inter', sans-serif; background: linear-gradient(135deg, #f8f9fa 0%, #e9ecef 100%); display: flex; justify-content: center; align-items: center; min-height: 100vh; }
        .container { background: white; border-radius: 20px; box-shadow: 0 15px 35px rgba(0,0,0,0.1); width: 100%; max-width: 900px; display: flex; overflow: hidden; min-height: 500px; }
        .form-container { padding: 40px; flex: 1; display: flex; flex-direction: column; justify-content: center; }
        .form-section { display: none; }
        .form-section.active { display: block; }
        h2 { color: #1a2c3e; margin-bottom: 20px; font-size: 28px; }
        .input-group { margin-bottom: 15px; }
        .input-group label { display: block; margin-bottom: 5px; font-size: 13px; font-weight: 600; color: #4a5568; }
        .input-group input { width: 100%; padding: 12px 15px; border: 1px solid #e2e8f0; border-radius: 8px; font-size: 14px; }
        .btn { width: 100%; padding: 12px; background: #27ae60; color: white; border: none; border-radius: 8px; font-weight: 600; cursor: pointer; margin-top: 10px; }
        .btn:hover { background: #219653; }
        .toggle-text { text-align: center; margin-top: 20px; font-size: 14px; color: #4a5568; }
        .toggle-text a { color: #27ae60; text-decoration: none; font-weight: 600; cursor: pointer; }
        .alert { padding: 10px; border-radius: 8px; margin-bottom: 15px; font-size: 14px; text-align: center; }
        .alert-error { background: #fee2e2; color: #b91c1c; }
        .alert-success { background: #dcfce3; color: #15803d; }
        .info-panel { flex: 1; background: linear-gradient(rgba(39, 174, 96, 0.8), rgba(26, 44, 62, 0.9)), url('https://images.unsplash.com/photo-1596423735880-5c6a5a9d80d2') center/cover; color: white; padding: 40px; display: flex; flex-direction: column; justify-content: center; text-align: center; }
    </style>
</head>
<body>
    <div class="container">
        <!-- Form Area -->
        <div class="form-container">
            <!-- Login Error Handling -->
            <% if(request.getAttribute("loginError") != null) { %>
                <div class="alert alert-error"><%=request.getAttribute("loginError")%></div>
            <% } %>
            <% if(request.getAttribute("signupError") != null) { %>
                <div class="alert alert-error"><%=request.getAttribute("signupError")%></div>
            <% } %>
            <% if(request.getAttribute("signupSuccess") != null) { %>
                <div class="alert alert-success"><%=request.getAttribute("signupSuccess")%></div>
            <% } %>

            <!-- Login Form -->
            <div id="loginForm" class="form-section active">
                <h2>Welcome Back</h2>
                <form action="login" method="POST">
     <div class="form-group">
        <label class="form-label" for="email">Email Address</label>
        <input type="email" id="email" name="mail" class="form-input" required>
     </div>
     <div class="form-group">
        <label class="form-label" for="password">Password</label>
        <div class="password-wrapper">
            <input type="password" id="password" name="password" class="form-input" required>
        </div>
    </div>
    <button type="submit" class="btn-login">Login to Account</button>
	</form>
                <div class="toggle-text">Don't have an account? <a onclick="toggleForms()">Sign up here</a></div>
            </div>

            <!-- Signup Form -->
            <div id="signupForm" class="form-section">
                <h2>Create Account</h2>
                <form action="sign" method="POST">
                    <div class="input-group">
                        <label>Full Name</label>
                        <input type="text" name="userName" required>
                    </div>
                    <div class="input-group">
                        <label>Phone Number</label>
                        <input type="text" name="phone" required>
                    </div>
                    <div class="input-group">
                        <label>Email Address</label>
                        <input type="email" name="userEmail" required>
                    </div>
                    <div class="input-group">
                        <label>Address</label>
                        <input type="text" name="address" required>
                    </div>
                    <div class="input-group">
                        <label>Password</label>
                        <input type="password" name="password" required>
                    </div>
                    <div class="input-group">
                        <label>Confirm Password</label>
                        <input type="password" name="confirm" required>
                    </div>
                    <button type="submit" class="btn">Sign Up</button>
                </form>
                <div class="toggle-text">Already have an account? <a onclick="toggleForms()">Login here</a></div>
            </div>
        </div>
        
        <!-- Info Panel -->
        <div class="info-panel">
            <h1 style="font-size: 36px; margin-bottom: 20px;">BGS Tours</h1>
            <p style="font-size: 16px; line-height: 1.6;">Discover the hidden gems of Karnataka. Sign in to manage your bookings and explore exclusive travel packages.</p>
        </div>
    </div>

    <script>
        function toggleForms() {
            document.getElementById('loginForm').classList.toggle('active');
            document.getElementById('signupForm').classList.toggle('active');
        }
    </script>
</body>
</html>