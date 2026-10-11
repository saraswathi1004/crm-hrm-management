
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>CRM Reports</title>

<style>
* {
    box-sizing: border-box;
}

body {
    margin: 0;
    font-family: Arial, sans-serif;
    background: #f1f5f9;
    color: #1e293b;
}

header {
    background: #0f766e;
    color: white;
    padding: 22px 30px;
}

header h1 {
    margin: 0;
    font-size: 25px;
}

main {
    max-width: 1100px;
    margin: 35px auto;
    padding: 0 20px;
}

.cards {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(220px, 1fr));
    gap: 20px;
}

.card {
    background: white;
    padding: 28px;
    border-radius: 12px;
    box-shadow: 0 4px 15px rgba(0,0,0,0.06);
    border-top: 4px solid #0f766e;
}

.card h3 {
    color: #64748b;
    font-size: 17px;
    margin-top: 0;
}

.count {
    font-size: 36px;
    font-weight: bold;
    color: #0f766e;
    margin-bottom: 0;
}

.back {
    display: inline-block;
    margin-top: 28px;
    padding: 11px 17px;
    background: #0f766e;
    color: white;
    text-decoration: none;
    border-radius: 6px;
}

.back:hover {
    background: #115e59;
}
</style>
</head>

<body>

<header>
    <h1>CRM Reports</h1>
</header>

<main>
    <h2>Overview Report</h2>
    <p>Summary of records currently available in your CRM system.</p>

    <div class="cards">

        <div class="card">
            <h3>Total Customers</h3>
            <p class="count">${customerCount}</p>
        </div>

        <div class="card">
            <h3>Total Leads</h3>
            <p class="count">${leadCount}</p>
        </div>

        <div class="card">
            <h3>Total Follow-ups</h3>
            <p class="count">${followUpCount}</p>
        </div>

    </div>

    <a class="back"
       href="${pageContext.request.contextPath}/crm-dashboard">
       Back to CRM Dashboard
    </a>
</main>

</body>
</html>
