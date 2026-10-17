
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>PeopleFlow | Reports</title>

<style>
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

* {
    box-sizing: border-box;
}

body {
    margin: 0;
    font-family: Arial, Helvetica, sans-serif;
    background: var(--bg);
    color: var(--text);
}

a {
    text-decoration: none;
    color: inherit;
}

.layout {
    min-height: 100vh;
}

/* SIDEBAR */
.sidebar {
    position: fixed;
    top: 0;
    left: 0;
    width: 250px;
    height: 100vh;
    background: var(--white);
    border-right: 1px solid var(--border);
    padding: 25px 18px;
    display: flex;
    flex-direction: column;
    z-index: 10;
    overflow-y: auto;
}

.brand {
    display: flex;
    align-items: center;
    gap: 11px;
    padding: 0 8px;
    margin-bottom: 30px;
}

.brand-icon {
    width: 42px;
    height: 42px;
    background: var(--primary);
    color: white;
    border-radius: 13px;
    display: flex;
    justify-content: center;
    align-items: center;
    font-size: 23px;
    font-weight: bold;
}

.brand-name {
    font-size: 21px;
    font-weight: bold;
    letter-spacing: -0.5px;
}

.brand-name span {
    color: var(--primary);
}

.workspace-link {
    color: var(--muted);
    font-size: 13px;
    padding: 11px 10px;
    display: block;
    margin-bottom: 23px;
}

.nav-label {
    font-size: 10px;
    color: var(--muted);
    font-weight: bold;
    letter-spacing: 1.3px;
    padding: 0 12px;
    margin: 14px 0 10px;
}

.nav-link {
    display: flex;
    align-items: center;
    gap: 12px;
    padding: 12px;
    margin-bottom: 5px;
    border-radius: 10px;
    color: #716c83;
    font-size: 14px;
    transition: 0.2s;
}

.nav-link:hover {
    background: #faf5ff;
    color: var(--primary-dark);
}

.nav-link.active {
    color: var(--primary-dark);
    background: var(--primary-light);
    font-weight: bold;
}

.nav-icon {
    width: 22px;
    text-align: center;
    font-size: 17px;
}

.sidebar-info {
    margin-top: auto;
    background: #faf5ff;
    border: 1px solid #f0e1ff;
    border-radius: 12px;
    padding: 15px;
}

.sidebar-info strong {
    display: block;
    font-size: 13px;
    margin-bottom: 7px;
}

.sidebar-info p {
    margin: 0;
    color: var(--muted);
    font-size: 12px;
    line-height: 1.6;
}

/* MAIN */
.main {
    margin-left: 250px;
    min-height: 100vh;
}

.topbar {
    height: 76px;
    background: var(--white);
    border-bottom: 1px solid var(--border);
    display: flex;
    align-items: center;
    justify-content: space-between;
    padding: 0 32px;
}

.breadcrumb {
    font-size: 14px;
    color: var(--muted);
}

.breadcrumb strong {
    color: var(--text);
}

.topbar-right {
    display: flex;
    align-items: center;
    gap: 16px;
}

.workspace-badge {
    padding: 8px 12px;
    border-radius: 8px;
    background: var(--primary-light);
    color: var(--primary-dark);
    font-size: 11px;
    font-weight: bold;
    letter-spacing: 0.5px;
}

.logout {
    border: 1px solid var(--border);
    padding: 9px 15px;
    border-radius: 8px;
    font-size: 13px;
    background: white;
}

.logout:hover {
    color: var(--primary-dark);
    border-color: var(--primary);
}

.content {
    max-width: 1550px;
    margin: auto;
    padding: 30px;
}

.page-heading {
    margin-bottom: 25px;
}

.page-heading h1 {
    margin: 0 0 9px;
    font-size: 27px;
    letter-spacing: -0.7px;
}

.page-heading p {
    margin: 0;
    color: var(--muted);
    font-size: 14px;
    line-height: 1.6;
}

/* WELCOME BANNER */
.welcome-banner {
    background: linear-gradient(115deg, #9333ea, #c084fc);
    border-radius: 17px;
    padding: 28px 30px;
    color: white;
    margin-bottom: 30px;
}

.welcome-banner h2 {
    margin: 0 0 10px;
    font-size: 23px;
}

.welcome-banner p {
    margin: 0;
    max-width: 650px;
    font-size: 14px;
    line-height: 1.7;
    color: #faf5ff;
}

/* REPORT CARDS */
.section-heading {
    display: flex;
    justify-content: space-between;
    align-items: center;
    gap: 15px;
    flex-wrap: wrap;
    margin: 30px 0 17px;
}

.section-heading h2 {
    margin: 0;
    font-size: 19px;
}

.section-heading p {
    margin: 6px 0 0;
    font-size: 13px;
    color: var(--muted);
}

.cards {
    display: grid;
    grid-template-columns: repeat(3, minmax(0, 1fr));
    gap: 18px;
}

.card {
    background: var(--white);
    border: 1px solid var(--border);
    border-radius: 14px;
    padding: 22px;
    min-width: 0;
    transition: 0.2s;
}

.card:hover {
    border-color: #d8b4fe;
    transform: translateY(-2px);
}

.card-top {
    display: flex;
    align-items: center;
    justify-content: space-between;
    gap: 10px;
    margin-bottom: 18px;
}

.card-icon {
    width: 43px;
    height: 43px;
    border-radius: 12px;
    background: var(--primary-light);
    display: flex;
    align-items: center;
    justify-content: center;
    font-size: 21px;
}

.card-label {
    font-size: 13px;
    color: var(--muted);
    margin: 0 0 10px;
}

.card-count {
    font-size: 30px;
    font-weight: bold;
    letter-spacing: -0.7px;
    margin: 0;
}

.card-description {
    font-size: 12px;
    color: var(--muted);
    margin: 10px 0 0;
    line-height: 1.5;
}

/* QUICK LINKS */
.quick-links {
    display: grid;
    grid-template-columns: repeat(3, minmax(0, 1fr));
    gap: 16px;
}

.quick-link {
    display: flex;
    align-items: center;
    justify-content: space-between;
    gap: 12px;
    padding: 18px;
    background: white;
    border: 1px solid var(--border);
    border-radius: 12px;
    transition: 0.2s;
}

.quick-link:hover {
    border-color: var(--primary);
    background: #fdfaff;
}

.quick-link strong {
    display: block;
    font-size: 14px;
    margin-bottom: 6px;
}

.quick-link small {
    display: block;
    font-size: 12px;
    color: var(--muted);
    line-height: 1.5;
}

.arrow {
    color: var(--primary-dark);
    font-size: 20px;
}

/* EXISTING CRM SUMMARY */
.table-card {
    background: white;
    border: 1px solid var(--border);
    border-radius: 14px;
    overflow: hidden;
    margin-top: 20px;
}

.table-title {
    padding: 21px 22px;
    border-bottom: 1px solid var(--border);
}

.table-title h3 {
    margin: 0 0 7px;
    font-size: 17px;
}

.table-title p {
    margin: 0;
    color: var(--muted);
    font-size: 13px;
}

.table-wrap {
    overflow-x: auto;
}

table {
    width: 100%;
    border-collapse: collapse;
    min-width: 550px;
}

th, td {
    padding: 16px 22px;
    text-align: left;
    border-bottom: 1px solid var(--border);
    font-size: 13px;
}

th {
    background: #fcfbfe;
    color: var(--muted);
    font-size: 11px;
    text-transform: uppercase;
    letter-spacing: 0.5px;
}

td {
    color: var(--text);
}

tr:last-child td {
    border-bottom: none;
}

.status-note {
    display: inline-block;
    background: var(--primary-light);
    color: var(--primary-dark);
    padding: 6px 10px;
    border-radius: 7px;
    font-size: 11px;
    font-weight: bold;
}

.footer-note {
    color: var(--muted);
    font-size: 12px;
    text-align: center;
    padding: 25px 0 5px;
}

/* RESPONSIVE */
@media (max-width: 1100px) {
    .cards {
        grid-template-columns: repeat(2, minmax(0, 1fr));
    }

    .quick-links {
        grid-template-columns: repeat(2, minmax(0, 1fr));
    }
}

@media (max-width: 760px) {
    .sidebar {
        position: relative;
        width: 100%;
        height: auto;
        padding: 15px;
    }

    .brand {
        margin-bottom: 10px;
    }

    .workspace-link,
    .nav-label,
    .sidebar-info {
        display: none;
    }

    .sidebar nav {
        display: flex;
        gap: 7px;
        overflow-x: auto;
        padding-bottom: 5px;
    }

    .nav-link {
        flex-shrink: 0;
        margin: 0;
        padding: 10px;
    }

    .main {
        margin-left: 0;
    }

    .topbar {
        height: auto;
        min-height: 65px;
        padding: 15px 18px;
        gap: 12px;
        flex-wrap: wrap;
    }

    .topbar-right {
        gap: 8px;
    }

    .workspace-badge {
        display: none;
    }

    .content {
        padding: 22px 16px;
    }

    .page-heading h1 {
        font-size: 24px;
    }

    .cards,
    .quick-links {
        grid-template-columns: 1fr;
    }

    .welcome-banner {
        padding: 23px;
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
            <div class="brand-name">People<span>Flow</span></div>
        </div>

        <a class="workspace-link"
           href="${pageContext.request.contextPath}/crm-dashboard">
            &#8592; Back to Workspace
        </a>

        <div class="nav-label">WORKSPACE</div>

        <nav>
            <a class="nav-link"
               href="${pageContext.request.contextPath}/hrm-dashboard">
                <span class="nav-icon">&#9632;</span> HRM Dashboard
            </a>

            <a class="nav-link"
               href="${pageContext.request.contextPath}/employees">
                <span class="nav-icon">&#9786;</span> Employees
            </a>

            <a class="nav-link"
               href="${pageContext.request.contextPath}/attendance">
                <span class="nav-icon">&#10003;</span> Attendance
            </a>

            <a class="nav-link"
               href="${pageContext.request.contextPath}/leaves">
                <span class="nav-icon">&#128197;</span> Leave Management
            </a>

            <a class="nav-link"
               href="${pageContext.request.contextPath}/payroll">
                <span class="nav-icon">&#8377;</span> Payroll
            </a>

            <a class="nav-link active"
               href="${pageContext.request.contextPath}/reports">
                <span class="nav-icon">&#128202;</span> Reports
            </a>

            <div class="nav-label">CRM MANAGEMENT</div>

            <a class="nav-link"
               href="${pageContext.request.contextPath}/crm-dashboard">
                <span class="nav-icon">&#9635;</span> CRM Dashboard
            </a>

            <a class="nav-link"
               href="${pageContext.request.contextPath}/customers">
                <span class="nav-icon">&#128101;</span> Customers
            </a>

            <a class="nav-link"
               href="${pageContext.request.contextPath}/leads">
                <span class="nav-icon">&#9733;</span> Leads
            </a>
        </nav>

        <div class="sidebar-info">
            <strong>PeopleFlow Reports</strong>
            <p>Access your CRM and HRM reporting overview from one place.</p>
        </div>
    </aside>

    <!-- MAIN CONTENT -->
    <main class="main">

        <header class="topbar">
            <div class="breadcrumb">
                PeopleFlow / <strong>Reports</strong>
            </div>

            <div class="topbar-right">
                <span class="workspace-badge">CRM + HR WORKSPACE</span>
                <a class="logout"
                   href="${pageContext.request.contextPath}/login">
                    Logout
                </a>
            </div>
        </header>

        <div class="content">

            <section class="page-heading">
                <h1>Reports Overview</h1>
                <p>View your CRM and HRM records from one central workspace.</p>
            </section>

            <section class="welcome-banner">
                <h2>Your business overview, all in one place</h2>
                <p>
                    Review customer relationships, leads, follow-ups and
                    employee-related management areas using the PeopleFlow
                    reporting workspace.
                </p>
            </section>

            <!-- CRM REPORTS -->
            <section>
                <div class="section-heading">
                    <div>
                        <h2>CRM Reports</h2>
                        <p>Summary of your current CRM records.</p>
                    </div>
                </div>

                <div class="cards">

                    <div class="card">
                        <div class="card-top">
                            <div class="card-icon">&#128101;</div>
                            <span class="status-note">CRM</span>
                        </div>
                        <p class="card-label">Total Customers</p>
                        <p class="card-count">${customerCount}</p>
                        <p class="card-description">
                            Customers registered in your CRM system.
                        </p>
                    </div>

                    <div class="card">
                        <div class="card-top">
                            <div class="card-icon">&#9733;</div>
                            <span class="status-note">CRM</span>
                        </div>
                        <p class="card-label">Total Leads</p>
                        <p class="card-count">${leadCount}</p>
                        <p class="card-description">
                            Leads recorded in your sales pipeline.
                        </p>
                    </div>

                    <div class="card">
                        <div class="card-top">
                            <div class="card-icon">&#128337;</div>
                            <span class="status-note">CRM</span>
                        </div>
                        <p class="card-label">Total Follow-ups</p>
                        <p class="card-count">${followUpCount}</p>
                        <p class="card-description">
                            Follow-up records currently available.
                        </p>
                    </div>

                </div>
            </section>

            <!-- HRM REPORTS -->
            <section>
                <div class="section-heading">
                    <div>
                        <h2>HRM Reports</h2>
                        <p>Quick access to employee and HR management reports.</p>
                    </div>
                </div>

                <div class="quick-links">

                    <a class="quick-link"
                       href="${pageContext.request.contextPath}/employees">
                        <div>
                            <strong>Employee Reports</strong>
                            <small>View and manage employee records.</small>
                        </div>
                        <span class="arrow">&#8594;</span>
                    </a>

                    <a class="quick-link"
                       href="${pageContext.request.contextPath}/attendance">
                        <div>
                            <strong>Attendance Reports</strong>
                            <small>Open employee attendance records.</small>
                        </div>
                        <span class="arrow">&#8594;</span>
                    </a>

                    <a class="quick-link"
                       href="${pageContext.request.contextPath}/leaves">
                        <div>
                            <strong>Leave Reports</strong>
                            <small>Review leave management records.</small>
                        </div>
                        <span class="arrow">&#8594;</span>
                    </a>

                    <a class="quick-link"
                       href="${pageContext.request.contextPath}/payroll">
                        <div>
                            <strong>Payroll Reports</strong>
                            <small>Open salary and payment records.</small>
                        </div>
                        <span class="arrow">&#8594;</span>
                    </a>

                    <a class="quick-link"
                       href="${pageContext.request.contextPath}/customers">
                        <div>
                            <strong>Customer Reports</strong>
                            <small>Open customer management records.</small>
                        </div>
                        <span class="arrow">&#8594;</span>
                    </a>

                    <a class="quick-link"
                       href="${pageContext.request.contextPath}/leads">
                        <div>
                            <strong>Lead Reports</strong>
                            <small>Open lead management records.</small>
                        </div>
                        <span class="arrow">&#8594;</span>
                    </a>

                </div>
            </section>

            <!-- EXISTING CRM OVERVIEW -->
            <section class="table-card">
                <div class="table-title">
                    <h3>CRM Summary</h3>
                    <p>Current totals supplied by your existing controller.</p>
                </div>

                <div class="table-wrap">
                    <table>
                        <thead>
                            <tr>
                                <th>Report Name</th>
                                <th>Available Records</th>
                                <th>Module</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>Total Customers</td>
                                <td>${customerCount}</td>
                                <td><span class="status-note">CRM</span></td>
                            </tr>
                            <tr>
                                <td>Total Leads</td>
                                <td>${leadCount}</td>
                                <td><span class="status-note">CRM</span></td>
                            </tr>
                            <tr>
                                <td>Total Follow-ups</td>
                                <td>${followUpCount}</td>
                                <td><span class="status-note">CRM</span></td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </section>

            <div class="footer-note">
                PeopleFlow Management System &copy; 2026
            </div>

        </div>
    </main>
</div>
</body>
</html>
