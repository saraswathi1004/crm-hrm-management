
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login | PeopleFlow</title>

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

        .pf-navbar {
            height: 72px;
            padding: 0 6%;
            display: flex;
            align-items: center;
            justify-content: space-between;
            background: #fff;
            border-bottom: 1px solid #ece8f5;
        }

        .pf-brand {
            display: flex;
            align-items: center;
            gap: 11px;
            color: #6741d9;
            font-size: 22px;
            font-weight: 750;
            text-decoration: none;
        }

        .pf-brand-icon {
            width: 40px;
            height: 40px;
            display: flex;
            align-items: center;
            justify-content: center;
            border-radius: 12px;
            color: #fff;
            background: linear-gradient(135deg, #8962f2, #6036c9);
        }

        .pf-home-link {
            color: #6741d9;
            font-size: 14px;
            font-weight: 600;
            text-decoration: none;
        }

        .pf-main {
            width: 100%;
            min-height: calc(100vh - 72px);
            padding: 35px 20px;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .pf-login-card {
            width: 100%;
            max-width: 960px;
            min-width: 0;
            display: grid;
            grid-template-columns: minmax(0, 0.9fr) minmax(0, 1.1fr);
            overflow: hidden;
            background: #fff;
            border: 1px solid #e9e4f4;
            border-radius: 22px;
            box-shadow: 0 15px 45px rgba(54, 35, 105, 0.08);
        }

        /* Left welcome panel */

        .pf-welcome {
            min-width: 0;
            padding: 45px 35px;
            display: flex;
            align-items: center;
            color: #fff;
            background: linear-gradient(145deg, #7954e5, #5030b8);
        }

        .pf-welcome-badge {
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

        .pf-welcome h1 {
            margin: 0 0 17px;
            color: #fff;
            font-size: 32px;
            line-height: 1.35;
        }

        .pf-welcome p {
            margin: 0;
            color: #eee8ff;
            font-size: 14px;
            line-height: 1.9;
        }

        .pf-feature-list {
            display: grid;
            gap: 17px;
            margin-top: 30px;
        }

        .pf-feature {
            display: flex;
            align-items: center;
            gap: 12px;
            color: #fff;
            font-size: 13px;
            line-height: 1.5;
        }

        .pf-feature-icon {
            width: 36px;
            height: 36px;
            flex-shrink: 0;
            display: flex;
            align-items: center;
            justify-content: center;
            border-radius: 10px;
            background: rgba(255,255,255,.15);
        }

        /* Login form */

        .pf-form-panel {
            min-width: 0;
            padding: 45px 40px;
            background: #fff;
        }

        .pf-form-logo {
            width: 50px;
            height: 50px;
            margin-bottom: 22px;
            display: flex;
            align-items: center;
            justify-content: center;
            border-radius: 14px;
            background: #eee8ff;
            color: #6741d9;
            font-size: 25px;
        }

        .pf-form-panel h2 {
            margin: 0 0 10px;
            color: #292545;
            font-size: 29px;
        }

        .pf-subtitle {
            margin: 0 0 28px;
            color: #858097;
            font-size: 13px;
            line-height: 1.8;
        }

        .pf-error-message {
            margin: 0 0 18px;
            padding: 12px 14px;
            border: 1px solid #fecaca;
            border-radius: 9px;
            color: #b91c1c;
            background: #fef2f2;
            font-size: 13px;
            line-height: 1.6;
            overflow-wrap: anywhere;
        }

        .pf-field {
            min-width: 0;
            margin-bottom: 21px;
        }

        .pf-field label {
            display: block;
            margin-bottom: 9px;
            color: #39334f;
            font-size: 13px;
            font-weight: 650;
        }

        /* Clean input fields without icons */

        .pf-field input {
            display: block;
            width: 100%;
            max-width: 100%;
            height: 49px;
            margin: 0;
            padding: 0 14px;
            border: 1px solid #ded8eb;
            border-radius: 10px;
            outline: none;
            background: #fff;
            color: #292545;
            font-family: "Segoe UI", Arial, sans-serif;
            font-size: 14px;
            line-height: normal;
            box-shadow: none;
            appearance: none;
            -webkit-appearance: none;
        }

        .pf-field input::placeholder {
            color: #aaa4b9;
            opacity: 1;
        }

        .pf-field input:focus {
            border-color: #9860f5;
            outline: none;
            box-shadow: 0 0 0 3px rgba(152,96,245,.13);
        }

        .pf-submit-button {
            display: block;
            width: 100%;
            min-height: 49px;
            margin: 6px 0 0;
            padding: 12px 16px;
            border: none;
            border-radius: 10px;
            color: #fff;
            background: linear-gradient(100deg, #a64df0, #8545e8);
            font-family: "Segoe UI", Arial, sans-serif;
            font-size: 14px;
            font-weight: 700;
            cursor: pointer;
            transition: background .2s, transform .2s;
        }

        .pf-submit-button:hover {
            background: linear-gradient(100deg, #9138dd, #6933ca);
            transform: translateY(-1px);
        }

        .pf-signup-text {
            margin: 24px 0 0;
            color: #858097;
            text-align: center;
            font-size: 13px;
            line-height: 1.8;
        }

        .pf-signup-text a {
            color: #6741d9;
            font-weight: 700;
            text-decoration: none;
        }

        .pf-signup-text a:hover,
        .pf-home-link:hover {
            text-decoration: underline;
        }

        .pf-footer {
            margin-top: 25px;
            padding-top: 17px;
            border-top: 1px solid #f0edf6;
            color: #9690a7;
            text-align: center;
            font-size: 11px;
        }

        /* Responsive layout */

        @media (max-width: 720px) {
            .pf-navbar {
                height: 64px;
                padding: 0 18px;
            }

            .pf-brand {
                font-size: 19px;
            }

            .pf-main {
                min-height: calc(100vh - 64px);
                padding: 24px 15px;
            }

            .pf-login-card {
                max-width: 460px;
                grid-template-columns: minmax(0, 1fr);
            }

            .pf-welcome {
                display: none;
            }

            .pf-form-panel {
                padding: 35px 27px;
            }
        }

        @media (max-width: 380px) {
            .pf-home-link {
                font-size: 12px;
            }

            .pf-form-panel {
                padding: 28px 20px;
            }
        }
    </style>
</head>

<body>

    <nav class="pf-navbar">
        <a href="${pageContext.request.contextPath}/" class="pf-brand">
            <span class="pf-brand-icon">P</span>
            PeopleFlow
        </a>

        <a href="${pageContext.request.contextPath}/" class="pf-home-link">
            &larr; Back to Home
        </a>
    </nav>

    <main class="pf-main">
        <div class="pf-login-card">

            <section class="pf-welcome">
                <div>
                    <span class="pf-welcome-badge">
                        CRM &amp; HRM MANAGEMENT
                    </span>

                    <h1>Welcome back to your workspace.</h1>

                    <p>
                        One platform to manage your people, organize
                        operations and build stronger customer relationships.
                    </p>

                    <div class="pf-feature-list">
                        <div class="pf-feature">
                            <span class="pf-feature-icon">👥</span>
                            <span>Employee &amp; Department Management</span>
                        </div>

                        <div class="pf-feature">
                            <span class="pf-feature-icon">📅</span>
                            <span>Attendance, Leave &amp; Payroll</span>
                        </div>

                        <div class="pf-feature">
                            <span class="pf-feature-icon">🤝</span>
                            <span>Customers, Leads &amp; Follow-ups</span>
                        </div>
                    </div>
                </div>
            </section>

            <section class="pf-form-panel">
                <div class="pf-form-logo">✦</div>

                <h2>Sign in</h2>

                <p class="pf-subtitle">
                    Enter your account details to access your dashboard.
                </p>

                <% if (request.getAttribute("errorMessage") != null) { %>
                    <div class="pf-error-message">
                        <%= request.getAttribute("errorMessage") %>
                    </div>
                <% } %>

                <form action="${pageContext.request.contextPath}/login"
                      method="post">

                    <div class="pf-field">
                        <label for="username">Username</label>
                        <input type="text"
                               id="username"
                               name="username"
                               placeholder="Enter your username"
                               autocomplete="username"
                               required>
                    </div>

                    <div class="pf-field">
                        <label for="password">Password</label>
                        <input type="password"
                               id="password"
                               name="password"
                               placeholder="Enter your password"
                               autocomplete="current-password"
                               required>
                    </div>

                    <button type="submit" class="pf-submit-button">
                        Sign In to Your Account &rarr;
                    </button>
                </form>

                <p class="pf-signup-text">
                    Don't have an account?
                    <a href="${pageContext.request.contextPath}/signup">
                        Create Account
                    </a>
                </p>

                <div class="pf-footer">
                    CRM &amp; HRM Management System
                </div>
            </section>

        </div>
    </main>

</body>
</html>
