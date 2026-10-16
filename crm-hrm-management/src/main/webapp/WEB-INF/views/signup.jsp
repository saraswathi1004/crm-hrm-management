
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Create Account | PeopleFlow</title>

    <style>
        * {
            box-sizing: border-box;
        }

        body {
            margin: 0;
            min-height: 100vh;
            font-family: "Segoe UI", Arial, sans-serif;
            color: #292545;
            background: #f7f6fc;
        }

        .su-navbar {
            height: 70px;
            padding: 0 6%;
            display: flex;
            align-items: center;
            justify-content: space-between;
            background: #fff;
            border-bottom: 1px solid #ece8f5;
        }

        .su-brand {
            display: flex;
            align-items: center;
            gap: 11px;
            color: #6741d9;
            font-size: 22px;
            font-weight: 750;
            text-decoration: none;
        }

        .su-brand-icon {
            width: 40px;
            height: 40px;
            display: flex;
            align-items: center;
            justify-content: center;
            border-radius: 12px;
            color: #fff;
            background: linear-gradient(135deg, #8962f2, #6036c9);
        }

        .su-nav-link {
            color: #6741d9;
            font-size: 14px;
            font-weight: 600;
            text-decoration: none;
        }

        .su-main {
            min-height: calc(100vh - 70px);
            padding: 35px 18px;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .su-card {
            width: 100%;
            max-width: 960px;
            min-width: 0;
            display: grid;
            grid-template-columns: minmax(0, .9fr) minmax(0, 1.1fr);
            overflow: hidden;
            background: #fff;
            border: 1px solid #e9e4f4;
            border-radius: 22px;
            box-shadow: 0 15px 45px rgba(54, 35, 105, .08);
        }

        /* Welcome panel */

        .su-welcome {
            min-width: 0;
            padding: 42px 35px;
            display: flex;
            align-items: center;
            color: #fff;
            background: linear-gradient(145deg, #7954e5, #5030b8);
        }

        .su-badge {
            display: inline-block;
            margin-bottom: 24px;
            padding: 8px 12px;
            border: 1px solid rgba(255,255,255,.3);
            border-radius: 25px;
            background: rgba(255,255,255,.12);
            font-size: 10px;
            font-weight: 700;
            letter-spacing: 1px;
        }

        .su-welcome h1 {
            margin: 0 0 16px;
            color: #fff;
            font-size: 32px;
            line-height: 1.35;
        }

        .su-welcome p {
            margin: 0;
            color: #eee8ff;
            font-size: 14px;
            line-height: 1.9;
        }

        .su-benefits {
            display: grid;
            gap: 17px;
            margin-top: 28px;
        }

        .su-benefit {
            display: flex;
            align-items: center;
            gap: 12px;
            color: #fff;
            font-size: 13px;
            line-height: 1.5;
        }

        .su-benefit-icon {
            width: 36px;
            height: 36px;
            flex-shrink: 0;
            display: flex;
            align-items: center;
            justify-content: center;
            border-radius: 10px;
            background: rgba(255,255,255,.15);
        }

        /* Signup form */

        .su-form-panel {
            min-width: 0;
            padding: 35px 40px;
            background: #fff;
        }

        .su-logo {
            width: 48px;
            height: 48px;
            margin-bottom: 16px;
            display: flex;
            align-items: center;
            justify-content: center;
            border-radius: 14px;
            color: #6741d9;
            background: #eee8ff;
            font-size: 24px;
        }

        .su-form-panel h2 {
            margin: 0 0 9px;
            color: #292545;
            font-size: 28px;
        }

        .su-subtitle {
            margin: 0 0 22px;
            color: #858097;
            font-size: 13px;
            line-height: 1.8;
        }

        .su-message {
            margin-bottom: 16px;
            padding: 11px 13px;
            border-radius: 9px;
            font-size: 13px;
            line-height: 1.6;
            overflow-wrap: anywhere;
        }

        .su-success {
            color: #166534;
            background: #dcfce7;
            border: 1px solid #bbf7d0;
        }

        .su-error {
            color: #991b1b;
            background: #fee2e2;
            border: 1px solid #fecaca;
        }

        .su-field {
            min-width: 0;
            margin-bottom: 15px;
        }

        .su-field label {
            display: block;
            margin-bottom: 7px;
            color: #39334f;
            font-size: 13px;
            font-weight: 650;
        }

        .su-field input,
        .su-field select {
            display: block;
            width: 100%;
            max-width: 100%;
            height: 45px;
            margin: 0;
            padding: 0 13px;
            border: 1px solid #ded8eb;
            border-radius: 10px;
            outline: none;
            background: #fff;
            color: #292545;
            font-family: "Segoe UI", Arial, sans-serif;
            font-size: 14px;
            line-height: normal;
            box-shadow: none;
        }

        .su-field input::placeholder {
            color: #aaa4b9;
            opacity: 1;
        }

        .su-field input:focus,
        .su-field select:focus {
            border-color: #9860f5;
            outline: none;
            box-shadow: 0 0 0 3px rgba(152,96,245,.12);
        }

        .su-submit {
            display: block;
            width: 100%;
            min-height: 48px;
            margin-top: 7px;
            padding: 12px 15px;
            border: none;
            border-radius: 10px;
            background: linear-gradient(100deg, #a64df0, #8545e8);
            color: #fff;
            font-family: "Segoe UI", Arial, sans-serif;
            font-size: 14px;
            font-weight: 700;
            cursor: pointer;
            transition: background .2s, transform .2s;
        }

        .su-submit:hover {
            background: linear-gradient(100deg, #9138dd, #6933ca);
            transform: translateY(-1px);
        }

        .su-login-text {
            margin: 20px 0 0;
            color: #858097;
            text-align: center;
            font-size: 13px;
            line-height: 1.8;
        }

        .su-login-text a {
            color: #6741d9;
            font-weight: 700;
            text-decoration: none;
        }

        .su-login-text a:hover,
        .su-nav-link:hover {
            text-decoration: underline;
        }

        .su-footer {
            margin-top: 20px;
            padding-top: 15px;
            border-top: 1px solid #f0edf6;
            color: #9690a7;
            text-align: center;
            font-size: 11px;
        }

        @media (max-width: 720px) {
            .su-navbar {
                height: 64px;
                padding: 0 18px;
            }

            .su-brand {
                font-size: 19px;
            }

            .su-main {
                min-height: calc(100vh - 64px);
                padding: 22px 14px;
            }

            .su-card {
                max-width: 470px;
                grid-template-columns: minmax(0, 1fr);
            }

            .su-welcome {
                display: none;
            }

            .su-form-panel {
                padding: 30px 26px;
            }
        }

        @media (max-width: 380px) {
            .su-nav-link {
                font-size: 12px;
            }

            .su-form-panel {
                padding: 25px 19px;
            }
        }
    </style>
</head>

<body>

    <nav class="su-navbar">
        <a href="${pageContext.request.contextPath}/" class="su-brand">
            <span class="su-brand-icon">P</span>
            PeopleFlow
        </a>

        <a href="${pageContext.request.contextPath}/login" class="su-nav-link">
            Already registered? Login
        </a>
    </nav>

    <main class="su-main">
        <div class="su-card">

            <section class="su-welcome">
                <div>
                    <span class="su-badge">WELCOME TO PEOPLEFLOW</span>

                    <h1>Build better connections with one simple platform.</h1>

                    <p>
                        Create your account to access your workspace and
                        manage your daily operations more efficiently.
                    </p>

                    <div class="su-benefits">
                        <div class="su-benefit">
                            <span class="su-benefit-icon">👥</span>
                            <span>Organize employee information</span>
                        </div>

                        <div class="su-benefit">
                            <span class="su-benefit-icon">📊</span>
                            <span>Manage business activities</span>
                        </div>

                        <div class="su-benefit">
                            <span class="su-benefit-icon">🔐</span>
                            <span>Access your assigned workspace</span>
                        </div>
                    </div>
                </div>
            </section>

            <section class="su-form-panel">
                <div class="su-logo">✦</div>

                <h2>Create account</h2>

                <p class="su-subtitle">
                    Fill in your details to get started.
                </p>

                <% if (request.getAttribute("successMessage") != null) { %>
                    <div class="su-message su-success">
                        <%= request.getAttribute("successMessage") %>
                    </div>
                <% } %>

                <% if (request.getAttribute("errorMessage") != null) { %>
                    <div class="su-message su-error">
                        <%= request.getAttribute("errorMessage") %>
                    </div>
                <% } %>

                <form action="${pageContext.request.contextPath}/signup"
                      method="post">

                    <div class="su-field">
                        <label for="fullName">Full Name</label>
                        <input type="text"
                               id="fullName"
                               name="fullName"
                               placeholder="Enter your full name"
                               maxlength="100"
                               autocomplete="name"
                               required>
                    </div>

                    <div class="su-field">
                        <label for="email">Email Address</label>
                        <input type="email"
                               id="email"
                               name="email"
                               placeholder="Enter your email"
                               maxlength="150"
                               autocomplete="email"
                               required>
                    </div>

                    <div class="su-field">
                        <label for="username">Username</label>
                        <input type="text"
                               id="username"
                               name="username"
                               placeholder="Choose a username"
                               maxlength="50"
                               autocomplete="username"
                               required>
                    </div>

                    <div class="su-field">
                        <label for="password">Password</label>
                        <input type="password"
                               id="password"
                               name="password"
                               placeholder="Create a password"
                               minlength="8"
                               autocomplete="new-password"
                               required>
                    </div>

                    <div class="su-field">
                        <label for="role">Department / Role</label>
                        <select id="role" name="role" required>
                            <option value="">Select your role</option>
                            <option value="CRM">CRM User</option>
                            <option value="HRM">HRM User</option>
                        </select>
                    </div>

                    <button type="submit" class="su-submit">
                        Create Account &rarr;
                    </button>
                </form>

                <p class="su-login-text">
                    Already have an account?
                    <a href="${pageContext.request.contextPath}/login">
                        Sign in
                    </a>
                </p>

                <div class="su-footer">
                    CRM &amp; HRM Management System
                </div>
            </section>

        </div>
    </main>

</body>
</html>
