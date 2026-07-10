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
        /* === DESIGN TOKENS === */
        :root {
            --primary: #0f4c75;
            --primary-light: #247ba0;
            --primary-dark: #0a3550;
            --accent: #ff6b6b;
            --gold: #ffc300;
            --success: #06d6a0;
            --error: #ff6b6b;
            --warning: #ffc300;
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
        .signup-container {
            background: white;
            border-radius: 20px;
            box-shadow: var(--shadow-lg);
            overflow: hidden;
            max-width: 800px;
            width: 100%;
            margin-top: 80px;
            animation: slideIn 0.6s ease;
            display: grid;
            grid-template-columns: 1fr 1fr;
        }

        /* === LEFT SECTION === */
        .signup-hero {
            background: linear-gradient(135deg, var(--primary) 0%, var(--primary-light) 100%);
            color: white;
            padding: 50px 40px;
            display: flex;
            flex-direction: column;
            justify-content: center;
        }

        .signup-hero h1 {
            font-family: 'Poppins', sans-serif;
            font-size: 2.5rem;
            font-weight: 800;
            margin-bottom: 20px;
            line-height: 1.2;
        }

        .signup-hero p {
            font-size: 1rem;
            opacity: 0.9;
            line-height: 1.6;
            margin-bottom: 30px;
        }

        .signup-benefits {
            display: flex;
            flex-direction: column;
            gap: 18px;
        }

        .benefit {
            display: flex;
            align-items: flex-start;
            gap: 12px;
        }

        .benefit i {
            font-size: 20px;
            margin-top: 2px;
            color: var(--gold);
            flex-shrink: 0;
        }

        .benefit-text {
            font-size: 14px;
            opacity: 0.9;
            line-height: 1.5;
        }

        /* === RIGHT SECTION === */
        .signup-form-wrapper {
            padding: 50px 40px;
            overflow-y: auto;
            max-height: 700px;
        }

        .form-header {
            margin-bottom: 35px;
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
            margin-bottom: 20px;
        }

        .form-row {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 20px;
        }

        .form-label {
            display: block;
            margin-bottom: 8px;
            color: var(--text-dark);
            font-weight: 600;
            font-size: 14px;
        }

        .form-input,
        .form-select {
            width: 100%;
            padding: 12px 16px;
            border: 2px solid var(--border-light);
            border-radius: 10px;
            font-size: 14px;
            font-family: 'Inter', sans-serif;
            transition: all 0.3s ease;
            background: white;
        }

        .form-input:focus,
        .form-select:focus {
            outline: none;
            border-color: var(--primary);
            background: #f0f7ff;
            box-shadow: 0 0 0 3px rgba(15, 76, 117, 0.1);
        }

        .form-input::placeholder {
            color: var(--text-gray);
        }

        .password-strength {
            height: 4px;
            background: var(--border-light);
            border-radius: 2px;
            margin-top: 8px;
            overflow: hidden;
        }

        .password-strength-bar {
            height: 100%;
            width: 0;
            background: var(--error);
            transition: all 0.3s ease;
            border-radius: 2px;
        }

        .password-strength-text {
            font-size: 12px;
            margin-top: 4px;
            color: var(--error);
            font-weight: 600;
        }

        .password-strength-text.weak {
            color: var(--error);
        }

        .password-strength-text.fair {
            color: var(--warning);
        }

        .password-strength-text.good {
            color: #ffc300;
        }

        .password-strength-text.strong {
            color: var(--success);
        }

        .form-checkbox {
            display: flex;
            align-items: flex-start;
            gap: 10px;
            margin-bottom: 20px;
            padding: 12px;
            background: var(--bg-light);
            border-radius: 10px;
        }

        .checkbox-input {
            width: 18px;
            height: 18px;
            cursor: pointer;
            accent-color: var(--primary);
            margin-top: 2px;
            flex-shrink: 0;
        }

        .checkbox-label {
            font-size: 13px;
            color: var(--text-gray);
            cursor: pointer;
            line-height: 1.5;
        }

        .checkbox-label a {
            color: var(--primary);
            font-weight: 600;
            transition: color 0.3s ease;
        }

        .checkbox-label a:hover {
            color: var(--accent);
        }

        .btn-signup {
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
            margin-bottom: 12px;
        }

        .btn-signup:hover {
            transform: translateY(-3px);
            box-shadow: var(--shadow-md);
        }

        .btn-signup:active {
            transform: translateY(-1px);
        }

        .btn-signup:disabled {
            opacity: 0.6;
            cursor: not-allowed;
            transform: none;
        }

        /* === DIVIDER === */
        .form-divider {
            display: flex;
            align-items: center;
            gap: 12px;
            margin: 25px 0;
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
            font-size: 12px;
            font-weight: 500;
        }

        /* === SOCIAL LOGIN === */
        .social-signup {
            display: flex;
            gap: 12px;
            margin-bottom: 20px;
        }

        .social-btn {
            flex: 1;
            padding: 12px;
            border: 2px solid var(--border-light);
            background: white;
            border-radius: 10px;
            font-size: 18px;
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
            margin-top: 20px;
            padding-top: 20px;
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
            margin-bottom: 20px;
            font-size: 14px;
            border-left: 4px solid var(--error);
        }

        .error-message.show {
            display: block;
            animation: shake 0.4s ease;
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
            .signup-hero {
                padding: 40px 30px;
            }

            .signup-form-wrapper {
                padding: 40px 30px;
            }
        }

        @media (max-width: 768px) {
            .signup-container {
                grid-template-columns: 1fr;
                margin-top: 70px;
            }

            .signup-hero {
                display: none;
            }

            .signup-form-wrapper {
                padding: 35px 25px;
                max-height: none;
            }

            .form-header h2 {
                font-size: 24px;
            }

            .form-row {
                grid-template-columns: 1fr;
            }
        }

        @media (max-width: 480px) {
            .navbar {
                padding: 12px 4%;
            }

            .nav-text {
                display: none;
            }

            .signup-form-wrapper {
                padding: 30px 20px;
            }

            .form-header h2 {
                font-size: 20px;
            }

            .btn-signup {
                padding: 12px;
            }

            .form-checkbox {
                padding: 10px;
            }

            .social-btn {
                font-size: 16px;
            }
        }
    </style>
</head>
<body>

    <!-- NAVBAR -->
    <nav class="navbar">
        <a href="index.jsp" class="logo">BGS <span>TOURS</span></a>
        <div class="nav-right">
            <span class="nav-text">Already have an account? <strong><a href="login.jsp">Log In</a></strong></span>
            <a href="index.jsp" class="btn-home">← Back to Home</a>
        </div>
    </nav>

    <!-- SIGNUP CONTAINER -->
    <div class="signup-container">
        <!-- LEFT SECTION -->
        <div class="signup-hero">
            <h1>Join Our Travel Community</h1>
            <p>Create your account and unlock exclusive travel deals, personalized recommendations, and seamless booking experiences.</p>
            
            <div class="signup-benefits">
                <div class="benefit">
                    <i class="fas fa-check"></i>
                    <div class="benefit-text">Exclusive discounts on premium tour packages</div>
                </div>
                <div class="benefit">
                    <i class="fas fa-check"></i>
                    <div class="benefit-text">24/7 customer support and travel assistance</div>
                </div>
                <div class="benefit">
                    <i class="fas fa-check"></i>
                    <div class="benefit-text">Personalized recommendations based on preferences</div>
                </div>
                <div class="benefit">
                    <i class="fas fa-check"></i>
                    <div class="benefit-text">Loyalty rewards and travel points program</div>
                </div>
                <div class="benefit">
                    <i class="fas fa-check"></i>
                    <div class="benefit-text">Easy booking and cancellation management</div>
                </div>
            </div>
        </div>

        <!-- RIGHT SECTION - SIGNUP FORM -->
        <div class="signup-form-wrapper">
            <div class="form-header">
                <h2>Create Account</h2>
                <p>Join thousands of travelers exploring the world with BGS Tours</p>
            </div>

            <form id="signupForm">
                <!-- Error Message -->
                <div class="error-message" id="errorMessage"></div>

                <!-- Name Row -->
                <div class="form-row">
                    <div class="form-group">
                        <label class="form-label" for="firstName">First Name</label>
                        <input 
                            type="text" 
                            id="firstName" 
                            name="firstName" 
                            class="form-input" 
                            placeholder="John" 
                            required
                        >
                    </div>
                    <div class="form-group">
                        <label class="form-label" for="lastName">Last Name</label>
                        <input 
                            type="text" 
                            id="lastName" 
                            name="lastName" 
                            class="form-input" 
                            placeholder="Doe" 
                            required
                        >
                    </div>
                </div>

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

                <!-- Phone Row -->
                <div class="form-row">
                    <div class="form-group">
                        <label class="form-label" for="phone">Phone Number</label>
                        <input 
                            type="tel" 
                            id="phone" 
                            name="phone" 
                            class="form-input" 
                            placeholder="+91 98765 43210" 
                            required
                        >
                    </div>
                    <div class="form-group">
                        <label class="form-label" for="country">Country</label>
                        <select id="country" name="country" class="form-select" required>
                            <option value="">Select Country</option>
                            <option value="India">India</option>
                            <option value="USA">USA</option>
                            <option value="UK">UK</option>
                            <option value="Canada">Canada</option>
                            <option value="Australia">Australia</option>
                            <option value="Other">Other</option>
                        </select>
                    </div>
                </div>

                <!-- Password Input -->
                <div class="form-group">
                    <label class="form-label" for="password">Password</label>
                    <input 
                        type="password" 
                        id="password" 
                        name="password" 
                        class="form-input" 
                        placeholder="At least 8 characters" 
                        required
                    >
                    <div class="password-strength">
                        <div class="password-strength-bar" id="strengthBar"></div>
                    </div>
                    <div class="password-strength-text" id="strengthText">Weak</div>
                </div>

                <!-- Confirm Password Input -->
                <div class="form-group">
                    <label class="form-label" for="confirmPassword">Confirm Password</label>
                    <input 
                        type="password" 
                        id="confirmPassword" 
                        name="confirmPassword" 
                        class="form-input" 
                        placeholder="Re-enter your password" 
                        required
                    >
                </div>

                <!-- Terms & Conditions Checkbox -->
                <div class="form-checkbox">
                    <input 
                        type="checkbox" 
                        id="terms" 
                        name="terms" 
                        class="checkbox-input" 
                        required
                    >
                    <label class="checkbox-label" for="terms">
                        I agree to the <a href="#">Terms & Conditions</a> and <a href="#">Privacy Policy</a>
                    </label>
                </div>

                <!-- Newsletter Checkbox -->
                <div class="form-checkbox">
                    <input 
                        type="checkbox" 
                        id="newsletter" 
                        name="newsletter" 
                        class="checkbox-input"
                    >
                    <label class="checkbox-label" for="newsletter">
                        I want to receive travel tips, exclusive offers, and updates from BGS Tours
                    </label>
                </div>

                <!-- Sign Up Button -->
                <button type="submit" class="btn-signup">Create My Account</button>

                <!-- Divider -->
                <div class="form-divider">
                    <span>Or sign up with</span>
                </div>

                <!-- Social Sign Up -->
                <div class="social-signup">
                    <button type="button" class="social-btn" title="Sign up with Google">
                        <i class="fab fa-google"></i>
                    </button>
                    <button type="button" class="social-btn" title="Sign up with Facebook">
                        <i class="fab fa-facebook-f"></i>
                    </button>
                    <button type="button" class="social-btn" title="Sign up with Apple">
                        <i class="fab fa-apple"></i>
                    </button>
                </div>

                <!-- Footer Message -->
                <div class="form-footer">
                    <p>Already have an account? <a href="login.jsp">Log in here</a></p>
                </div>
            </form>
        </div>
    </div>

    <!-- SCRIPTS -->
    <script>
        // Password Strength Indicator
        const passwordInput = document.getElementById('password');
        const strengthBar = document.getElementById('strengthBar');
        const strengthText = document.getElementById('strengthText');

        passwordInput.addEventListener('input', function() {
            const password = this.value;
            let strength = 0;
            let strengthLabel = 'Weak';
            let strengthColor = '#ff6b6b'; // error

            if (password.length >= 8) strength += 25;
            if (password.match(/[a-z]/)) strength += 25;
            if (password.match(/[A-Z]/)) strength += 25;
            if (password.match(/[0-9]/)) strength += 12.5;
            if (password.match(/[!@#$%^&*]/)) strength += 12.5;

            if (strength < 25) {
                strengthLabel = 'Weak';
                strengthColor = '#ff6b6b';
            } else if (strength < 50) {
                strengthLabel = 'Fair';
                strengthColor = '#ffc300';
            } else if (strength < 75) {
                strengthLabel = 'Good';
                strengthColor = '#ffc300';
            } else {
                strengthLabel = 'Strong';
                strengthColor = '#06d6a0';
            }

            strengthBar.style.width = strength + '%';
            strengthBar.style.background = strengthColor;
            strengthText.textContent = strengthLabel;
            strengthText.className = 'password-strength-text ' + strengthLabel.toLowerCase();
        });

        // Form Submission
        const signupForm = document.getElementById('signupForm');
        const errorMessage = document.getElementById('errorMessage');

        signupForm.addEventListener('submit', function(e) {
            e.preventDefault();

            const firstName = document.getElementById('firstName').value.trim();
            const lastName = document.getElementById('lastName').value.trim();
            const email = document.getElementById('email').value.trim();
            const phone = document.getElementById('phone').value.trim();
            const country = document.getElementById('country').value;
            const password = document.getElementById('password').value.trim();
            const confirmPassword = document.getElementById('confirmPassword').value.trim();
            const termsAccepted = document.getElementById('terms').checked;

            // Clear previous error
            errorMessage.classList.remove('show');

            // Validation
            if (!firstName || !lastName || !email || !phone || !country || !password || !confirmPassword) {
                showError('Please fill in all required fields');
                return;
            }

            if (!isValidEmail(email)) {
                showError('Please enter a valid email address');
                return;
            }

            if (password.length < 8) {
                showError('Password must be at least 8 characters long');
                return;
            }

            if (password !== confirmPassword) {
                showError('Passwords do not match');
                return;
            }

            if (!termsAccepted) {
                showError('Please accept the Terms & Conditions');
                return;
            }

            // All validations passed
            showSuccess();
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
            window.scrollTo({ top: 0, behavior: 'smooth' });
        }

        // Show success message
        function showSuccess() {
            errorMessage.textContent = '✓ Account created successfully! Redirecting to login...';
            errorMessage.style.background = '#e6f7f0';
            errorMessage.style.color = '#06d6a0';
            errorMessage.style.borderLeftColor = '#06d6a0';
            errorMessage.classList.add('show');

            // Simulate account creation
            setTimeout(() => {
                window.location.href = 'login.jsp';
            }, 2500);
        }

        // Social Sign Up Handlers
        document.querySelectorAll('.social-signup button').forEach(button => {
            button.addEventListener('click', function(e) {
                e.preventDefault();
                const provider = this.querySelector('i').className.includes('google') ? 'Google' :
                                this.querySelector('i').className.includes('facebook') ? 'Facebook' :
                                'Apple';
                console.log(`Sign up with ${provider} initiated`);
                // Add actual OAuth implementation here
            });
        });
    </script>

</body>
</html>