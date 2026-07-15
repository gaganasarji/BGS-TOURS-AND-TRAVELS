<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sign Up - BGS Tours & Travels</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700;800&family=Inter:wght@300;400;500;600&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        :root {
            --primary: #0f4c75; --primary-light: #247ba0; --primary-dark: #0a3550;
            --accent: #ff6b6b; --gold: #ffc300; --success: #06d6a0; --error: #ff6b6b;
            --warning: #ffc300; --bg-light: #f9f9f9; --bg-white: #ffffff;
            --text-dark: #1a1a1a; --text-gray: #666666; --border-light: #e8e8e8;
            --shadow-sm: 0 2px 8px rgba(0, 0, 0, 0.08); --shadow-md: 0 8px 24px rgba(0, 0, 0, 0.12);
            --shadow-lg: 0 16px 40px rgba(0, 0, 0, 0.16);
        }
        * { margin: 0; padding: 0; box-sizing: border-box; }
        body {
            font-family: 'Inter', sans-serif; color: var(--text-dark);
            background: linear-gradient(135deg, var(--primary) 0%, var(--primary-light) 100%);
            min-height: 100vh; display: flex; align-items: center; justify-content: center; padding: 20px;
        }
        a { text-decoration: none; color: inherit; }
        .navbar {
            position: fixed; top: 0; left: 0; right: 0; display: flex;
            justify-content: space-between; align-items: center; padding: 16px 5%;
            background: rgba(255, 255, 255, 0.98); backdrop-filter: blur(10px);
            z-index: 1000; box-shadow: var(--shadow-sm); border-bottom: 1px solid var(--border-light);
        }
        .logo { font-family: 'Poppins', sans-serif; font-size: 24px; font-weight: 700; color: var(--primary); }
        .logo span { color: var(--accent); }
        .nav-right { display: flex; align-items: center; gap: 20px; }
        .nav-text { color: var(--text-gray); font-size: 14px; }
        .nav-text strong { color: var(--text-dark); }
        .btn-home { background: var(--primary); color: white; padding: 10px 24px; border-radius: 8px; font-weight: 600; font-size: 14px; transition: all 0.3s ease; border: none; cursor: pointer; }
        .btn-home:hover { background: var(--primary-dark); transform: translateY(-2px); box-shadow: var(--shadow-md); }
        .signup-container { background: white; border-radius: 20px; box-shadow: var(--shadow-lg); overflow: hidden; max-width: 800px; width: 100%; margin-top: 80px; display: grid; grid-template-columns: 1fr 1fr; }
        .signup-hero { background: linear-gradient(135deg, var(--primary) 0%, var(--primary-light) 100%); color: white; padding: 50px 40px; display: flex; flex-direction: column; justify-content: center; }
        .signup-hero h1 { font-family: 'Poppins', sans-serif; font-size: 2.5rem; font-weight: 800; margin-bottom: 20px; line-height: 1.2; }
        .signup-hero p { font-size: 1rem; opacity: 0.9; line-height: 1.6; margin-bottom: 30px; }
        .signup-benefits { display: flex; flex-direction: column; gap: 18px; }
        .benefit { display: flex; align-items: flex-start; gap: 12px; }
        .benefit i { font-size: 20px; margin-top: 2px; color: var(--gold); flex-shrink: 0; }
        .benefit-text { font-size: 14px; opacity: 0.9; line-height: 1.5; }
        .signup-form-wrapper { padding: 50px 40px; overflow-y: auto; max-height: 700px; }
        .form-header { margin-bottom: 35px; }
        .form-header h2 { font-family: 'Poppins', sans-serif; font-size: 28px; font-weight: 700; color: var(--text-dark); margin-bottom: 8px; }
        .form-header p { color: var(--text-gray); font-size: 14px; }
        .form-group { margin-bottom: 20px; }
        .form-label { display: block; margin-bottom: 8px; color: var(--text-dark); font-weight: 600; font-size: 14px; }
        .form-input { width: 100%; padding: 12px 16px; border: 2px solid var(--border-light); border-radius: 10px; font-size: 14px; font-family: 'Inter', sans-serif; transition: all 0.3s ease; background: white; }
        .form-input:focus { outline: none; border-color: var(--primary); background: #f0f7ff; box-shadow: 0 0 0 3px rgba(15, 76, 117, 0.1); }
        .password-strength { height: 4px; background: var(--border-light); border-radius: 2px; margin-top: 8px; overflow: hidden; }
        .password-strength-bar { height: 100%; width: 0; background: var(--error); transition: all 0.3s ease; border-radius: 2px; }
        .password-strength-text { font-size: 12px; margin-top: 4px; color: var(--error); font-weight: 600; }
        .form-checkbox { display: flex; align-items: flex-start; gap: 10px; margin-bottom: 20px; padding: 12px; background: var(--bg-light); border-radius: 10px; }
        .checkbox-input { width: 18px; height: 18px; cursor: pointer; accent-color: var(--primary); margin-top: 2px; flex-shrink: 0; }
        .checkbox-label { font-size: 13px; color: var(--text-gray); cursor: pointer; line-height: 1.5; }
        .btn-signup { width: 100%; padding: 14px; background: linear-gradient(135deg, var(--primary), var(--primary-light)); color: white; border: none; border-radius: 10px; font-weight: 700; font-size: 16px; cursor: pointer; transition: all 0.3s ease; font-family: 'Poppins', sans-serif; margin-bottom: 12px; }
        .btn-signup:hover { transform: translateY(-3px); box-shadow: var(--shadow-md); }
        .status-alert { padding: 12px 16px; border-radius: 10px; margin-bottom: 20px; font-size: 14px; display: block; }
        .alert-error { background: #ffe6e6; color: var(--error); border-left: 4px solid var(--error); }
        .alert-success { background: #e6f7f0; color: var(--success); border-left: 4px solid var(--success); }
        @media (max-width: 768px) { .signup-container { grid-template-columns: 1fr; margin-top: 70px; } .signup-hero { display: none; } }
    </style>
</head>
<body>

    <nav class="navbar">
        <a href="index.jsp" class="logo">BGS <span>TOURS</span></a>
        <div class="nav-right">
            <span class="nav-text">Already have an account? <strong><a href="login.jsp">Log In</a></strong></span>
            <a href="index.jsp" class="btn-home">← Back to Home</a>
        </div>
    </nav>

    <div class="signup-container">
        <div class="signup-hero">
            <h1>Join Our Travel Community</h1>
            <p>Create your account and unlock exclusive travel deals and seamless booking experiences.</p>
            <div class="signup-benefits">
                <div class="benefit"><i class="fas fa-check"></i><div class="benefit-text">Exclusive discounts on premium packages</div></div>
                <div class="benefit"><i class="fas fa-check"></i><div class="benefit-text">24/7 travel assistance support</div></div>
            </div>
        </div>

        <div class="signup-form-wrapper">
            <div class="form-header">
                <h2>Create Account</h2>
                <p>Join thousands of travelers exploring the world with BGS Tours</p>
            </div>

            <!-- Server-Side Error Alert Banner -->
            <% if (request.getAttribute("signupError") != null) { %>
                <div class="status-alert alert-error">
                    <i class="fas fa-exclamation-circle"></i> <%= request.getAttribute("signupError") %>
                </div>
            <% } %>

            <!-- Server-Side Success Alert Banner -->
            <% if (request.getAttribute("signupSuccess") != null) { %>
                <div class="status-alert alert-success">
                    <i class="fas fa-check-circle"></i> <%= request.getAttribute("signupSuccess") %>
                </div>
            <% } %>

            <!-- Local Client JS Validation Warning Banner -->
            <div class="status-alert alert-error" id="clientErrorMessage" style="display: none;"></div>

            <!-- FORM COMPONENT WITH CORRECT ACTION AND METHOD -->
            <form id="signupForm" action="signup" method="POST">
                
                <div class="form-group">
                    <label class="form-label" for="userName">Full Name</label>
                    <input type="text" id="userName" name="userName" class="form-input" placeholder="John Doe" required>
                </div>

                <div class="form-group">
                    <label class="form-label" for="userEmail">Email Address</label>
                    <input type="email" id="userEmail" name="userEmail" class="form-input" placeholder="you@example.com" required>
                </div>

                <div class="form-group">
                    <label class="form-label" for="phone">Phone Number</label>
                    <input type="tel" id="phone" name="phone" class="form-input" placeholder="+91 9876543210" required>
                </div>

                <div class="form-group">
                    <label class="form-label" for="address">Address / Country</label>
                    <input type="text" id="address" name="address" class="form-input" placeholder="Bengaluru, India" required>
                </div>

                <div class="form-group">
                    <label class="form-label" for="password">Password</label>
                    <input type="password" id="password" name="password" class="form-input" placeholder="At least 8 characters" required>
                    <div class="password-strength"><div class="password-strength-bar" id="strengthBar"></div></div>
                    <div class="password-strength-text" id="strengthText">Weak</div>
                </div>

                <div class="form-group">
                    <label class="form-label" for="confirmPassword">Confirm Password</label>
                    <input type="password" id="confirmPassword" name="confirmPassword" class="form-input" placeholder="Re-enter your password" required>
                </div>

                <div class="form-checkbox">
                    <input type="checkbox" id="terms" name="terms" class="checkbox-input" required>
                    <label class="checkbox-label" for="terms">I agree to the Terms & Conditions</label>
                </div>

                <button type="submit" class="btn-signup">Create My Account</button>
            </form>
        </div>
    </div>

    <script>
        // Password Strength Indicator Logic
        const passwordInput = document.getElementById('password');
        const strengthBar = document.getElementById('strengthBar');
        const strengthText = document.getElementById('strengthText');

        passwordInput.addEventListener('input', function() {
            const password = this.value;
            let strength = 0;
            if (password.length >= 8) strength += 40;
            if (password.match(/[A-Z]/)) strength += 30;
            if (password.match(/[0-9!@#$%^&*]/)) strength += 30;

            strengthBar.style.width = strength + '%';
            if (strength < 40) { strengthText.textContent = 'Weak'; strengthBar.style.background = '#ff6b6b'; }
            else if (strength < 70) { strengthText.textContent = 'Fair'; strengthBar.style.background = '#ffc300'; }
            else { strengthText.textContent = 'Strong'; strengthBar.style.background = '#06d6a0'; }
        });

        // Form Submission interceptor
        const signupForm = document.getElementById('signupForm');
        const clientError = document.getElementById('clientErrorMessage');

        signupForm.addEventListener('submit', function(e) {
            e.preventDefault(); // Pause submission for structural safety checks

            const password = document.getElementById('password').value;
            const confirmPassword = document.getElementById('confirmPassword').value;

            if (password.length < 8) {
                showClientError('Password must be at least 8 characters long.');
                return;
            }

            if (password !== confirmPassword) {
                showClientError('Passwords do not match.');
                return;
            }

            // Client criteria met -> Pass cleanly to the J2EE Servlet container
            clientError.style.display = 'none';
            signupForm.submit();
        });

        function showClientError(msg) {
            clientError.textContent = msg;
            clientError.style.display = 'block';
            window.scrollTo({ top: 0, behavior: 'smooth' });
        }
    </script>
</body>
</html>