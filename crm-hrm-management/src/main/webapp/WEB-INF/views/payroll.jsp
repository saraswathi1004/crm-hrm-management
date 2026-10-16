<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Payroll | PeopleFlow</title>

<style>
* {
    box-sizing: border-box;
    margin: 0;
    padding: 0;
}

:root {
    --primary: #a855f7;
    --primary-dark: #9333ea;
    --primary-light: #f3e8ff;
    --text: #29263b;
    --muted: #858196;
    --border: #eceaf1;
    --bg: #f8f8fc;
    --white: #ffffff;
}

body {
    font-family: "Segoe UI", Arial, sans-serif;
    background: var(--bg);
    color: var(--text);
}

a {
    text-decoration: none;
    color: inherit;
}

.layout {
    display: flex;
    min-height: 100vh;
}

/* SIDEBAR - SAME AS HRM DASHBOARD */

.sidebar {
    width: 250px;
    flex-shrink: 0;
    position: fixed;
    top: 0;
    bottom: 0;
    left: 0;
    overflow-y: auto;
    background: var(--white);
    border-right: 1px solid var(--border);
    padding: 25px 16px;
    z-index: 10;
}

.brand {
    display: flex;
    align-items: center;
    gap: 12px;
    padding: 0 10px;
    margin-bottom: 30px;
}

.brand-icon {
    width: 43px;
    height: 43px;
    display: grid;
    place-items: center;
    flex-shrink: 0;
    background: var(--primary-light);
    color: var(--primary-dark);
    border-radius: 12px;
    font-size: 23px;
    font-weight: 800;
}

.brand h2 {
    font-size: 20px;
    font-weight: 750;
    letter-spacing: -0.5px;
}

.brand p {
    color: var(--muted);
    font-size: 11px;
    margin-top: 4px;
}

.workspace {
    padding: 13px;
    margin-bottom: 25px;
    background: #faf9fc;
    border: 1px solid var(--border);
    border-radius: 12px;
    font-size: 13px;
    font-weight: 650;
}

.workspace a {
    display: block;
    color: var(--muted);
    font-size: 12px;
    font-weight: 500;
    margin-bottom: 13px;
}

.workspace a:hover {
    color: var(--primary-dark);
}

.menu-title {
    padding: 0 12px;
    margin: 24px 0 11px;
    color: #a09bad;
    font-size: 10px;
    font-weight: 750;
    letter-spacing: 1.4px;
}

.nav-link {
    display: flex;
    align-items: center;
    gap: 12px;
    padding: 13px 12px;
    margin-bottom: 5px;
    border-radius: 10px;
    color: #5d596e;
    font-size: 13px;
    font-weight: 600;
    transition: 0.2s;
}

.nav-link:hover,
.nav-link.active {
    background: var(--primary-light);
    color: var(--primary-dark);
}

.nav-link.active {
    font-weight: 750;
}

.nav-icon {
    width: 23px;
    text-align: center;
    font-size: 18px;
}

.sidebar-info {
    margin-top: 30px;
    padding: 16px 14px;
    background: #faf7ff;
    border: 1px solid #f0e7ff;
    border-radius: 12px;
}

.sidebar-info strong {
    display: block;
    font-size: 13px;
    margin-bottom: 7px;
}

.sidebar-info p {
    color: var(--muted);
    font-size: 11px;
    line-height: 1.7;
}

/* MAIN AND TOPBAR */

.main {
    flex: 1;
    min-width: 0;
    margin-left: 250px;
}

.topbar {
    min-height: 76px;
    padding: 16px 30px;
    display: flex;
    align-items: center;
    justify-content: space-between;
    gap: 15px;
    background: white;
    border-bottom: 1px solid var(--border);
}

.breadcrumb {
    color: var(--muted);
    font-size: 12px;
}

.breadcrumb strong {
    color: var(--text);
}

.topbar-actions {
    display: flex;
    align-items: center;
    gap: 10px;
}

.role-badge {
    padding: 10px 14px;
    border-radius: 25px;
    color: var(--primary-dark);
    background: var(--primary-light);
    font-size: 11px;
    font-weight: 750;
    white-space: nowrap;
}

.logout {
    padding: 10px 14px;
    border: 1px solid #e7e3ed;
    border-radius: 9px;
    color: #777187;
    font-size: 12px;
    font-weight: 650;
    transition: 0.2s;
    white-space: nowrap;
}

.logout:hover {
    color: #dc2626;
    border-color: #fecaca;
    background: #fff7f7;
}

.content {
    width: 100%;
    max-width: 1550px;
    padding: 30px;
    margin: auto;
}

/* PAGE HEADING - SAME DASHBOARD COLORS */

.page-heading {
    display: flex;
    justify-content: space-between;
    align-items: center;
    gap: 15px;
    margin-bottom: 25px;
}

.page-heading h1 {
    font-size: 25px;
    margin-bottom: 8px;
}

.page-heading p {
    color: var(--muted);
    font-size: 13px;
    line-height: 1.7;
}

.section-tag {
    color: var(--primary-dark);
    background: var(--primary-light);
    padding: 8px 12px;
    border-radius: 20px;
    font-size: 11px;
    font-weight: 650;
    white-space: nowrap;
}

/* SUMMARY CARDS */

.summary-cards {
    display: grid;
    grid-template-columns: repeat(4, minmax(0, 1fr));
    gap: 17px;
    margin-bottom: 28px;
}

.summary-card {
    min-width: 0;
    padding: 22px;
    background: white;
    border: 1px solid var(--border);
    border-radius: 15px;
    box-shadow: 0 4px 15px rgba(40, 20, 70, 0.025);
}

.summary-top {
    display: flex;
    align-items: center;
    justify-content: space-between;
    gap: 8px;
    margin-bottom: 20px;
}

.summary-label {
    color: var(--muted);
    font-size: 12px;
}

.summary-icon {
    width: 43px;
    height: 43px;
    flex-shrink: 0;
    display: grid;
    place-items: center;
    border-radius: 12px;
    font-size: 21px;
}

.purple {
    background: #f3e8ff;
    color: #9333ea;
}

.green {
    background: #e9f9ef;
    color: #16804a;
}

.orange {
    background: #fff3e5;
    color: #c46b12;
}

.blue {
    background: #eaf3ff;
    color: #2563eb;
}

.summary-card h2 {
    font-size: 23px;
    margin-bottom: 7px;
    overflow-wrap: anywhere;
}

.summary-card p {
    color: var(--muted);
    font-size: 11px;
}

/* SECTIONS */

.section-heading {
    display: flex;
    justify-content: space-between;
    align-items: center;
    gap: 12px;
    margin: 30px 0 17px;
}

.section-heading h2 {
    font-size: 18px;
    margin-bottom: 6px;
}

.section-heading p {
    color: var(--muted);
    font-size: 12px;
}

.panel {
    background: white;
    border: 1px solid var(--border);
    border-radius: 15px;
    padding: 24px;
    margin-bottom: 25px;
    box-shadow: 0 4px 15px rgba(40, 20, 70, 0.025);
}

/* FORM */

.form-grid {
    display: grid;
    grid-template-columns: repeat(3, minmax(0, 1fr));
    gap: 18px;
}

.form-group {
    min-width: 0;
}

.form-group label {
    display: block;
    margin-bottom: 8px;
    color: #5d596e;
    font-size: 12px;
    font-weight: 650;
}

.form-group input,
.form-group select {
    width: 100%;
    min-width: 0;
    height: 43px;
    padding: 10px 12px;
    border: 1px solid #e5e1ed;
    border-radius: 9px;
    outline: none;
    background: #fff;
    color: var(--text);
    font-family: inherit;
    font-size: 12px;
    transition: 0.2s;
}

.form-group input:focus,
.form-group select:focus {
    border-color: var(--primary);
    box-shadow: 0 0 0 3px rgba(168, 85, 247, 0.10);
}

.form-actions {
    display: flex;
    justify-content: flex-end;
    gap: 10px;
    margin-top: 22px;
}

.btn {
    display: inline-flex;
    justify-content: center;
    align-items: center;
    gap: 7px;
    padding: 11px 17px;
    border: 1px solid transparent;
    border-radius: 9px;
    font-family: inherit;
    font-size: 12px;
    font-weight: 700;
    cursor: pointer;
    transition: 0.2s;
}

.btn-primary {
    color: white;
    background: var(--primary-dark);
}

.btn-primary:hover {
    background: #7e22ce;
}

.btn-secondary {
    color: #777187;
    background: white;
    border-color: #e7e3ed;
}

.btn-secondary:hover {
    background: #faf9fc;
}

/* MESSAGES */

.message {
    padding: 12px 15px;
    margin-bottom: 17px;
    border-radius: 9px;
    font-size: 12px;
    line-height: 1.6;
}

.success {
    color: #166534;
    background: #f0fdf4;
    border: 1px solid #bbf7d0;
}

.error {
    color: #b91c1c;
    background: #fef2f2;
    border: 1px solid #fecaca;
}

/* TABLE */

.table-panel {
    padding: 0;
    overflow: hidden;
}

.table-toolbar {
    display: flex;
    justify-content: space-between;
    align-items: center;
    gap: 15px;
    padding: 22px 24px;
    border-bottom: 1px solid var(--border);
}

.table-toolbar h2 {
    font-size: 17px;
    margin-bottom: 5px;
}

.table-toolbar p {
    color: var(--muted);
    font-size: 11px;
}

.search-box {
    width: 240px;
    max-width: 100%;
    padding: 11px 13px;
    border: 1px solid #e5e1ed;
    border-radius: 9px;
    outline: none;
    font-family: inherit;
    font-size: 12px;
}

.search-box:focus {
    border-color: var(--primary);
    box-shadow: 0 0 0 3px rgba(168, 85, 247, 0.10);
}

.table-wrap {
    width: 100%;
    overflow-x: auto;
}

table {
    width: 100%;
    border-collapse: collapse;
    white-space: nowrap;
}

thead {
    background: #faf9fc;
}

th {
    color: #777187;
    text-align: left;
    font-size: 11px;
    font-weight: 750;
    padding: 15px 16px;
    border-bottom: 1px solid var(--border);
}

td {
    padding: 15px 16px;
    border-bottom: 1px solid #f0edf5;
    font-size: 12px;
    color: #514d62;
}

tbody tr:hover {
    background: #fdfaff;
}

tbody tr:last-child td {
    border-bottom: none;
}

.employee-name {
    color: var(--text);
    font-weight: 700;
}

.status {
    display: inline-block;
    padding: 6px 10px;
    border-radius: 20px;
    font-size: 10px;
    font-weight: 750;
}

.status-paid {
    color: #16804a;
    background: #e9f9ef;
}

.status-pending {
    color: #b76a0b;
    background: #fff3e5;
}

.status-other {
    color: #9333ea;
    background: #f3e8ff;
}

.action-links {
    display: flex;
    align-items: center;
    gap: 12px;
}

.action-links a {
    font-size: 11px;
    font-weight: 700;
}

.edit-link {
    color: var(--primary-dark);
}

.delete-link {
    color: #dc2626;
}

.empty-row {
    text-align: center;
    padding: 30px;
    color: var(--muted);
}

.footer {
    text-align: center;
    padding: 25px 10px 10px;
    color: #aaa6ba;
    font-size: 11px;
}

/* RESPONSIVE */

@media (max-width: 1250px) {
    .summary-cards {
        grid-template-columns: repeat(2, minmax(0, 1fr));
    }

    .content {
        padding: 25px 22px;
    }

    .form-grid {
        grid-template-columns: repeat(2, minmax(0, 1fr));
    }
}

@media (max-width: 850px) {
    .sidebar {
        width: 220px;
    }

    .main {
        margin-left: 220px;
    }

    .topbar {
        padding: 16px 20px;
    }

    .panel {
        padding: 20px;
    }
}

@media (max-width: 650px) {
    .layout {
        display: block;
    }

    .sidebar {
        position: relative;
        width: 100%;
        height: auto;
        padding: 16px;
        border-right: none;
        border-bottom: 1px solid var(--border);
    }

    .brand {
        margin-bottom: 17px;
    }

    .workspace,
    .sidebar-info,
    .menu-title {
        display: none;
    }

    .sidebar nav {
        display: flex;
        flex-wrap: nowrap;
        overflow-x: auto;
        gap: 5px;
        padding-bottom: 3px;
    }

    .nav-link {
        flex-shrink: 0;
        margin: 0;
        padding: 10px 12px;
        font-size: 12px;
    }

    .main {
        margin-left: 0;
        width: 100%;
    }

    .topbar {
        padding: 15px 16px;
    }

    .content {
        padding: 20px 16px;
    }

    .role-badge {
        display: none;
    }

    .form-grid {
        grid-template-columns: 1fr;
    }

    .table-toolbar {
        align-items: stretch;
        flex-direction: column;
        padding: 19px;
    }

    .search-box {
        width: 100%;
    }

    .panel {
        padding: 17px;
    }

    .table-panel {
        padding: 0;
    }
}

@media (max-width: 420px) {
    .summary-cards {
        grid-template-columns: 1fr;
    }

    .page-heading {
        align-items: flex-start;
        flex-direction: column;
    }

    .page-heading h1 {
        font-size: 22px;
    }

    .summary-card {
        padding: 19px;
    }

    .form-actions {
        flex-direction: column;
    }

    .btn {
        width: 100%;
    }
}
</style>
</head>

<body>

<div class="layout">

    <!-- SIDEBAR -->
    <aside class="sidebar">

        <div class="brand">
            <div class="brand-icon">P</div>
            <div>
                <h2>PeopleFlow</h2>
                <p>HR Management System</p>
            </div>
        </div>

        <div class="workspace">
            <a href="${pageContext.request.contextPath}/hrm-dashboard">
                &#8592; Back to workspace
            </a>
            &#128101; HR Management
        </div>

        <nav>
            <div class="menu-title">PLATFORM</div>

            <a class="nav-link"
               href="${pageContext.request.contextPath}/hrm-dashboard">
                <span class="nav-icon">&#9638;</span>
                Dashboard
            </a>

            <a class="nav-link"
               href="${pageContext.request.contextPath}/employees">
                <span class="nav-icon">&#128100;</span>
                Staff Management
            </a>

            <a class="nav-link"
               href="${pageContext.request.contextPath}/attendance">
                <span class="nav-icon">&#128203;</span>
                Attendance
            </a>

            <a class="nav-link"
               href="${pageContext.request.contextPath}/leaves">
                <span class="nav-icon">&#128197;</span>
                Leave Management
            </a>

            <a class="nav-link active"
               href="${pageContext.request.contextPath}/payroll">
                <span class="nav-icon">&#8377;</span>
                Payroll
            </a>

            <a class="nav-link"
               href="${pageContext.request.contextPath}/reports">
                <span class="nav-icon">&#128202;</span>
                Reports
            </a>

            <div class="menu-title">CRM WORKSPACE</div>

            <a class="nav-link"
               href="${pageContext.request.contextPath}/crm-dashboard">
                <span class="nav-icon">&#128188;</span>
                CRM Dashboard
            </a>

            <a class="nav-link"
               href="${pageContext.request.contextPath}/customers">
                <span class="nav-icon">&#128101;</span>
                Customers
            </a>

            <a class="nav-link"
               href="${pageContext.request.contextPath}/leads">
                <span class="nav-icon">&#128200;</span>
                Leads
            </a>
        </nav>

        <div class="sidebar-info">
            <strong>&#10022; PeopleFlow Workspace</strong>
            <p>
                Manage employees, attendance, leave requests and payroll
                through your HR management workspace.
            </p>
        </div>

    </aside>

    <!-- MAIN -->
    <main class="main">

        <!-- TOPBAR -->
        <header class="topbar">

            <div class="breadcrumb">
                PeopleFlow &nbsp; &#8250; &nbsp;
                <strong>Payroll</strong>
            </div>

            <div class="topbar-actions">
                <span class="role-badge">
                    &#10022; HR WORKSPACE
                </span>

                <a class="logout"
                   href="${pageContext.request.contextPath}/login">
                    Logout &#8599;
                </a>
            </div>

        </header>

        <section class="content">

            <!-- PAGE HEADING -->
            <div class="page-heading">
                <div>
                    <h1>Payroll Management</h1>
                    <p>
                        Manage employee salary records and payment information.
                    </p>
                </div>

                <span class="section-tag">SALARY MANAGEMENT</span>
            </div>

            <!-- ALERT MESSAGES -->
            <c:if test="${not empty success}">
                <div class="message success">
                    ${success}
                </div>
            </c:if>

            <c:if test="${not empty error}">
                <div class="message error">
                    ${error}
                </div>
            </c:if>

            <!-- SUMMARY CARDS -->
            <div class="summary-cards">

                <div class="summary-card">
                    <div class="summary-top">
                        <span class="summary-label">Total Payroll Records</span>
                        <span class="summary-icon purple">&#128203;</span>
                    </div>
                    <h2 id="totalRecords">${empty payrollList ? 0 : payrollList.size()}</h2>
                    <p>Available salary records</p>
                </div>

                <div class="summary-card">
                    <div class="summary-top">
                        <span class="summary-label">Paid Records</span>
                        <span class="summary-icon green">&#10003;</span>
                    </div>
                    <h2 id="paidRecords">0</h2>
                    <p>Payments marked as paid</p>
                </div>

                <div class="summary-card">
                    <div class="summary-top">
                        <span class="summary-label">Pending Records</span>
                        <span class="summary-icon orange">&#9203;</span>
                    </div>
                    <h2 id="pendingRecords">0</h2>
                    <p>Payments awaiting completion</p>
                </div>

                <div class="summary-card">
                    <div class="summary-top">
                        <span class="summary-label">Total Net Salary</span>
                        <span class="summary-icon blue">&#8377;</span>
                    </div>
                    <h2 id="totalNetSalary">&#8377; 0.00</h2>
                    <p>Sum of listed net salaries</p>
                </div>

            </div>

            <!-- ADD PAYROLL FORM -->
            <div class="section-heading">
                <div>
                    <h2>Add Payroll Record</h2>
                    <p>Enter employee salary and payment details.</p>
                </div>
            </div>

            <div class="panel">

                <form action="${pageContext.request.contextPath}/payroll/add"
                      method="post">

                    <div class="form-grid">

                        <div class="form-group">
                            <label for="employeeId">Employee ID</label>
                            <input type="number"
                                   id="employeeId"
                                   name="employeeId"
                                   placeholder="Enter employee ID"
                                   min="1"
                                   required>
                        </div>

                        <div class="form-group">
                            <label for="employeeName">Employee Name</label>
                            <input type="text"
                                   id="employeeName"
                                   name="employeeName"
                                   placeholder="Enter employee name"
                                   required>
                        </div>

                        <div class="form-group">
                            <label for="basicSalary">Basic Salary (₹)</label>
                            <input type="number"
                                   id="basicSalary"
                                   name="basicSalary"
                                   placeholder="Enter basic salary"
                                   min="0"
                                   step="0.01"
                                   required>
                        </div>

                        <div class="form-group">
                            <label for="allowance">Allowance (₹)</label>
                            <input type="number"
                                   id="allowance"
                                   name="allowance"
                                   placeholder="Enter allowance"
                                   min="0"
                                   step="0.01"
                                   value="0">
                        </div>

                        <div class="form-group">
                            <label for="deduction">Deduction (₹)</label>
                            <input type="number"
                                   id="deduction"
                                   name="deduction"
                                   placeholder="Enter deduction"
                                   min="0"
                                   step="0.01"
                                   value="0">
                        </div>

                        <div class="form-group">
                            <label for="paymentDate">Payment Date</label>
                            <input type="date"
                                   id="paymentDate"
                                   name="paymentDate"
                                   required>
                        </div>

                        <div class="form-group">
                            <label for="paymentStatus">Payment Status</label>
                            <select id="paymentStatus"
                                    name="paymentStatus"
                                    required>
                                <option value="Pending">Pending</option>
                                <option value="Paid">Paid</option>
                            </select>
                        </div>

                    </div>

                    <div class="form-actions">
                        <button type="reset" class="btn btn-secondary">
                            Clear Form
                        </button>

                        <button type="submit" class="btn btn-primary">
                            &#43; Add Payroll
                        </button>
                    </div>

                </form>

            </div>

            <!-- PAYROLL TABLE -->
            <div class="section-heading">
                <div>
                    <h2>Payroll Records</h2>
                    <p>View employee salaries and payment status.</p>
                </div>

                <span class="section-tag">PAYROLL LIST</span>
            </div>

            <div class="panel table-panel">

                <div class="table-toolbar">
                    <div>
                        <h2>All Payroll Records</h2>
                        <p>Search and manage saved payroll information.</p>
                    </div>

                    <input type="text"
                           id="payrollSearch"
                           class="search-box"
                           placeholder="Search payroll records...">
                </div>

                <div class="table-wrap">

                    <table id="payrollTable">

                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Employee ID</th>
                                <th>Employee Name</th>
                                <th>Basic Salary</th>
                                <th>Allowance</th>
                                <th>Deduction</th>
                                <th>Net Salary</th>
                                <th>Payment Date</th>
                                <th>Status</th>
                                <th>Actions</th>
                            </tr>
                        </thead>

                        <tbody>

                            <c:forEach var="p" items="${payrollList}">
                                <tr class="payroll-row">

                                    <td>${p.id}</td>

                                    <td>${p.employeeId}</td>

                                    <td class="employee-name">
                                        <c:out value="${p.employeeName}"/>
                                    </td>

                                    <td class="money">
                                        <c:out value="${p.basicSalary}"/>
                                    </td>

                                    <td class="money">
                                        <c:out value="${p.allowance}"/>
                                    </td>

                                    <td class="money">
                                        <c:out value="${p.deduction}"/>
                                    </td>

                                    <td class="net-salary">
                                        <c:out value="${p.netSalary}"/>
                                    </td>

                                    <td>
                                        <c:out value="${p.paymentDate}"/>
                                    </td>

                                    <td>
                                        <c:choose>
                                            <c:when test="${p.paymentStatus eq 'Paid'}">
                                                <span class="status status-paid">
                                                    <c:out value="${p.paymentStatus}"/>
                                                </span>
                                            </c:when>

                                            <c:when test="${p.paymentStatus eq 'Pending'}">
                                                <span class="status status-pending">
                                                    <c:out value="${p.paymentStatus}"/>
                                                </span>
                                            </c:when>

                                            <c:otherwise>
                                                <span class="status status-other">
                                                    <c:out value="${p.paymentStatus}"/>
                                                </span>
                                            </c:otherwise>
                                        </c:choose>
                                    </td>

                                    <td>
                                        <div class="action-links">
                                            <a class="edit-link"
                                               href="${pageContext.request.contextPath}/payroll/edit/${p.id}">
                                                Edit
                                            </a>

                                            <a class="delete-link"
                                               href="${pageContext.request.contextPath}/payroll/delete/${p.id}"
                                               onclick="return confirm('Are you sure you want to delete this payroll record?');">
                                                Delete
                                            </a>
                                        </div>
                                    </td>

                                </tr>
                            </c:forEach>

                            <c:if test="${empty payrollList}">
                                <tr id="emptyDataRow">
                                    <td colspan="10" class="empty-row">
                                        No payroll records available.
                                    </td>
                                </tr>
                            </c:if>

                            <tr id="noSearchResults" style="display:none;">
                                <td colspan="10" class="empty-row">
                                    No matching payroll records found.
                                </td>
                            </tr>

                        </tbody>

                    </table>

                </div>

            </div>

            <footer class="footer">
                &copy; PeopleFlow | HR Management System
            </footer>

        </section>

    </main>

</div>

<script>
document.addEventListener("DOMContentLoaded", function () {

    const searchInput = document.getElementById("payrollSearch");
    const table = document.getElementById("payrollTable");
    const rows = Array.from(table.querySelectorAll("tbody tr.payroll-row"));

    let paidCount = 0;
    let pendingCount = 0;
    let totalNet = 0;

    rows.forEach(function (row) {
        const statusElement = row.querySelector(".status");
        const status = statusElement
            ? statusElement.textContent.trim().toLowerCase()
            : "";

        if (status === "paid") {
            paidCount++;
        }

        if (status === "pending") {
            pendingCount++;
        }

        const netCell = row.querySelector(".net-salary");
        const netValue = netCell
            ? parseFloat(netCell.textContent.trim().replace(/,/g, ""))
            : 0;

        if (!isNaN(netValue)) {
            totalNet += netValue;
        }
    });

    document.getElementById("paidRecords").textContent = paidCount;
    document.getElementById("pendingRecords").textContent = pendingCount;

    document.getElementById("totalNetSalary").textContent =
        "\u20B9 " + totalNet.toLocaleString("en-IN", {
            minimumFractionDigits: 2,
            maximumFractionDigits: 2
        });

    searchInput.addEventListener("input", function () {

        const query = this.value.toLowerCase().trim();
        let visibleCount = 0;

        rows.forEach(function (row) {
            const matches = row.textContent.toLowerCase().includes(query);

            row.style.display = matches ? "" : "none";

            if (matches) {
                visibleCount++;
            }
        });

        const noResults = document.getElementById("noSearchResults");

        if (noResults) {
            noResults.style.display =
                (visibleCount === 0 && rows.length > 0) ? "" : "none";
        }

        const emptyData = document.getElementById("emptyDataRow");

        if (emptyData) {
            emptyData.style.display = query === "" ? "" : "none";
        }
    });

});
</script>

</body>
</html>