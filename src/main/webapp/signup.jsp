<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login & Register - Sapphire Tours</title>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        body { font-family: 'Inter', sans-serif; background: linear-gradient(135deg, #f8fafc 0%, #e8f0fe 100%); min-height: 100vh; display: flex; flex-direction: column; align-items: center; justify-content: center; padding: 40px 20px; margin: 0; color: #1a2c3e; }
        
        .logo-header { text-align: center; margin-bottom: 30px; }
        .logo-header a { font-size: 32px; font-weight: 800; color: #1a2c3e; text-decoration: none; letter-spacing: -0.5px; }
        .logo-header a span { color: #115eb6; }
        .logo-header p { color: #5a6e85; margin-top: 10px; }

        .auth-container { max-width: 1000px; width: 100%; background: white; border-radius: 24px; box-shadow: 0 20px 40px rgba(0, 0, 0, 0.08); display: flex; overflow: hidden; }
        
        .form-section { flex: 1; padding: 50px 40px; }
        .login-section { border-right: 1px solid #eef2f8; background: #fafcff; }
        
        .form-title { font-size: 24px; font-weight: 700; margin-bottom: 8px; }
        .form-subtitle { color: #5a6e85; font-size: 14px; margin-bottom: 30px; }
        
        .form-group { margin-bottom: 20px; }
        .form-group label { display: block; font-size: 13px; font-weight: 600; color: #4a627a; margin-bottom: 8px; }
        .input-with-icon { position: relative; }
        .input-with-icon i { position: absolute; left: 15px; top: 50%; transform: translateY(-50%); color: #8a9bb0; }
        .input-with-icon input { width: 100%; padding: 12px 15px 12px 40px; border: 1px solid #cbd5e1; border-radius: 12px; font-size: 14px; box-sizing: border-box; transition: 0.3s; font-family: 'Inter', sans-serif; }
        .input-with-icon input:focus { outline: none; border-color: #115eb6; box-shadow: 0 0 0 3px rgba(17,94,182,0.1); }
        
        .btn-submit { width: 100%; padding: 14px; background: #115eb6; color: white; border: none; border-radius: 40px; font-size: 15px; font-weight: 600; cursor: pointer; transition: 0.3s; margin-top: 10px; }
        .btn-submit:hover { background: #0a4a8c; transform: translateY(-2px); }
        
        .back-home { margin-top: 30px; display: inline-flex; align-items: center; gap: 8px; color: #5a6e85; text-decoration: none; font-size: 14px; transition: 0.3s; }
        .back-home:hover { color: #115eb6; }

        @media (max-width: 800px) { .auth-container { flex-direction: column; } .login-section { border-right: none; border-bottom: 1px solid #eef2f8; } }
    </style>
</head>
<body>

    <div class="logo-header">
        <a href="index.jsp">SAPPHIRE <span>TOURS</span></a>
        <p>Your journey begins here.</p>
    </div>

    <div class="auth-container">
        <div class="form-section login-section">
            <h2 class="form-title">Welcome Back</h2>
            <p class="form-subtitle">Login to access your bookings and saved trips.</p>
            
            <form action="login" method="POST">
                <div class="form-group">
                    <label>Email Address</label>
                    <div class="input-with-icon">
                        <i class="fas fa-envelope"></i>
                        <input type="email" placeholder="Enter your email" required>
                    </div>
                </div>
                <div class="form-group">
                    <label>Password</label>
                    <div class="input-with-icon">
                        <i class="fas fa-lock"></i>
                        <input type="password" placeholder="Enter your password" required>
                    </div>
                </div>
                <div style="text-align: right; margin-bottom: 20px;">
                    <a href="#" style="color: #115eb6; font-size: 13px; text-decoration: none; font-weight: 500;">Forgot Password?</a>
                </div>
                <button type="submit" class="btn-submit">Secure Login</button>
            </form>
        </div>

        <div class="form-section">
            <h2 class="form-title">Create an Account</h2>
            <p class="form-subtitle">Join us for exclusive travel deals and seamless booking.</p>
            
            <form action="signup" method="POST">
                <div class="form-group">
                    <label>Full Name</label>
                    <div class="input-with-icon">
                        <i class="fas fa-user"></i>
                        <input type="text" placeholder="John Doe" required>
                    </div>
                </div>
                <div class="form-group">
                    <label>Email Address</label>
                    <div class="input-with-icon">
                        <i class="fas fa-envelope"></i>
                        <input type="email" placeholder="john@example.com" required>
                    </div>
                </div>
                <div class="form-group">
                    <label>Phone Number</label>
                    <div class="input-with-icon">
                        <i class="fas fa-phone"></i>
                        <input type="tel" placeholder="+91 98765 43210" required>
                    </div>
                </div>
                <div class="form-group">
                    <label>Password</label>
                    <div class="input-with-icon">
                        <i class="fas fa-lock"></i>
                        <input type="password" placeholder="Create a strong password" required>
                    </div>
                </div>
                <button type="submit" class="btn-submit">Register Now</button>
            </form>
        </div>
    </div>
    
    <a href="index.jsp" class="back-home"><i class="fas fa-arrow-left"></i> Back to Home</a>

</body>
</html>