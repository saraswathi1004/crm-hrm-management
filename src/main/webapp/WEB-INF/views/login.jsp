
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login | CRM HRM</title>

    <style>
        * { box-sizing: border-box; }

        body {
            margin: 0;
            font-family: Arial, sans-serif;
            background: #f1f5f9;
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 20px;
        }

        .login-card {
            background: white;
            width: 100%;
            max-width: 420px;
            padding: 32px;
            border-radius: 14px;
            box-shadow: 0 8px 30px rgba(0,0,0,0.08);
        }

        h1 {
            text-align: center;
            color: #172554;
            margin-bottom: 8px;
        }

        .subtitle {
            text-align: center;
            color: #64748b;
            margin-bottom: 25px;
        }

        label {
            display: block;
            margin: 14px 0 6px;
            font-weight: bold;
            color: #334155;
        }

        input {
            width: 100%;
            padding: 12px;
            border: 1px solid #cbd5e1;
            border-radius: 7px;
            font-size: 15px;
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

        button:hover { background: #1d4ed8; }

        .message {
            color: #b91c1c;
            background: #fee2e2;
            padding: 10px;
            border-radius: 7px;
            text-align: center;
        }

        .signup-link {
            text-align: center;
            margin-top: 20px;
            color: #64748b;
        }

        a {
            color: #2563eb;
            text-decoration: none;
        }
    </style>
</head>

<body>
    <div class="login-card">
        <h1>Welcome Back</h1>
        <p class="subtitle">CRM &amp; HRM Management System</p>

        <% if (request.getAttribute("errorMessage") != null) { %>
            <p class="message">
                <%= request.getAttribute("errorMessage") %>
            </p>
        <% } %>

        <form action="${pageContext.request.contextPath}/login"
              method="post">

            <label for="username">Username</label>
            <input type="text"
                   id="username"
                   name="username"
                   placeholder="Enter your username"
                   required>

            <label for="password">Password</label>
            <input type="password"
                   id="password"
                   name="password"
                   placeholder="Enter your password"
                   required>

            <button type="submit">Login</button>
        </form>

        <p class="signup-link">
            Don't have an account?
            <a href="${pageContext.request.contextPath}/signup">
                Create Account
            </a>
        </p>
    </div>
</body>
</html>
