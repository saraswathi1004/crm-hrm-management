
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>HRM Dashboard | PeopleFlow</title>

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

        /* Sidebar */

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

        /* Main */

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

        /* Welcome */

        .welcome-banner {
            display: flex;
            justify-content: space-between;
            align-items: center;
            gap: 20px;
            padding: 30px;
            margin-bottom: 28px;
            background: linear-gradient(115deg, #9333ea, #a855f7 60%, #c084fc);
            color: white;
            border-radius: 17px;
            overflow: hidden;
            position: relative;
        }

        .welcome-banner::after {
            content: "";
            position: absolute;
            width: 190px;
            height: 190px;
            border-radius: 50%;
            right: 100px;
            top: -100px;
            background: rgba(255, 255, 255, 0.08);
        }

        .welcome-text {
            position: relative;
            z-index: 1;
        }

        .welcome-label {
            display: inline-block;
            padding: 7px 11px;
            margin-bottom: 14px;
            border-radius: 20px;
            background: rgba(255, 255, 255, 0.17);
            font-size: 11px;
            font-weight: 650;
        }

        .welcome-banner h1 {
            font-size: 27px;
            margin-bottom: 10px;
        }

        .welcome-banner p {
            max-width: 540px;
            color: #f5eaff;
            font-size: 13px;
            line-height: 1.8;
        }

        .welcome-symbol {
            width: 100px;
            height: 100px;
            flex-shrink: 0;
            display: grid;
            place-items: center;
            position: relative;
            z-index: 1;
            border-radius: 25px;
            background: rgba(255, 255, 255, 0.15);
            border: 1px solid rgba(255, 255, 255, 0.25);
            font-size: 48px;
        }

        /* Section heading */

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

        .section-tag {
            color: var(--primary-dark);
            background: var(--primary-light);
            padding: 8px 12px;
            border-radius: 20px;
            font-size: 11px;
            font-weight: 650;
            white-space: nowrap;
        }

        /* Module cards */

        .cards {
            display: grid;
            grid-template-columns: repeat(4, minmax(0, 1fr));
            gap: 17px;
        }

        .card {
            display: block;
            min-width: 0;
            padding: 22px;
            background: white;
            border: 1px solid var(--border);
            border-radius: 15px;
            box-shadow: 0 4px 15px rgba(40, 20, 70, 0.025);
            transition: 0.2s;
        }

        .card:hover {
            transform: translateY(-4px);
            border-color: #d8c5ff;
            box-shadow: 0 10px 25px rgba(80, 40, 140, 0.08);
        }

        .card-top {
            display: flex;
            justify-content: space-between;
            align-items: center;
            gap: 8px;
            margin-bottom: 23px;
        }

        .card-label {
            color: var(--muted);
            font-size: 12px;
        }

        .card-icon {
            width: 45px;
            height: 45px;
            flex-shrink: 0;
            display: grid;
            place-items: center;
            border-radius: 13px;
            font-size: 22px;
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

        .pink {
            background: #ffeaf2;
            color: #c02667;
        }

        .blue {
            background: #eaf3ff;
            color: #2563eb;
        }

        .card h3 {
            font-size: 19px;
            margin-bottom: 9px;
        }

        .card p {
            min-height: 38px;
            color: var(--muted);
            font-size: 12px;
            line-height: 1.7;
        }

        .card-link {
            display: flex;
            align-items: center;
            justify-content: space-between;
            margin-top: 17px;
            padding-top: 14px;
            border-top: 1px solid #f0edf5;
            color: var(--primary-dark);
            font-size: 12px;
            font-weight: 700;
        }

        .card-link span:last-child {
            font-size: 18px;
        }

        /* Quick actions */

        .quick-links {
            display: grid;
            grid-template-columns: repeat(2, minmax(0, 1fr));
            gap: 15px;
        }

        .quick-link {
            display: flex;
            align-items: center;
            gap: 15px;
            min-width: 0;
            padding: 19px;
            background: white;
            border: 1px solid var(--border);
            border-radius: 13px;
            transition: 0.2s;
        }

        .quick-link:hover {
            border-color: #d8c5ff;
            background: #fdfaff;
            transform: translateY(-2px);
        }

        .quick-icon {
            width: 45px;
            height: 45px;
            flex-shrink: 0;
            display: grid;
            place-items: center;
            border-radius: 12px;
            background: var(--primary-light);
            color: var(--primary-dark);
            font-size: 22px;
        }

        .quick-text {
            min-width: 0;
        }

        .quick-link h4 {
            font-size: 13px;
            margin-bottom: 6px;
        }

        .quick-link p {
            color: var(--muted);
            font-size: 11px;
            line-height: 1.6;
        }

        .arrow {
            margin-left: auto;
            color: #aaa5bb;
            font-size: 22px;
        }

        /* Information panel */

        .info-panel {
            display: flex;
            align-items: flex-start;
            gap: 15px;
            margin-top: 25px;
            padding: 23px;
            background: white;
            border: 1px solid var(--border);
            border-radius: 14px;
        }

        .info-icon {
            width: 42px;
            height: 42px;
            flex-shrink: 0;
            display: grid;
            place-items: center;
            background: var(--primary-light);
            color: var(--primary-dark);
            border-radius: 12px;
            font-size: 20px;
        }

        .info-panel h3 {
            font-size: 15px;
            margin-bottom: 8px;
        }

        .info-panel p {
            color: var(--muted);
            font-size: 12px;
            line-height: 1.8;
        }

        .footer {
            text-align: center;
            padding: 25px 10px 10px;
            color: #aaa6ba;
            font-size: 11px;
        }

        /* Responsive */

        @media (max-width: 1250px) {
            .cards {
                grid-template-columns: repeat(2, minmax(0, 1fr));
            }

            .content {
                padding: 25px 22px;
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

            .welcome-banner {
                padding: 24px;
            }

            .welcome-banner h1 {
                font-size: 23px;
            }

            .welcome-symbol {
                width: 75px;
                height: 75px;
                font-size: 35px;
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

            .welcome-banner {
                padding: 23px;
            }

            .welcome-symbol {
                display: none;
            }

            .quick-links {
                grid-template-columns: 1fr;
            }

            .role-badge {
                display: none;
            }
        }

        @media (max-width: 420px) {
            .cards {
                grid-template-columns: 1fr;
            }

            .topbar h1 {
                font-size: 17px;
            }

            .topbar p {
                font-size: 11px;
            }

            .welcome-banner h1 {
                font-size: 22px;
            }

            .section-heading {
                align-items: flex-start;
                flex-direction: column;
            }

            .card {
                padding: 19px;
            }

            .quick-link {
                padding: 15px;
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

            <a class="nav-link active"
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

            <a class="nav-link"
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

            <div>
                <div class="breadcrumb">
                    PeopleFlow &nbsp; &#8250; &nbsp;
                    <strong>HRM Dashboard</strong>
                </div>
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

            <!-- WELCOME BANNER -->
            <div class="welcome-banner">

                <div class="welcome-text">

                    <span class="welcome-label">
                        &#10022; PEOPLEFLOW HRM
                    </span>

                    <h1>Welcome to HR Management!</h1>

                    <p>
                        Manage employee records, attendance, leave requests
                        and payroll from one place. Your HR workspace is
                        ready to help you organize everyday HR activities.
                    </p>

                </div>

                <div class="welcome-symbol">
                    &#128188;
                </div>

            </div>

            <!-- MODULE CARDS -->
            <section>

                <div class="section-heading">
                    <div>
                        <h2>HR Management Modules</h2>
                        <p>Access and manage your HR activities.</p>
                    </div>

                    <span class="section-tag">
                        4 HR Modules
                    </span>
                </div>

                <div class="cards">

                    <!-- Employees -->
                    <a class="card"
                       href="${pageContext.request.contextPath}/employees">

                        <div class="card-top">
                            <span class="card-label">
                                Employee Records
                            </span>

                            <span class="card-icon purple">
                                &#128100;
                            </span>
                        </div>

                        <h3>Employees</h3>

                        <p>
                            Add, view, update and manage employee information.
                        </p>

                        <div class="card-link">
                            <span>Manage employees</span>
                            <span>&#8594;</span>
                        </div>

                    </a>

                    <!-- Attendance -->
                    <a class="card"
                       href="${pageContext.request.contextPath}/attendance">

                        <div class="card-top">
                            <span class="card-label">
                                Daily Records
                            </span>

                            <span class="card-icon green">
                                &#128203;
                            </span>
                        </div>

                        <h3>Attendance</h3>

                        <p>
                            Record and review employee attendance details.
                        </p>

                        <div class="card-link">
                            <span>Manage attendance</span>
                            <span>&#8594;</span>
                        </div>

                    </a>

                    <!-- Leave Management -->
                    <a class="card"
                       href="${pageContext.request.contextPath}/leaves">

                        <div class="card-top">
                            <span class="card-label">
                                Leave Requests
                            </span>

                            <span class="card-icon orange">
                                &#128197;
                            </span>
                        </div>

                        <h3>Leave Management</h3>

                        <p>
                            Manage employee leave records and requests.
                        </p>

                        <div class="card-link">
                            <span>Manage leaves</span>
                            <span>&#8594;</span>
                        </div>

                    </a>

                    <!-- Payroll -->
                    <a class="card"
                       href="${pageContext.request.contextPath}/payroll">

                        <div class="card-top">
                            <span class="card-label">
                                Salary Records
                            </span>

                            <span class="card-icon pink">
                                &#8377;
                            </span>
                        </div>

                        <h3>Payroll</h3>

                        <p>
                            View and manage salary and payroll information.
                        </p>

                        <div class="card-link">
                            <span>Manage payroll</span>
                            <span>&#8594;</span>
                        </div>

                    </a>

                </div>

            </section>

            <!-- QUICK ACTIONS -->
            <section>

                <div class="section-heading">
                    <div>
                        <h2>Quick Actions</h2>
                        <p>Navigate directly to frequently used pages.</p>
                    </div>
                </div>

                <div class="quick-links">

                    <a class="quick-link"
                       href="${pageContext.request.contextPath}/employees">

                        <span class="quick-icon">&#43;</span>

                        <div class="quick-text">
                            <h4>Employee Management</h4>
                            <p>
                                Open employee records and manage staff details.
                            </p>
                        </div>

                        <span class="arrow">&#8250;</span>

                    </a>

                    <a class="quick-link"
                       href="${pageContext.request.contextPath}/attendance">

                        <span class="quick-icon">&#128203;</span>

                        <div class="quick-text">
                            <h4>Attendance Management</h4>
                            <p>
                                Open attendance records and status details.
                            </p>
                        </div>

                        <span class="arrow">&#8250;</span>

                    </a>

                    <a class="quick-link"
                       href="${pageContext.request.contextPath}/leaves">

                        <span class="quick-icon">&#128197;</span>

                        <div class="quick-text">
                            <h4>Leave Management</h4>
                            <p>
                                View and manage employee leave information.
                            </p>
                        </div>

                        <span class="arrow">&#8250;</span>

                    </a>

                    <a class="quick-link"
                       href="${pageContext.request.contextPath}/payroll">

                        <span class="quick-icon">&#8377;</span>

                        <div class="quick-text">
                            <h4>Payroll Management</h4>
                            <p>
                                Open salary and payroll records.
                            </p>
                        </div>

                        <span class="arrow">&#8250;</span>

                    </a>

                    <a class="quick-link"
                       href="${pageContext.request.contextPath}/reports">

                        <span class="quick-icon">&#128202;</span>

                        <div class="quick-text">
                            <h4>HR Reports</h4>
                            <p>
                                Access the HR reports module.
                            </p>
                        </div>

                        <span class="arrow">&#8250;</span>

                    </a>

                    <a class="quick-link"
                       href="${pageContext.request.contextPath}/crm-dashboard">

                        <span class="quick-icon">&#128188;</span>

                        <div class="quick-text">
                            <h4>CRM Workspace</h4>
                            <p>
                                Navigate to the CRM management dashboard.
                            </p>
                        </div>

                        <span class="arrow">&#8250;</span>

                    </a>

                </div>

            </section>

            <!-- INFORMATION PANEL -->
            <section class="info-panel">

                <div class="info-icon">
                    &#10003;
                </div>

                <div>
                    <h3>Your HR Workspace</h3>

                    <p>
                        PeopleFlow brings your HR management pages together
                        in one workspace. Use the sidebar, module cards or
                        quick actions to navigate between employees,
                        attendance, leave management, payroll and reports.
                    </p>
                </div>

            </section>

            <!-- FOOTER -->
            <footer class="footer">
                &copy; PeopleFlow | HR Management System
            </footer>

        </section>

    </main>

</div>

</body>
</html>
