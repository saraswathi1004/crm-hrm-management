
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Employee | PeopleFlow</title>

    <style>
        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
        }

        body {
            font-family: "Segoe UI", Arial, sans-serif;
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

        /* SAME SIDEBAR AS STAFF MANAGEMENT */

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
            transition: 0.2s;
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

        /* MAIN CONTENT */

        .main {
            width: calc(100% - 250px);
            margin-left: 250px;
            min-width: 0;
        }

        .topbar {
            min-height: 72px;
            padding: 15px 30px;
            background: #fff;
            border-bottom: 1px solid #eceaf1;
            display: flex;
            justify-content: space-between;
            align-items: center;
            gap: 15px;
        }

        .breadcrumb {
            color: #888397;
            font-size: 13px;
        }

        .breadcrumb strong {
            color: #29263b;
        }

        .user-badge {
            padding: 10px 15px;
            background: #f3e8ff;
            color: #9333ea;
            border-radius: 25px;
            font-size: 12px;
            font-weight: 600;
            white-space: nowrap;
        }

        .content {
            max-width: 1550px;
            padding: 30px;
            margin: auto;
        }

        /* PAGE HEADING */

        .page-heading {
            margin-bottom: 25px;
        }

        .page-heading h1 {
            font-size: 28px;
            margin-bottom: 8px;
        }

        .page-heading p {
            color: #858196;
            font-size: 13px;
            line-height: 1.6;
        }

        .back-link {
            display: inline-flex;
            align-items: center;
            gap: 8px;
            margin-bottom: 18px;
            color: #9333ea;
            font-size: 13px;
            font-weight: 700;
        }

        .back-link:hover {
            color: #7e22ce;
        }

        /* FORM CARD */

        .form-card {
            background: #fff;
            border: 1px solid #eceaf1;
            border-radius: 15px;
            overflow: hidden;
            box-shadow: 0 4px 18px rgba(35, 24, 60, 0.035);
        }

        .form-heading {
            display: flex;
            align-items: center;
            gap: 14px;
            padding: 24px 26px;
            border-bottom: 1px solid #eceaf1;
        }

        .heading-icon {
            width: 46px;
            height: 46px;
            flex-shrink: 0;
            display: flex;
            align-items: center;
            justify-content: center;
            border-radius: 12px;
            background: #f3e8ff;
            color: #9333ea;
            font-size: 22px;
        }

        .form-heading h2 {
            font-size: 18px;
            margin-bottom: 6px;
        }

        .form-heading p {
            color: #858196;
            font-size: 12px;
            line-height: 1.5;
        }

        .form-body {
            padding: 27px;
        }

        .section-title {
            font-size: 13px;
            font-weight: 750;
            color: #514c61;
            margin-bottom: 20px;
        }

        .form-grid {
            display: grid;
            grid-template-columns: repeat(2, minmax(0, 1fr));
            gap: 22px;
        }

        .form-field {
            min-width: 0;
        }

        .form-field label {
            display: block;
            margin-bottom: 9px;
            font-size: 12px;
            font-weight: 700;
            color: #5b566c;
        }

        .required {
            color: #e11d48;
        }

        .form-field input,
        .form-field select {
            width: 100%;
            min-height: 45px;
            padding: 12px 13px;
            border: 1px solid #e5e1ed;
            border-radius: 10px;
            outline: none;
            background: #fff;
            font-family: inherit;
            font-size: 13px;
            color: #29263b;
            transition: 0.2s;
        }

        .form-field input:focus,
        .form-field select:focus {
            border-color: #a855f7;
            box-shadow: 0 0 0 3px #f3e8ff;
        }

        .form-field input::placeholder {
            color: #aaa5b8;
        }

        .field-hint {
            display: block;
            margin-top: 7px;
            color: #898498;
            font-size: 11px;
        }

        .form-divider {
            height: 1px;
            background: #eceaf1;
            margin: 27px 0 22px;
        }

        .form-actions {
            display: flex;
            align-items: center;
            gap: 10px;
            flex-wrap: wrap;
        }

        .btn {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            gap: 8px;
            min-height: 43px;
            padding: 12px 18px;
            border: 1px solid #e7e3ed;
            border-radius: 10px;
            background: white;
            color: #514c61;
            font-family: inherit;
            font-size: 13px;
            font-weight: 650;
            cursor: pointer;
            transition: 0.2s;
        }

        .btn-primary {
            background: #a855f7;
            color: white;
            border-color: #a855f7;
        }

        .btn-primary:hover {
            background: #9333ea;
            border-color: #9333ea;
        }

        .btn-secondary:hover {
            background: #faf9fc;
        }

        .footer-note {
            margin-top: 22px;
            text-align: center;
            color: #898498;
            font-size: 11px;
        }

        /* RESPONSIVE */

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

        /* SAME MOBILE SIDEBAR BEHAVIOUR AS STAFF MANAGEMENT */

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
            }

            .content {
                padding: 16px;
            }

            .page-heading h1 {
                font-size: 23px;
            }

            .form-heading {
                padding: 19px;
            }

            .form-body {
                padding: 19px;
            }

            .form-grid {
                grid-template-columns: 1fr;
                gap: 18px;
            }

            .form-actions {
                flex-direction: column;
                align-items: stretch;
            }

            .btn {
                width: 100%;
            }
        }
    </style>
</head>

<body>

<div class="layout">

    <!-- SIDEBAR: SAME AS STAFF MANAGEMENT -->

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

        <a class="nav-link active"
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

        <a class="nav-link"
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

    <!-- MAIN -->

    <main class="main">

        <header class="topbar">
            <div class="breadcrumb">
                HR &nbsp; &#8250; &nbsp; Staff Management &nbsp; &#8250;
                <strong>Edit Employee</strong>
            </div>

            <div class="user-badge">
                &#10022; HR Workspace
            </div>
        </header>

        <section class="content">

            <a class="back-link"
               href="${pageContext.request.contextPath}/employees">
                &#8592; Back to Staff Management
            </a>

            <div class="page-heading">
                <h1>Edit Employee</h1>
                <p>Update employee information and keep your HR records up to date.</p>
            </div>

            <div class="form-card">

                <div class="form-heading">
                    <div class="heading-icon">&#128100;</div>
                    <div>
                        <h2>Employee Information</h2>
                        <p>Update the employee details in the form below.</p>
                    </div>
                </div>

                <div class="form-body">

                    <form action="${pageContext.request.contextPath}/employees/update/${employee.id}"
                          method="post">

                        <div class="section-title">
                            Personal & Employment Details
                        </div>

                        <div class="form-grid">

                            <div class="form-field">
                                <label for="employeeName">
                                    Employee Name <span class="required">*</span>
                                </label>
                                <input type="text"
                                       id="employeeName"
                                       name="employeeName"
                                       value="<c:out value='${employee.employeeName}'/>"
                                       placeholder="Enter employee name"
                                       required>
                            </div>

                            <div class="form-field">
                                <label for="email">
                                    Email Address <span class="required">*</span>
                                </label>
                                <input type="email"
                                       id="email"
                                       name="email"
                                       value="<c:out value='${employee.email}'/>"
                                       placeholder="Enter email address"
                                       required>
                            </div>

                            <div class="form-field">
                                <label for="phone">
                                    Phone Number <span class="required">*</span>
                                </label>
                                <input type="text"
                                       id="phone"
                                       name="phone"
                                       value="<c:out value='${employee.phone}'/>"
                                       placeholder="Enter phone number"
                                       required>
                            </div>

                            <div class="form-field">
                                <label for="department">
                                    Department <span class="required">*</span>
                                </label>
                                <input type="text"
                                       id="department"
                                       name="department"
                                       value="<c:out value='${employee.department}'/>"
                                       placeholder="Enter department"
                                       required>
                            </div>

                            <div class="form-field">
                                <label for="designation">
                                    Designation <span class="required">*</span>
                                </label>
                                <input type="text"
                                       id="designation"
                                       name="designation"
                                       value="<c:out value='${employee.designation}'/>"
                                       placeholder="Enter designation"
                                       required>
                            </div>

                            <div class="form-field">
                                <label for="salary">
                                    Salary <span class="required">*</span>
                                </label>
                                <input type="number"
                                       id="salary"
                                       name="salary"
                                       min="0"
                                       step="0.01"
                                       value="<c:out value='${employee.salary}'/>"
                                       placeholder="Enter salary"
                                       required>
                                <span class="field-hint">
                                    Enter the employee's salary amount.
                                </span>
                            </div>

                            <div class="form-field">
                                <label for="joiningDate">
                                    Joining Date <span class="required">*</span>
                                </label>
                                <input type="date"
                                       id="joiningDate"
                                       name="joiningDate"
                                       value="<c:out value='${employee.joiningDate}'/>"
                                       required>
                            </div>

                            <div class="form-field">
                                <label for="status">
                                    Employment Status <span class="required">*</span>
                                </label>
                                <select id="status" name="status" required>
                                    <option value="Active"
                                        ${employee.status == 'Active' ? 'selected' : ''}>
                                        Active
                                    </option>
                                    <option value="Inactive"
                                        ${employee.status == 'Inactive' ? 'selected' : ''}>
                                        Inactive
                                    </option>
                                </select>
                                <span class="field-hint">
                                    Select the employee's current status.
                                </span>
                            </div>

                        </div>

                        <div class="form-divider"></div>

                        <div class="form-actions">

                            <button type="submit" class="btn btn-primary">
                                &#10003; Update Employee
                            </button>

                            <a href="${pageContext.request.contextPath}/employees"
                               class="btn btn-secondary">
                                Cancel
                            </a>

                        </div>

                    </form>

                </div>
            </div>

            <div class="footer-note">
                PeopleFlow &middot; HR Management System
            </div>

        </section>

    </main>

</div>

</body>
</html>
