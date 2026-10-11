
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>CRM Dashboard</title>

    <style>
        * { box-sizing: border-box; }

        body {
            margin: 0;
            font-family: Arial, sans-serif;
            background: #f1f5f9;
            color: #1e293b;
        }

        header {
            background: #0f766e;
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
            color: #0f766e;
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
            color: #0f766e;
            font-size: 20px;
        }

        .card p {
            color: #64748b;
            line-height: 1.6;
        }

        /* Customers card mattum clickable */
        .customer-link {
            display: block;
            color: inherit;
            text-decoration: none;
            border-radius: 12px;
        }

        .customer-link:hover .card {
            box-shadow: 0 6px 20px rgba(15,118,110,0.18);
            transform: translateY(-2px);
        }

        .customer-link .card {
            transition: 0.2s;
        }
    </style>
</head>

<body>

<header>
    <h1>CRM Dashboard</h1>
    <a class="logout"
       href="${pageContext.request.contextPath}/login">Logout</a>
</header>

<main>
    <div class="welcome">
        <h2>Welcome to CRM</h2>
        <p>Manage customer-related activities from one place.</p>
    </div>

    <div class="cards">

        <!-- Customers Card -->
        <a class="customer-link"
           href="${pageContext.request.contextPath}/customers">
            <div class="card">
                <h2>Customers</h2>
                <p>View and manage customer information.</p>
            </div>
        </a>

        <!-- Leads Card -->
        <a class="customer-link"
           href="${pageContext.request.contextPath}/leads">
            <div class="card">
                <h2>Leads</h2>
                <p>Track potential customers and leads.</p>
            </div>
        </a>

        <!-- Follow-ups Card -->
        
<!-- Follow-ups Card -->
<a class="customer-link"
   href="${pageContext.request.contextPath}/follow-ups">
    <div class="card">
        <h2>Follow-ups</h2>
        <p>Organize customer follow-up activities.</p>
    </div>
</a>
        

        
<!-- Reports Card -->
<a class="customer-link"
   href="${pageContext.request.contextPath}/reports">
    <div class="card">
        <h2>Reports</h2>
        <p>Review customer and sales reports.</p>
    </div>
</a>
        

    </div>
</main>

</body>
</html>
