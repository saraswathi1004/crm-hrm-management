
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Payroll | PeopleFlow</title>

    <style>
        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
        }

        body {
            font-family: Arial, sans-serif;
            background: #f8f8fc;
            color: #29263b;
        }

        a {
            text-decoration: none;
        }

        .layout {
            display: flex;
            min-height: 100vh;
        }

        /* Sidebar - Same as Staff Management */

        .sidebar {
            width: 250px;
            position: fixed;
            top: 0;
            bottom: 0;
            left: 0;
            background: #fff;
            border-right: 1px solid #eceaf1;
            padding: 25px 16px;
            overflow-y: auto;
            z-index: 10;
        }

        .brand {
            display: flex;
            align-items: center;
            gap: 12px;
            padding: 0 10px 30px;
        }

        .logo {
            width: 42px;
            height: 42px;
            display: flex;
            align-items: center;
            justify-content: center;
            background: #f3e8ff;
            color: #9333ea;
            border-radius: 12px;
            font-size: 22px;
            font-weight: bold;
        }

        .brand h2 {
            font-size: 21px;
            color: #29263b;
        }

        .brand small {
            color: #888397;
            font-size: 11px;
        }

        .workspace {
            padding: 13px;
            margin-bottom: 27px;
            background: #faf9fc;
            border: 1px solid #eceaf1;
            border-radius: 12px;
            font-weight: 600;
            font-size: 13px;
        }

        .workspace a {
            display: block;
            color: #777187;
            font-size: 12px;
            margin-bottom: 14px;
        }

        .menu-title {
            padding: 0 12px;
            margin: 20px 0 10px;
            color: #a09bad;
            font-size: 11px;
            letter-spacing: 1px;
            text-transform: uppercase;
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
            transition: .2s;
        }

        .nav-link:hover,
        .nav-link.active {
            background: #f3e8ff;
            color: #9333ea;
        }

        .nav-link.active {
            font-weight: 700;
        }

        .nav-icon {
            width: 23px;
            text-align: center;
            font-size: 18px;
        }

        /* Main Content */

        .main {
            width: calc(100% - 250px);
            margin-left: 250px;
            min-width: 0;
        }

        .topbar {
            min-height: 72px;
            background: #fff;
            border-bottom: 1px solid #eceaf1;
            display: flex;
            align-items: center;
            justify-content: space-between;
            padding: 15px 32px;
            gap: 15px;
        }

        .breadcrumb {
            font-size: 13px;
            color: #858196;
        }

        .breadcrumb strong {
            color: #29263b;
        }

        .workspace-badge {
            background: #f3e8ff;
            color: #9333ea;
            padding: 9px 14px;
            border-radius: 20px;
            font-size: 12px;
            font-weight: bold;
            white-space: nowrap;
        }

        .content {
            padding: 30px;
            max-width: 1100px;
            margin: auto;
        }

        .page-heading {
            display: flex;
            align-items: center;
            justify-content: space-between;
            gap: 15px;
            flex-wrap: wrap;
            margin-bottom: 25px;
        }

        .page-heading h1 {
            font-size: 27px;
            margin-bottom: 8px;
            color: #29263b;
        }

        .page-heading p {
            color: #858196;
            font-size: 14px;
        }

        .back-link {
            display: inline-block;
            padding: 10px 15px;
            background: #fff;
            border: 1px solid #eceaf1;
            border-radius: 9px;
            color: #5d596e;
            font-size: 13px;
            font-weight: 600;
        }

        .back-link:hover {
            background: #f3e8ff;
            color: #9333ea;
        }

        .card {
            background: #fff;
            border: 1px solid #eceaf1;
            border-radius: 15px;
            padding: 28px;
            box-shadow: 0 5px 20px rgba(41, 38, 59, 0.04);
        }

        .card-heading {
            padding-bottom: 20px;
            margin-bottom: 25px;
            border-bottom: 1px solid #eceaf1;
        }

        .card-heading h2 {
            font-size: 18px;
            margin-bottom: 7px;
        }

        .card-heading p {
            font-size: 13px;
            color: #858196;
        }

        .form-grid {
            display: grid;
            grid-template-columns: repeat(2, minmax(0, 1fr));
            gap: 22px;
        }

        .form-group {
            min-width: 0;
        }

        .form-group label {
            display: block;
            font-size: 13px;
            font-weight: 600;
            margin-bottom: 9px;
            color: #454156;
        }

        .form-group input,
        .form-group select {
            width: 100%;
            height: 44px;
            padding: 0 13px;
            border: 1px solid #dedbe7;
            border-radius: 9px;
            background: #fff;
            color: #29263b;
            font-family: inherit;
            font-size: 13px;
            outline: none;
        }

        .form-group input:focus,
        .form-group select:focus {
            border-color: #a855f7;
            box-shadow: 0 0 0 3px rgba(168, 85, 247, 0.10);
        }

        .form-actions {
            display: flex;
            justify-content: flex-end;
            gap: 12px;
            margin-top: 30px;
            padding-top: 22px;
            border-top: 1px solid #eceaf1;
        }

        .btn {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            padding: 12px 19px;
            border-radius: 9px;
            border: none;
            cursor: pointer;
            font-size: 13px;
            font-weight: 600;
            font-family: inherit;
        }

        .update-btn {
            background: #9333ea;
            color: #fff;
        }

        .update-btn:hover {
            background: #7e22ce;
        }

        .cancel-btn {
            background: #fff;
            border: 1px solid #dedbe7;
            color: #5d596e;
        }

        .cancel-btn:hover {
            background: #f8f8fc;
        }

        @media (max-width: 1100px) {
            .sidebar {
                width: 220px;
            }

            .main {
                width: calc(100% - 220px);
                margin-left: 220px;
            }

            .content {
                padding: 22px;
            }
        }

        @media (max-width: 760px) {
            .sidebar {
                display: none;
            }

            .main {
                width: 100%;
                margin-left: 0;
            }

            .topbar {
                padding: 15px;
                flex-wrap: wrap;
            }

            .content {
                padding: 16px;
            }

            .form-grid {
                grid-template-columns: 1fr;
            }

            .card {
                padding: 20px;
            }

            .page-heading h1 {
                font-size: 23px;
            }
        }
    </style>
</head>

<body>

<div class="layout">

    <!-- Sidebar -->
    <aside class="sidebar">

        <div class="brand">
            <div class="logo">P</div>
            <div>
                <h2>PeopleFlow</h2>
                <small>HR Management System</small>
            </div>
        </div>

        <div class="workspace">
            <a href="${pageContext.request.contextPath}/hrm-dashboard">
                &#8592; Back to workspace
            </a>
            &#128101; HR Management
        </div>

        <div class="menu-title">Platform</div>

        <a class="nav-link"
           href="${pageContext.request.contextPath}/hrm-dashboard">
            <span class="nav-icon">&#9638;</span> Dashboard
        </a>

        <a class="nav-link"
           href="${pageContext.request.contextPath}/employees">
            <span class="nav-icon">&#128100;</span> Staff Management
        </a>

        <a class="nav-link"
           href="${pageContext.request.contextPath}/attendance">
            <span class="nav-icon">&#128203;</span> Attendance
        </a>

        <a class="nav-link"
           href="${pageContext.request.contextPath}/leaves">
            <span class="nav-icon">&#128197;</span> Leave Management
        </a>

        <a class="nav-link active"
           href="${pageContext.request.contextPath}/payroll">
            <span class="nav-icon">&#8377;</span> Payroll
        </a>

        <a class="nav-link"
           href="${pageContext.request.contextPath}/reports">
            <span class="nav-icon">&#128202;</span> Reports
        </a>

        <div class="menu-title">CRM</div>

        <a class="nav-link"
           href="${pageContext.request.contextPath}/crm-dashboard">
            <span class="nav-icon">&#128188;</span> CRM Dashboard
        </a>

        <a class="nav-link"
           href="${pageContext.request.contextPath}/customers">
            <span class="nav-icon">&#128101;</span> Customers
        </a>

        <a class="nav-link"
           href="${pageContext.request.contextPath}/leads">
            <span class="nav-icon">&#128200;</span> Leads
        </a>

    </aside>

    <!-- Main Content -->
    <main class="main">

        <header class="topbar">
            <div class="breadcrumb">
                HR / Payroll / <strong>Edit Payroll</strong>
            </div>

            <div class="workspace-badge">
                &#10022; HR Workspace
            </div>
        </header>

        <section class="content">

            <div class="page-heading">
                <div>
                    <h1>Edit Payroll</h1>
                    <p>Update salary, allowances and payment information.</p>
                </div>

                <a class="back-link"
                   href="${pageContext.request.contextPath}/payroll">
                    &#8592; Back to Payroll
                </a>
            </div>

            <div class="card">

                <div class="card-heading">
                    <h2>Payroll Details</h2>
                    <p>Update the employee's payroll information below.</p>
                </div>

                <form action="${pageContext.request.contextPath}/payroll/update/${payroll.id}"
                      method="post">

                    <div class="form-grid">

                        <div class="form-group">
                            <label for="employeeId">Employee ID</label>
                            <input type="number"
                                   id="employeeId"
                                   name="employeeId"
                                   value="<c:out value='${payroll.employeeId}'/>"
                                   min="1"
                                   required>
                        </div>

                        <div class="form-group">
                            <label for="employeeName">Employee Name</label>
                            <input type="text"
                                   id="employeeName"
                                   name="employeeName"
                                   value="<c:out value='${payroll.employeeName}'/>"
                                   required>
                        </div>

                        <div class="form-group">
                            <label for="basicSalary">Basic Salary</label>
                            <input type="number"
                                   id="basicSalary"
                                   name="basicSalary"
                                   value="<c:out value='${payroll.basicSalary}'/>"
                                   min="0"
                                   step="0.01"
                                   required>
                        </div>

                        <div class="form-group">
                            <label for="allowance">Allowance</label>
                            <input type="number"
                                   id="allowance"
                                   name="allowance"
                                   value="<c:out value='${payroll.allowance}'/>"
                                   min="0"
                                   step="0.01"
                                   required>
                        </div>

                        <div class="form-group">
                            <label for="deduction">Deduction</label>
                            <input type="number"
                                   id="deduction"
                                   name="deduction"
                                   value="<c:out value='${payroll.deduction}'/>"
                                   min="0"
                                   step="0.01"
                                   required>
                        </div>

                        <div class="form-group">
                            <label for="paymentDate">Payment Date</label>
                            <input type="date"
                                   id="paymentDate"
                                   name="paymentDate"
                                   value="<c:out value='${payroll.paymentDate}'/>"
                                   required>
                        </div>

                        <div class="form-group">
                            <label for="paymentStatus">Payment Status</label>
                            <select id="paymentStatus"
                                    name="paymentStatus"
                                    required>
                                <option value="Pending"
                                    ${payroll.paymentStatus == 'Pending' ? 'selected' : ''}>
                                    Pending
                                </option>

                                <option value="Paid"
                                    ${payroll.paymentStatus == 'Paid' ? 'selected' : ''}>
                                    Paid
                                </option>
                            </select>
                        </div>

                    </div>

                    <div class="form-actions">
                        <a class="btn cancel-btn"
                           href="${pageContext.request.contextPath}/payroll">
                            Cancel
                        </a>

                        <button type="submit" class="btn update-btn">
                            Update Payroll
                        </button>
                    </div>

                </form>

            </div>

        </section>

    </main>

</div>

</body>
</html>
