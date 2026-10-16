
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Customer | PeopleFlow CRM</title>

    <style>
        :root {
            --primary: #0f766e;
            --primary-dark: #115e59;
            --primary-light: #ccfbf1;
            --text: #29263b;
            --muted: #858196;
            --border: #eceaf1;
            --bg: #f8f8fc;
            --white: #ffffff;
        }

        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
        }

        body {
            font-family: Arial, Helvetica, sans-serif;
            background: var(--bg);
            color: var(--text);
            min-height: 100vh;
        }

        a {
            text-decoration: none;
        }

        /* Sidebar */
        .sidebar {
            width: 250px;
            position: fixed;
            top: 0;
            bottom: 0;
            left: 0;
            background: var(--white);
            border-right: 1px solid var(--border);
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
            background: var(--primary-light);
            color: var(--primary-dark);
            border-radius: 12px;
            font-size: 22px;
            font-weight: bold;
        }

        .brand h2 {
            font-size: 21px;
            margin-bottom: 4px;
        }

        .brand small {
            color: var(--muted);
            font-size: 11px;
        }

        .workspace {
            padding: 13px;
            margin-bottom: 27px;
            background: #faf9fc;
            border: 1px solid var(--border);
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
            transition: 0.2s;
        }

        .nav-link:hover,
        .nav-link.active {
            background: var(--primary-light);
            color: var(--primary-dark);
        }

        .nav-link.active {
            font-weight: 700;
        }

        .nav-icon {
            width: 23px;
            text-align: center;
            font-size: 18px;
        }

        /* Main content */
        .main {
            width: calc(100% - 250px);
            margin-left: 250px;
            min-width: 0;
        }

        .topbar {
            height: 72px;
            background: var(--white);
            border-bottom: 1px solid var(--border);
            display: flex;
            align-items: center;
            justify-content: space-between;
            padding: 0 35px;
        }

        .breadcrumb {
            color: var(--muted);
            font-size: 13px;
        }

        .breadcrumb strong {
            color: var(--text);
        }

        .workspace-badge {
            background: var(--primary-light);
            color: var(--primary-dark);
            padding: 9px 14px;
            border-radius: 20px;
            font-size: 12px;
            font-weight: 700;
        }

        .content {
            padding: 32px 35px;
            max-width: 1100px;
            margin: 0 auto;
        }

        .page-heading {
            margin-bottom: 25px;
        }

        .page-heading h1 {
            font-size: 27px;
            margin-bottom: 9px;
        }

        .page-heading p {
            font-size: 13px;
            color: var(--muted);
            line-height: 1.6;
        }

        .form-card {
            max-width: 760px;
            background: var(--white);
            border: 1px solid var(--border);
            border-radius: 16px;
            padding: 30px;
            box-shadow: 0 4px 18px rgba(35, 30, 65, 0.04);
        }

        .form-header {
            display: flex;
            align-items: center;
            gap: 14px;
            padding-bottom: 23px;
            margin-bottom: 25px;
            border-bottom: 1px solid var(--border);
        }

        .form-icon {
            width: 48px;
            height: 48px;
            display: flex;
            align-items: center;
            justify-content: center;
            border-radius: 13px;
            background: var(--primary-light);
            color: var(--primary-dark);
            font-size: 23px;
        }

        .form-header h2 {
            font-size: 18px;
            margin-bottom: 6px;
        }

        .form-header p {
            color: var(--muted);
            font-size: 12px;
        }

        .form-grid {
            display: grid;
            grid-template-columns: repeat(2, minmax(0, 1fr));
            gap: 22px 20px;
        }

        .form-group {
            min-width: 0;
        }

        .form-group.full-width {
            grid-column: 1 / -1;
        }

        label {
            display: block;
            margin-bottom: 9px;
            font-size: 13px;
            font-weight: 700;
            color: #454157;
        }

        .required {
            color: #dc2626;
        }

        input,
        textarea {
            display: block;
            width: 100%;
            border: 1px solid #dedbe7;
            border-radius: 9px;
            padding: 12px 14px;
            background: var(--white);
            color: var(--text);
            font-family: inherit;
            font-size: 13px;
            outline: none;
            transition: border-color 0.2s, box-shadow 0.2s;
        }

        input {
            height: 44px;
        }

        textarea {
            resize: vertical;
            min-height: 110px;
            line-height: 1.6;
        }

        input:focus,
        textarea:focus {
            border-color: var(--primary);
            box-shadow: 0 0 0 3px rgba(15, 118, 110, 0.10);
        }

        .form-actions {
            display: flex;
            justify-content: flex-end;
            gap: 12px;
            margin-top: 30px;
            padding-top: 23px;
            border-top: 1px solid var(--border);
        }

        .btn {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            min-height: 43px;
            padding: 0 20px;
            border-radius: 9px;
            font-size: 13px;
            font-weight: 700;
            cursor: pointer;
            border: 1px solid transparent;
            font-family: inherit;
        }

        .btn-cancel {
            background: var(--white);
            color: #625e73;
            border-color: #dedbe7;
        }

        .btn-cancel:hover {
            background: #f7f6fa;
        }

        .btn-submit {
            background: var(--primary);
            color: var(--white);
        }

        .btn-submit:hover {
            background: var(--primary-dark);
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
                padding: 25px 22px;
            }

            .topbar {
                padding: 0 22px;
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
                padding: 0 16px;
            }

            .content {
                padding: 22px 16px;
            }

            .page-heading h1 {
                font-size: 23px;
            }

            .form-card {
                padding: 20px;
            }

            .form-grid {
                grid-template-columns: 1fr;
                gap: 18px;
            }

            .form-group.full-width {
                grid-column: auto;
            }

            .workspace-badge {
                padding: 8px 10px;
                font-size: 11px;
            }
        }

        @media (max-width: 420px) {
            .form-actions {
                flex-direction: column-reverse;
            }

            .btn {
                width: 100%;
            }

            .breadcrumb {
                font-size: 11px;
            }
        }
    </style>
</head>

<body>

<aside class="sidebar">
    <div class="brand">
        <div class="logo">P</div>
        <div>
            <h2>PeopleFlow</h2>
            <small>CRM Management System</small>
        </div>
    </div>

    <div class="workspace">
        <a href="${pageContext.request.contextPath}/crm-dashboard">
            &#8592; Back to workspace
        </a>
        &#128188; CRM Management
    </div>

    <div class="menu-title">Platform</div>

    <a class="nav-link"
       href="${pageContext.request.contextPath}/crm-dashboard">
        <span class="nav-icon">&#9638;</span> Dashboard
    </a>

    <a class="nav-link active"
       href="${pageContext.request.contextPath}/customers">
        <span class="nav-icon">&#128101;</span> Customers
    </a>

    <a class="nav-link"
       href="${pageContext.request.contextPath}/leads">
        <span class="nav-icon">&#128200;</span> Leads
    </a>

    <a class="nav-link"
       href="${pageContext.request.contextPath}/follow-ups">
        <span class="nav-icon">&#128221;</span> Follow-ups
    </a>

    <div class="menu-title">HRM</div>

    <a class="nav-link"
       href="${pageContext.request.contextPath}/hrm-dashboard">
        <span class="nav-icon">&#9638;</span> HRM Dashboard
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

    <a class="nav-link"
       href="${pageContext.request.contextPath}/payroll">
        <span class="nav-icon">&#8377;</span> Payroll
    </a>

    <a class="nav-link"
       href="${pageContext.request.contextPath}/reports">
        <span class="nav-icon">&#128202;</span> Reports
    </a>
</aside>

<main class="main">

    <header class="topbar">
        <div class="breadcrumb">
            CRM &nbsp;/&nbsp; Customers &nbsp;/&nbsp;
            <strong>Edit Customer</strong>
        </div>

        <div class="workspace-badge">
            &#10022; CRM Workspace
        </div>
    </header>

    <section class="content">

        <div class="page-heading">
            <h1>Edit Customer</h1>
            <p>Update the customer's contact details and company information.</p>
        </div>

        <div class="form-card">

            <div class="form-header">
                <div class="form-icon">&#128100;</div>
                <div>
                    <h2>Customer Information</h2>
                    <p>Update the details below and save your changes.</p>
                </div>
            </div>

            <form action="${pageContext.request.contextPath}/customers/update/${customer.id}"
                  method="post">

                <div class="form-grid">

                    <div class="form-group">
                        <label for="customerName">
                            Customer Name <span class="required">*</span>
                        </label>
                        <input type="text"
                               id="customerName"
                               name="customerName"
                               value="<c:out value='${customer.customerName}'/>"
                               placeholder="Enter customer name"
                               required>
                    </div>

                    <div class="form-group">
                        <label for="email">
                            Email Address <span class="required">*</span>
                        </label>
                        <input type="email"
                               id="email"
                               name="email"
                               value="<c:out value='${customer.email}'/>"
                               placeholder="Enter email address"
                               required>
                    </div>

                    <div class="form-group">
                        <label for="phone">
                            Phone Number <span class="required">*</span>
                        </label>
                        <input type="text"
                               id="phone"
                               name="phone"
                               value="<c:out value='${customer.phone}'/>"
                               placeholder="Enter phone number"
                               required>
                    </div>

                    <div class="form-group">
                        <label for="company">Company</label>
                        <input type="text"
                               id="company"
                               name="company"
                               value="<c:out value='${customer.company}'/>"
                               placeholder="Enter company name">
                    </div>

                    <div class="form-group full-width">
                        <label for="address">Address</label>
                        <textarea id="address"
                                  name="address"
                                  rows="4"
                                  placeholder="Enter customer address"><c:out value="${customer.address}"/></textarea>
                    </div>

                </div>

                <div class="form-actions">
                    <a class="btn btn-cancel"
                       href="${pageContext.request.contextPath}/customers">
                        Cancel
                    </a>

                    <button class="btn btn-submit" type="submit">
                        &#10003; Update Customer
                    </button>
                </div>

            </form>
        </div>

    </section>
</main>

</body>
</html>
