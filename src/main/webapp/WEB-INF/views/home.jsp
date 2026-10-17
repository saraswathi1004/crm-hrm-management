
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>PeopleFlow | CRM & HRM Management</title>

    <link rel="stylesheet"
        href="${pageContext.request.contextPath}/css/modern-ui.css">

    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: "Segoe UI", Arial, sans-serif;
        }

        body {
            min-height: 100vh;
            color: #292545;
            background: #f7f6fc;
        }

        .navbar {
            height: 76px;
            padding: 0 7%;
            display: flex;
            justify-content: space-between;
            align-items: center;
            background: #ffffff;
            border-bottom: 1px solid #ece9f6;
        }

        .brand {
            display: flex;
            align-items: center;
            gap: 12px;
            font-size: 23px;
            font-weight: 750;
            color: #6741d9;
        }

        .brand-icon {
            width: 42px;
            height: 42px;
            display: grid;
            place-items: center;
            color: white;
            background: linear-gradient(135deg, #8060ee, #5933c5);
            border-radius: 13px;
            font-size: 21px;
        }

        .nav-links {
            display: flex;
            align-items: center;
            gap: 25px;
        }

        .nav-links a {
            text-decoration: none;
            color: #625e76;
            font-size: 14px;
            font-weight: 600;
        }

        .nav-links a:hover {
            color: #6741d9;
        }

        .nav-btn {
            padding: 11px 22px;
            color: white !important;
            background: #6c45d9;
            border-radius: 9px;
        }

        .hero {
            max-width: 1200px;
            margin: auto;
            padding: 85px 30px 65px;
            display: grid;
            grid-template-columns: 1.15fr 0.85fr;
            align-items: center;
            gap: 55px;
        }

        .tag {
            display: inline-block;
            padding: 9px 15px;
            color: #6741d9;
            background: #eee9ff;
            border-radius: 30px;
            font-size: 12px;
            font-weight: 700;
            letter-spacing: 0.5px;
        }

        .hero h1 {
            margin: 25px 0 18px;
            font-size: clamp(35px, 4.2vw, 54px);
            line-height: 1.18;
            letter-spacing: -1.5px;
        }

        .hero h1 span {
            color: #7049dd;
        }

        .hero p {
            max-width: 560px;
            color: #77738b;
            font-size: 16px;
            line-height: 1.9;
        }

        .hero-actions {
            display: flex;
            flex-wrap: wrap;
            gap: 14px;
            margin-top: 30px;
        }

        .btn {
            display: inline-block;
            padding: 14px 23px;
            border-radius: 10px;
            text-decoration: none;
            font-size: 14px;
            font-weight: 650;
            transition: 0.2s;
        }

        .btn-primary {
            color: white;
            background: #6c45d9;
            box-shadow: 0 7px 18px #6c45d926;
        }

        .btn-primary:hover {
            background: #5530bd;
            transform: translateY(-2px);
        }

        .btn-secondary {
            color: #6741d9;
            background: white;
            border: 1px solid #e4def7;
        }

        .hero-visual {
            padding: 24px;
            background: linear-gradient(145deg, #eee9ff, #f9f7ff);
            border-radius: 25px;
        }

        .preview {
            padding: 24px;
            background: white;
            border: 1px solid #f0edf8;
            border-radius: 19px;
            box-shadow: 0 15px 40px #39216d12;
        }

        .preview-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 23px;
        }

        .preview-header h3 {
            font-size: 17px;
        }

        .live {
            padding: 6px 10px;
            color: #198754;
            background: #e6f7ee;
            border-radius: 20px;
            font-size: 11px;
            font-weight: 700;
        }

        .preview-card {
            display: flex;
            align-items: center;
            gap: 14px;
            padding: 17px 14px;
            margin-bottom: 13px;
            background: #faf9fe;
            border: 1px solid #f0edf8;
            border-radius: 13px;
        }

        .preview-icon {
            width: 46px;
            height: 46px;
            display: grid;
            place-items: center;
            flex-shrink: 0;
            border-radius: 13px;
            font-size: 22px;
        }

        .icon-purple {
            background: #eee8ff;
        }

        .icon-blue {
            background: #e7f1ff;
        }

        .icon-pink {
            background: #ffe9f1;
        }

        .preview-card h4 {
            margin-bottom: 5px;
            font-size: 14px;
        }

        .preview-card p {
            font-size: 12px;
            line-height: 1.6;
        }

        .section {
            padding: 55px 7% 75px;
            background: white;
        }

        .section-heading {
            margin-bottom: 35px;
            text-align: center;
        }

        .section-heading h2 {
            margin-bottom: 12px;
            font-size: 30px;
        }

        .section-heading p {
            color: #858097;
            font-size: 14px;
            line-height: 1.7;
        }

        .modules {
            max-width: 1100px;
            margin: auto;
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            gap: 23px;
        }

        .module {
            padding: 27px;
            background: #ffffff;
            border: 1px solid #ebe7f5;
            border-radius: 17px;
            transition: 0.25s;
        }

        .module:hover {
            border-color: #c7b8f5;
            box-shadow: 0 12px 30px #4e2a9810;
            transform: translateY(-4px);
        }

        .module .preview-icon {
            margin-bottom: 20px;
        }

        .module h3 {
            margin-bottom: 11px;
            font-size: 19px;
        }

        .module p {
            min-height: 65px;
            margin-bottom: 20px;
            color: #858097;
            font-size: 13px;
            line-height: 1.8;
        }

        .module a {
            color: #6741d9;
            font-size: 13px;
            font-weight: 700;
            text-decoration: none;
        }

        footer {
            padding: 24px;
            color: #858097;
            background: #f7f6fc;
            text-align: center;
            font-size: 12px;
        }

        @media (max-width: 850px) {
            .hero {
                grid-template-columns: 1fr;
                padding-top: 55px;
            }

            .hero-visual {
                max-width: 600px;
                width: 100%;
                margin: auto;
            }

            .modules {
                grid-template-columns: 1fr 1fr;
            }
        }

        @media (max-width: 560px) {
            .navbar {
                height: auto;
                min-height: 70px;
                padding: 15px 5%;
            }

            .brand {
                font-size: 19px;
            }

            .nav-links {
                gap: 12px;
            }

            .nav-links a:not(.nav-btn) {
                display: none;
            }

            .hero {
                padding: 45px 20px;
                gap: 35px;
            }

            .hero h1 {
                font-size: 36px;
            }

            .hero-visual {
                padding: 12px;
            }

            .preview {
                padding: 16px;
            }

            .modules {
                grid-template-columns: 1fr;
            }

            .section {
                padding: 45px 20px;
            }
        }
    </style>
</head>

<body>

    <nav class="navbar">
        <div class="brand">
            <div class="brand-icon">P</div>
            PeopleFlow
        </div>

        <div class="nav-links">
            <a href="#home">Home</a>
            <a href="#modules">Modules</a>
            <a href="${pageContext.request.contextPath}/login"
               class="nav-btn">Sign In</a>
        </div>
    </nav>

    <main>
        <section class="hero" id="home">

            <div class="hero-content">
                <span class="tag">CRM & HRM MANAGEMENT PLATFORM</span>

                <h1>
                    Manage Your People.<br>
                    <span>Grow Your Business.</span>
                </h1>

                <p>
                    A centralized management platform to organize employees,
                    track attendance, manage payroll, maintain customer
                    relationships and streamline your daily business operations.
                </p>

                <div class="hero-actions">
                    <a href="${pageContext.request.contextPath}/login"
                       class="btn btn-primary">
                        Get Started &rarr;
                    </a>

                    <a href="#modules" class="btn btn-secondary">
                        Explore Modules
                    </a>
                </div>
            </div>

            <div class="hero-visual">
                <div class="preview">
                    <div class="preview-header">
                        <h3>Management Workspace</h3>
                        <span class="live">● Organized</span>
                    </div>

                    <div class="preview-card">
                        <div class="preview-icon icon-purple">👥</div>
                        <div>
                            <h4>Employee Management</h4>
                            <p>Employee records and department details</p>
                        </div>
                    </div>

                    <div class="preview-card">
                        <div class="preview-icon icon-blue">📅</div>
                        <div>
                            <h4>Attendance & Leave</h4>
                            <p>Daily attendance and leave requests</p>
                        </div>
                    </div>

                    <div class="preview-card">
                        <div class="preview-icon icon-pink">🤝</div>
                        <div>
                            <h4>Customer Relationships</h4>
                            <p>Customers, leads and follow-ups</p>
                        </div>
                    </div>
                </div>
            </div>

        </section>

        <section class="section" id="modules">
            <div class="section-heading">
                <h2>Everything in One Place</h2>
                <p>
                    Manage your workforce and customer relationships
                    through one organized platform.
                </p>
            </div>

            <div class="modules">

                <div class="module">
                    <div class="preview-icon icon-purple">👨‍💼</div>
                    <h3>HR Management</h3>
                    <p>
                        Organize employee information, attendance,
                        leave records and payroll details.
                    </p>
                    <a href="${pageContext.request.contextPath}/login">
                        Explore HRM &rarr;
                    </a>
                </div>

                <div class="module">
                    <div class="preview-icon icon-blue">🤝</div>
                    <h3>CRM Management</h3>
                    <p>
                        Maintain customer information, manage sales leads
                        and track follow-up activities.
                    </p>
                    <a href="${pageContext.request.contextPath}/login">
                        Explore CRM &rarr;
                    </a>
                </div>

                <div class="module">
                    <div class="preview-icon icon-pink">📊</div>
                    <h3>Reports & Insights</h3>
                    <p>
                        Access organized management information and
                        monitor business activities.
                    </p>
                    <a href="${pageContext.request.contextPath}/login">
                        View Platform &rarr;
                    </a>
                </div>

            </div>
        </section>
    </main>

    <footer>
        &copy; 2026 PeopleFlow | CRM & HRM Management System
    </footer>

</body>
</html>
