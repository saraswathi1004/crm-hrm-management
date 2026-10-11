
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>HRM Dashboard</title>

    <style>
        * { box-sizing: border-box; }

        body {
            margin: 0;
            font-family: Arial, sans-serif;
            background: #f1f5f9;
            color: #1e293b;
        }

        header {
            background: #1d4ed8;
            color: white;
            padding: 20px 30px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            flex-wrap: wrap;
            gap: 12px;
        }

        header h1 {
            margin: 0;
            font-size: 24px;
        }

        .logout {
            background: white;
            color: #1d4ed8;
            padding: 10px 16px;
            border-radius: 6px;
            text-decoration: none;
            font-weight: bold;
        }

        main {
            max-width: 1100px;
            margin: 35px auto;
            padding: 0 20px;
        }

        .welcome {
            margin-bottom: 25px;
        }

        .cards {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(220px, 1fr));
            gap: 20px;
        }

        .card {
            background: white;
            padding: 25px;
            border-radius: 12px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.06);
        }

        .card h2 {
            color: #1d4ed8;
            font-size: 20px;
        }

        .card p {
            color: #64748b;
            line-height: 1.6;
        }
    </style>
</head>

<body>

<header>
    <h1>HRM Dashboard</h1>
    <a class="logout"
       href="${pageContext.request.contextPath}/login">Logout</a>
</header>

<main>
    <div class="welcome">
        <h2>Welcome to HR Management</h2>
        <p>Manage employee-related activities from one place.</p>
    </div>

    <a href="${pageContext.request.contextPath}/employees"
   style="text-decoration: none; color: inherit;">

    <div class="card" style="cursor: pointer;">
        <h2>Employees</h2>
        <p>View and manage employee information.</p>
    </div>

</a>
<a href="${pageContext.request.contextPath}/attendance"
   style="text-decoration: none; color: inherit;">

    <div class="card" style="cursor: pointer;">
        <h2>Attendance</h2>
        <p>Manage employee attendance records.</p>
    </div>

</a>


<a href="${pageContext.request.contextPath}/leaves"
   style="text-decoration: none; color: inherit;">
    <div class="card" style="cursor: pointer;">
        <h2>Leave Management</h2>
        <p>Review and manage employee leave requests.</p>
    </div>
</a>

        
<a href="${pageContext.request.contextPath}/payroll"
   style="text-decoration: none; color: inherit;">
    <div class="card" style="cursor: pointer;">
        <h2>Payroll</h2>
        <p>Manage salary and payroll information.</p>
    </div>
</a>
        
</main>

</body>
</html>
