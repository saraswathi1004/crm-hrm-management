
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sign Up | CRM HRM</title>

    <style>
        * {
            box-sizing: border-box;
        }

        body {
            margin: 0;
            font-family: Arial, sans-serif;
            background: #f1f5f9;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            padding: 20px;
        }

        .signup-card {
            background: white;
            width: 100%;
            max-width: 440px;
            padding: 32px;
            border-radius: 14px;
            box-shadow: 0 8px 30px rgba(0, 0, 0, 0.08);
        }

        h1 {
            margin: 0 0 8px;
            color: #172554;
            text-align: center;
        }

        .subtitle {
            text-align: center;
            color: #64748b;
            margin-bottom: 25px;
        }

        .message {
            padding: 12px;
            border-radius: 7px;
            text-align: center;
            margin-bottom: 16px;
            overflow-wrap: anywhere;
        }

        .success-message {
            color: #166534;
            background: #dcfce7;
        }

        .error-message {
            color: #991b1b;
            background: #fee2e2;
        }

        label {
            display: block;
            margin: 14px 0 6px;
            font-weight: bold;
            color: #334155;
        }

        input,
        select {
            width: 100%;
            padding: 12px;
            border: 1px solid #cbd5e1;
            border-radius: 7px;
            font-size: 15px;
            background: white;
        }

        input:focus,
        select:focus {
            outline: 2px solid #93c5fd;
            border-color: #2563eb;
        }

        button {
            width: 100%;
            padding: 13px;
            margin-top: 22px;
            border: none;
            border-radius: 7px;
            background: #2563eb;
            color: white;
            font-size: 16px;
            font-weight: bold;
            cursor: pointer;
        }

        button:hover {
            background: #1d4ed8;
        }

        .login-link {
            text-align: center;
            margin-top: 20px;
            color: #64748b;
        }

        .login-link a {
            color: #2563eb;
            text-decoration: none;
            font-weight: bold;
        }

        .login-link a:hover {
            text-decoration: underline;
        }

        @media (max-width: 480px) {
            .signup-card {
                padding: 24px 20px;
            }
        }
    </style>
</head>

<body>

    <div class="signup-card">

        <h1>Create Account</h1>
        <p class="subtitle">CRM &amp; HRM Management System</p>

        <% if (request.getAttribute("successMessage") != null) { %>
            <div class="message success-message">
                <%= request.getAttribute("successMessage") %>
            </div>
        <% } %>

        <% if (request.getAttribute("errorMessage") != null) { %>
            <div class="message error-message">
                <%= request.getAttribute("errorMessage") %>
            </div>
        <% } %>

        <form action="${pageContext.request.contextPath}/signup"
              method="post">

            <label for="fullName">Full Name</label>
            <input
                type="text"
                id="fullName"
                name="fullName"
                placeholder="Enter your full name"
                maxlength="100"
                required>

            <label for="email">Email Address</label>
            <input
                type="email"
                id="email"
                name="email"
                placeholder="Enter your email"
                maxlength="150"
                required>

            <label for="username">Username</label>
            <input
                type="text"
                id="username"
                name="username"
                placeholder="Choose a username"
                maxlength="50"
                required>

            <label for="password">Password</label>
            <input
                type="password"
                id="password"
                name="password"
                placeholder="Create a password"
                minlength="8"
                required>

            <label for="role">Department / Role</label>
            <select id="role" name="role" required>
                <option value="">Select your role</option>
                <option value="CRM">CRM User</option>
                <option value="HRM">HRM User</option>
            </select>

            <button type="submit">Create Account</button>

        </form>

        <p class="login-link">
            Already have an account?
            <a href="${pageContext.request.contextPath}/login">Login</a>
        </p>

    </div>

</body>
</html>
