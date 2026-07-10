<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login - BGS Tours & Travels</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700;800&family=Inter:wght@300;400;500;600&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    
    <style>
        /* === DESIGN TOKENS === */
        :root {
            --primary: #0f4c75;
            --primary-light: #247ba0;
            --primary-dark: #0a3550;
            --accent: #ff6b6b;
            --gold: #ffc300;
            --success: #06d6a0;
            --error: #ff6b6b;
            --bg-light: #f9f9f9;
            --bg-white: #ffffff;
            --text-dark: #1a1a1a;
            --text-gray: #666666;
            --border-light: #e8e8e8;
            --shadow-sm: 0 2px 8px rgba(0, 0, 0, 0.08);
            --shadow-md: 0 8px 24px rgba(0, 0, 0, 0.12);
            --shadow-lg: 0 16px 40px rgba(0, 0, 0, 0.16);
        }

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        html {
            scroll-behavior: smooth;
        }

        body {
            font-family: 'Inter', sans-serif;
            color: var(--text-dark);
            background: linear-gradient(135deg, var(--primary) 0%, var(--primary-light) 100%);
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 20px;
        }

        a {
            text-decoration: none;
            color: inherit;
        }

        /* === NAVBAR === */
        .navbar {
            position: fixed;
            top: 0;
            left: 0;
            right: 0;
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 16px 5%;
            background: rgba(255, 255, 255, 0.98);
            backdrop-filter: blur(10px);
            z-index: 1000;
            box-shadow: var(--shadow-sm);
            border-bottom: 1px solid var(--border-light);
        }

        .logo {
            font-family: 'Poppins', sans-serif;
            font-size: 24px;
            font-weight: 700;
            color: var(--primary);
            letter-spacing: -0.5px;
        }

        .logo span {
            color: var(--accent);
        }

        .nav-right {
            display: flex;
            align-items: center;
            gap: 20px;
        }

        .nav-text {
            color: var(--text-gray);
            font-size: 14px;
        }

        .nav-text strong {
            color: var(--text-dark);
        }

        .btn-home {
            background: var(--primary);
            color: white;
            padding: 10px 24px;
            border-radius: 8px;
            font-weight: 600;
            font-size: 14px;
            transition: all 0.3s ease;
            border: none;
            cursor: pointer;
        }

        .btn-home:hover {
            background: var(--primary-dark);
            transform: translateY(-2px);
            box-shadow: var(--shadow-md);
        }

        /* === MAIN CONTAINER === */
        .login-container {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 40px;
            max-width: 1000px;
            width: 100%;
            align-items: center;
            margin-top: 60px;
        }

        /* === LEFT SECTION === */
        .login-hero {
            color: white;
            z-index: 10;
        }

        .login-hero h1 {
            font-family: 'Poppins', sans-serif;
            font-size: 3rem;
            font-weight: 800;
            margin-bottom: 20px;
            line-height: 1.2;
        }

        .login-hero p {
            font-size: 1.1rem;
            opacity: 0.9;
            line-height: 1.6;
            margin-bottom: 30px;
        }

        .hero-features {
            display: flex;
            flex-direction: column;
            gap: 20px;
        }

        .hero-feature {
            display: flex;
            align-items: flex-start;
            gap: 15px;
        }

        .hero-feature i {
            font-size: 24px;
            margin-top: 4px;
            color: var(--gold);
        }

        .hero-feature h3 {
            font-family: 'Poppins', sans-serif;
            font-size: 16px;
            font-weight: 600;
            margin-bottom: 6px;
        }

        .hero-feature p {
            font-size: 14px;
            opacity: 0.85;
            margin: 0;
        }

        /* === RIGHT SECTION === */
        .login-form-wrapper {
            background: white;
            border-radius: 20px;
            padding: 50px 40px;
            box-shadow: var(--shadow-lg);
            animation: slideIn 0.6s ease;
        }

        .form-header {
            margin-bottom: 40px;
            text-align: center;
        }

        .form-header h2 {
            font-family: 'Poppins', sans-serif;
            font-size: 28px;
            font-weight: 700;
            color: var(--text-dark);
            margin-bottom: 8px;
        }

        .form-header p {
            color: var(--text-gray);
            font-size: 14px;
        }

        .form-group {
            margin-bottom: 24px;
        }

        .form-label {
            display: block;
            margin-bottom: 8px;
            color: var(--text-dark);
            font-weight: 600;
            font-size: 14px;
        }

        .form-input {
            width: 100%;
            padding: 12px 16px;
            border: 2px solid var(--border-light);
            border-radius: 10px;
            font-size: 14px;
            font-family: 'Inter', sans-serif;
            transition: all 0.3s ease;
            background: white;
        }

        .form-input:focus {
            outline: none;
            border-color: var(--primary);
            background: #f0f7ff;
            box-shadow: 0 0 0 3px rgba(15, 76, 117, 0.1);
        }

        .form-input::placeholder {
            color: var(--text-gray);
        }

        .password-wrapper {
            position: relative;
        }

        .toggle-password {
            position: absolute;
            right: 16px;
            top: 50%;
            transform: translateY(-50%);
            background: none;
            border: none;
            color: var(--text-gray);
            cursor: pointer;
            font-size: 18px;
            transition: color 0.3s ease;
        }

        .toggle-password:hover {
            color: var(--primary);
        }

        .form-checkbox {
            display: flex;
            align-items: center;
            gap: 8px;
            margin-bottom: 24px;
        }

        .checkbox-input {
            width: 18px;
            height: 18px;
            cursor: pointer;
            accent-color: var(--primary);
        }

        .checkbox-label {
            font-size: 14px;
            color: var(--text-gray);
            cursor: pointer;
        }

        .checkbox-label a {
            color: var(--primary);
            font-weight: 600;
            transition: color 0.3s ease;
        }

        .checkbox-label a:hover {
            color: var(--accent);
        }

        .btn-login {
            width: 100%;
            padding: 14px;
            background: linear-gradient(135deg, var(--primary), var(--primary-light));
            color: white;
            border: none;
            border-radius: 10px;
            font-weight: 700;
            font-size: 16px;
            cursor: pointer;
            transition: all 0.3s ease;
            font-family: 'Poppins', sans-serif;
            margin-bottom: 16px;
        }

        .btn-login:hover {
            transform: translateY(-3px);
            box-shadow: var(--shadow-md);
        }

        .btn-login:active {
            transform: translateY(-1px);
        }

        /* === DIVIDER === */
        .form-divider {
            display: flex;
            align-items: center;
            gap: 12px;
            margin: 30px 0;
        }

        .form-divider::before,
        .form-divider::after {
            content: '';
            flex: 1;
            height: 1px;
            background: var(--border-light);
        }

        .form-divider span {
            color: var(--text-gray);
            font-size: 13px;
            font-weight: 500;
        }

        /* === SOCIAL LOGIN === */
        .social-login {
            display: flex;
            gap: 12px;
            margin-bottom: 24px;
        }

        .social-btn {
            flex: 1;
            padding: 12px;
            border: 2px solid var(--border-light);
            background: white;
            border-radius: 10px;
            font-size: 20px;
            cursor: pointer;
            transition: all 0.3s ease;
            color: var(--text-dark);
        }

        .social-btn:hover {
            border-color: var(--primary);
            background: #f0f7ff;
            transform: translateY(-3px);
        }

        /* === FOOTER MESSAGE === */
        .form-footer {
            text-align: center;
            margin-top: 24px;
            padding-top: 24px;
            border-top: 1px solid var(--border-light);
        }

        .form-footer p {
            color: var(--text-gray);
            font-size: 14px;
            margin: 0;
        }

        .form-footer a {
            color: var(--primary);
            font-weight: 700;
            transition: color 0.3s ease;
        }

        .form-footer a:hover {
            color: var(--accent);
        }

        /* === ERROR MESSAGE === */
        .error-message {
            display: none;
            background: #ffe6e6;
            color: var(--error);
            padding: 12px 16px;
            border-radius: 10px;
            margin-bottom: 24px;
            font-size: 14px;
            border-left: 4px solid var(--error);
        }

        .error-message.show {
            display: block;
            animation: shake 0.4s ease;
        }

        /* === SUCCESS MESSAGE === */
        .success-message {
            display: none;
            background: #e6f7f0;
            color: var(--success);
            padding: 12px 16px;
            border-radius: 10px;
            margin-bottom: 24px;
            font-size: 14px;
            border-left: 4px solid var(--success);
        }

        .success-message.show {
            display: block;
        }

        /* === ANIMATIONS === */
        @keyframes slideIn {
            from {
                opacity: 0;
                transform: translateY(30px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        @keyframes shake {
            0%, 100% { transform: translateX(0); }
            25% { transform: translateX(-10px); }
            75% { transform: translateX(10px); }
        }

        /* === RESPONSIVE === */
        @media (max-width: 1024px) {
            .login-container {
                gap: 30px;
            }

            .login-form-wrapper {
                padding: 40px 30px;
            }

            .login-hero h1 {
                font-size: 2.5rem;
            }
        }

        @media (max-width: 768px) {
            .login-container {
                grid-template-columns: 1fr;
                margin-top: 80px;
            }

            .login-hero {
                display: none;
            }

            .login-form-wrapper {
                padding: 35px 25px;
            }

            .form-header h2 {
                font-size: 24px;
            }

            .form-group {
                margin-bottom: 20px;
            }

            .social-login {
                margin-bottom: 20px;
            }
        }

        @media (max-width: 480px) {
            .navbar {
                padding: 12px 4%;
            }

            .nav-text {
                display: none;
            }

            .login-form-wrapper {
                padding: 30px 20px;
            }

            .form-header h2 {
                font-size: 20px;
            }

            .btn-login {
                padding: 12px;
            }

            .social-btn {
                font-size: 18px;
            }
        }
    </style>
</head>
<body>

    <!-- NAVBAR -->
    <nav class="navbar">
        <a href="index.jsp" class="logo">BGS <span>TOURS</span></a>
        <div class="nav-right">
            <span class="nav-text">Don't have an account? <strong><a href="signup.jsp">Sign Up</a></strong></span>
            <a href="index.jsp" class="btn-home">← Back to Home</a>
        </div>
    </nav>

    <!-- LOGIN CONTAINER -->
    <div class="login-container">
        <!-- LEFT SECTION -->
        <div class="login-hero">
            <h1>Welcome Back!</h1>
            <p>Log in to your BGS Tours account to access exclusive deals, manage your bookings, and explore more destinations.</p>
            
            <div class="hero-features">
                <div class="hero-feature">
                    <i class="fas fa-check-circle"></i>
                    <div>
                        <h3>Easy Booking</h3>
                        <p>Quick and secure booking process for all your travel needs.</p>
                    </div>
                </div>
                <div class="hero-feature">
                    <i class="fas fa-shield-alt"></i>
                    <div>
                        <h3>Safe & Secure</h3>
                        <p>Your data is protected with industry-leading security standards.</p>
                    </div>
                </div>
                <div class="hero-feature">
                    <i class="fas fa-star"></i>
                    <div>
                        <h3>Exclusive Offers</h3>
                        <p>Access special discounts and loyalty rewards for members.</p>
                    </div>
                </div>
            </div>
        </div>

        <!-- RIGHT SECTION - LOGIN FORM -->
        <div class="login-form-wrapper">
            <div class="form-header">
                <h2>Login</h2>
                <p>Enter your credentials to access your account</p>
            </div>

            <form id="loginForm">
                <!-- Error Message -->
                <div class="error-message" id="errorMessage"></div>

                <!-- Success Message -->
                <div class="success-message" id="successMessage"></div>

                <!-- Email Input -->
                <div class="form-group">
                    <label class="form-label" for="email">Email Address</label>
                    <input 
                        type="email" 
                        id="email" 
                        name="email" 
                        class="form-input" 
                        placeholder="you@example.com" 
                        required
                    >
                </div>

                <!-- Password Input -->
                <div class="form-group">
                    <label class="form-label" for="password">Password</label>
                    <div class="password-wrapper">
                        <input 
                            type="password" 
                            id="password" 
                            name="password" 
                            class="form-input" 
                            placeholder="Enter your password" 
                            required
                        >
                        <button type="button" class="toggle-password" id="togglePassword">
                            <i class="fas fa-eye"></i>
                        </button>
                    </div>
                </div>

                <!-- Remember Me & Forgot Password -->
                <div class="form-checkbox">
                    <input 
                        type="checkbox" 
                        id="rememberMe" 
                        name="rememberMe" 
                        class="checkbox-input"
                    >
                    <label class="checkbox-label" for="rememberMe">
                        Remember me  |  <a href="#">Forgot Password?</a>
                    </label>
                </div>

                <!-- Login Button -->
                <button type="submit" class="btn-login">Login to Account</button>

                <!-- Divider -->
                <div class="form-divider">
                    <span>Or continue with</span>
                </div>

                <!-- Social Login -->
                <div class="social-login">
                    <button type="button" class="social-btn" title="Login with Google">
                        <i class="fab fa-google"></i>
                    </button>
                    <button type="button" class="social-btn" title="Login with Facebook">
                        <i class="fab fa-facebook-f"></i>
                    </button>
                    <button type="button" class="social-btn" title="Login with Apple">
                        <i class="fab fa-apple"></i>
                    </button>
                </div>

                <!-- Footer Message -->
                <div class="form-footer">
                    <p>Don't have an account? <a href="signup.jsp">Create one now</a></p>
                </div>
            </form>
        </div>
    </div>

    <!-- SCRIPTS -->
    <script>
        // Toggle Password Visibility
        const togglePassword = document.getElementById('togglePassword');
        const passwordInput = document.getElementById('password');

        togglePassword.addEventListener('click', function(e) {
            e.preventDefault();
            const type = passwordInput.type === 'password' ? 'text' : 'password';
            passwordInput.type = type;
            
            // Change icon
            const icon = this.querySelector('i');
            icon.classList.toggle('fa-eye');
            icon.classList.toggle('fa-eye-slash');
        });

        // Form Submission
        const loginForm = document.getElementById('loginForm');
        const errorMessage = document.getElementById('errorMessage');
        const successMessage = document.getElementById('successMessage');

        loginForm.addEventListener('submit', function(e) {
            e.preventDefault();

            const email = document.getElementById('email').value.trim();
            const password = document.getElementById('password').value.trim();

            // Clear previous messages
            errorMessage.classList.remove('show');
            successMessage.classList.remove('show');

            // Validation
            if (!email || !password) {
                showError('Please fill in all fields');
                return;
            }

            if (!isValidEmail(email)) {
                showError('Please enter a valid email address');
                return;
            }

            if (password.length < 6) {
                showError('Password must be at least 6 characters');
                return;
            }

            // Show success message
            showSuccess('Login successful! Redirecting...');

            // Simulate login process
            setTimeout(() => {
                // In a real application, this would authenticate with the backend
                window.location.href = 'dashboard.jsp'; // Replace with actual dashboard URL
            }, 2000);
        });

        // Email validation function
        function isValidEmail(email) {
            const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
            return emailRegex.test(email);
        }

        // Show error message
        function showError(message) {
            errorMessage.textContent = message;
            errorMessage.classList.add('show');
        }

        // Show success message
        function showSuccess(message) {
            successMessage.textContent = message;
            successMessage.classList.add('show');
        }

        // Social Login Handlers
        document.querySelectorAll('.social-login button').forEach(button => {
            button.addEventListener('click', function(e) {
                e.preventDefault();
                const provider = this.querySelector('i').className.includes('google') ? 'Google' :
                                this.querySelector('i').className.includes('facebook') ? 'Facebook' :
                                'Apple';
                console.log(`Login with ${provider} initiated`);
                // Add actual OAuth implementation here
            });
        });

        // Auto-hide messages after 5 seconds
        setInterval(() => {
            if (errorMessage.classList.contains('show')) {
                setTimeout(() => {
                    errorMessage.classList.remove('show');
                }, 5000);
            }
        }, 0);
    </script>

</body>
</html>