
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>PeopleFlow | CRM Dashboard</title>

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

/* SIDEBAR */
.sidebar {
    position: fixed;
    top: 0;
    left: 0;
    width: 250px;
    height: 100vh;
    padding: 25px 18px;
    background: var(--white);
    border-right: 1px solid var(--border);
    display: flex;
    flex-direction: column;
    overflow-y: auto;
    z-index: 10;
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
    border-radius: 13px;
    background: var(--primary);
    color: white;
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
    display: block;
    padding: 11px 10px;
    margin-bottom: 23px;
    font-size: 13px;
    color: var(--muted);
}

.nav-label {
    padding: 0 12px;
    margin: 14px 0 10px;
    color: var(--muted);
    font-size: 10px;
    font-weight: bold;
    letter-spacing: 1.3px;
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
    background: #f0fdfa;
    color: var(--primary-dark);
}

.nav-link.active {
    background: var(--primary-light);
    color: var(--primary-dark);
    font-weight: bold;
}

.nav-icon {
    width: 22px;
    text-align: center;
    font-size: 17px;
}

.sidebar-info {
    margin-top: auto;
    padding: 15px;
    background: #f0fdfa;
    border: 1px solid #ccfbf1;
    border-radius: 12px;
}

.sidebar-info strong {
    display: block;
    margin-bottom: 7px;
    font-size: 13px;
}

.sidebar-info p {
    margin: 0;
    color: var(--muted);
    font-size: 12px;
    line-height: 1.6;
}

/* MAIN CONTENT */
.main {
    min-height: 100vh;
    margin-left: 250px;
}

.topbar {
    height: 76px;
    padding: 0 32px;
    background: var(--white);
    border-bottom: 1px solid var(--border);
    display: flex;
    align-items: center;
    justify-content: space-between;
    gap: 15px;
}

.breadcrumb {
    color: var(--muted);
    font-size: 14px;
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
    background: var(--primary-light);
    color: var(--primary-dark);
    border-radius: 8px;
    font-size: 11px;
    font-weight: bold;
    letter-spacing: 0.5px;
}

.logout {
    padding: 9px 15px;
    border: 1px solid var(--border);
    border-radius: 8px;
    background: white;
    font-size: 13px;
    transition: 0.2s;
}

.logout:hover {
    color: var(--primary-dark);
    border-color: var(--primary);
}

/* PAGE */
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
    margin-bottom: 30px;
    padding: 30px;
    border-radius: 17px;
    color: white;
    background: linear-gradient(115deg, #0f766e, #14b8a6);
}

.welcome-banner h2 {
    margin: 0 0 10px;
    font-size: 24px;
}

.welcome-banner p {
    max-width: 650px;
    margin: 0;
    color: #f0fdfa;
    font-size: 14px;
    line-height: 1.7;
}

.banner-label {
    display: inline-block;
    margin-bottom: 13px;
    padding: 6px 10px;
    border: 1px solid rgba(255,255,255,0.35);
    border-radius: 7px;
    font-size: 10px;
    font-weight: bold;
    letter-spacing: 1px;
}

/* CARDS */
.section-heading {
    display: flex;
    align-items: center;
    justify-content: space-between;
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
    color: var(--muted);
    font-size: 13px;
}

.cards {
    display: grid;
    grid-template-columns: repeat(2, minmax(0, 1fr));
    gap: 18px;
}

.card-link {
    display: block;
    min-width: 0;
    border-radius: 14px;
}

.card {
    height: 100%;
    padding: 23px;
    background: white;
    border: 1px solid var(--border);
    border-radius: 14px;
    transition: 0.2s;
}

.card-link:hover .card {
    border-color: #99f6e4;
    box-shadow: 0 6px 20px rgba(15,118,110,0.10);
    transform: translateY(-2px);
}

.card-top {
    display: flex;
    align-items: center;
    justify-content: space-between;
    gap: 12px;
    margin-bottom: 20px;
}

.card-icon {
    display: flex;
    align-items: center;
    justify-content: center;
    width: 46px;
    height: 46px;
    border-radius: 12px;
    background: var(--primary-light);
    color: var(--primary-dark);
    font-size: 22px;
}

.card-tag {
    padding: 6px 10px;
    border-radius: 7px;
    background: #f0fdfa;
    color: var(--primary-dark);
    font-size: 10px;
    font-weight: bold;
}

.card h3 {
    margin: 0 0 9px;
    font-size: 17px;
}

.card p {
    margin: 0;
    color: var(--muted);
    font-size: 13px;
    line-height: 1.7;
}

.card-bottom {
    display: flex;
    justify-content: space-between;
    align-items: center;
    gap: 10px;
    margin-top: 22px;
    padding-top: 15px;
    border-top: 1px solid var(--border);
    color: var(--primary-dark);
    font-size: 12px;
    font-weight: bold;
}

.card-bottom span:last-child {
    font-size: 18px;
}

/* INFO PANEL */
.info-panel {
    display: flex;
    align-items: flex-start;
    gap: 14px;
    margin-top: 25px;
    padding: 20px;
    background: white;
    border: 1px solid var(--border);
    border-radius: 13px;
}

.info-icon {
    display: flex;
    align-items: center;
    justify-content: center;
    flex-shrink: 0;
    width: 40px;
    height: 40px;
    background: var(--primary-light);
    color: var(--primary-dark);
    border-radius: 10px;
    font-size: 20px;
}

.info-panel h3 {
    margin: 2px 0 7px;
    font-size: 14px;
}

.info-panel p {
    margin: 0;
    color: var(--muted);
    font-size: 13px;
    line-height: 1.7;
}

.footer-note {
    padding: 25px 0 5px;
    text-align: center;
    color: var(--muted);
    font-size: 12px;
}

/* RESPONSIVE */
@media (max-width: 1000px) {
    .content {
        padding: 24px;
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
        flex-wrap: wrap;
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

    .welcome-banner {
        padding: 23px;
    }

    .cards {
        grid-template-columns: 1fr;
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
           href="${pageContext.request.contextPath}/hrm-dashboard">
            &#8592; Back to Workspace
        </a>

        <div class="nav-label">CRM WORKSPACE</div>

        <nav>
            <a class="nav-link active"
               href="${pageContext.request.contextPath}/crm-dashboard">
                <span class="nav-icon">&#9635;</span>
                CRM Dashboard
            </a>

            <a class="nav-link"
               href="${pageContext.request.contextPath}/customers">
                <span class="nav-icon">&#128101;</span>
                Customers
            </a>

            <a class="nav-link"
               href="${pageContext.request.contextPath}/leads">
                <span class="nav-icon">&#9733;</span>
                Leads
            </a>

            <a class="nav-link"
               href="${pageContext.request.contextPath}/follow-ups">
                <span class="nav-icon">&#128337;</span>
                Follow-ups
            </a>

            <a class="nav-link"
               href="${pageContext.request.contextPath}/reports">
                <span class="nav-icon">&#128202;</span>
                Reports
            </a>

            <div class="nav-label">HRM WORKSPACE</div>

            <a class="nav-link"
               href="${pageContext.request.contextPath}/hrm-dashboard">
                <span class="nav-icon">&#9632;</span>
                HRM Dashboard
            </a>

            <a class="nav-link"
               href="${pageContext.request.contextPath}/employees">
                <span class="nav-icon">&#9786;</span>
                Employees
            </a>

            <a class="nav-link"
               href="${pageContext.request.contextPath}/attendance">
                <span class="nav-icon">&#10003;</span>
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
        </nav>

        <div class="sidebar-info">
            <strong>CRM Workspace</strong>
            <p>Manage customer relationships, sales leads and follow-up activities.</p>
        </div>

    </aside>

    <!-- MAIN -->
    <main class="main">

        <header class="topbar">
            <div class="breadcrumb">
                PeopleFlow / <strong>CRM Dashboard</strong>
            </div>

            <div class="topbar-right">
                <span class="workspace-badge">CRM WORKSPACE</span>

                <a class="logout"
                   href="${pageContext.request.contextPath}/login">
                    Logout
                </a>
            </div>
        </header>

        <div class="content">

            <section class="page-heading">
                <h1>CRM Dashboard</h1>
                <p>Manage your customer relationships and sales activities in one place.</p>
            </section>

            <section class="welcome-banner">
                <span class="banner-label">CUSTOMER RELATIONSHIP MANAGEMENT</span>
                <h2>Welcome to PeopleFlow CRM</h2>
                <p>
                    Keep customer information organized, track potential leads,
                    manage follow-up activities and review your business reports
                    from one workspace.
                </p>
            </section>

            <section>
                <div class="section-heading">
                    <div>
                        <h2>CRM Management</h2>
                        <p>Select a section to manage your CRM activities.</p>
                    </div>
                </div>

                <div class="cards">

                    <!-- CUSTOMERS -->
                    <a class="card-link"
                       href="${pageContext.request.contextPath}/customers">
                        <div class="card">
                            <div class="card-top">
                                <div class="card-icon">&#128101;</div>
                                <span class="card-tag">CUSTOMER DATA</span>
                            </div>

                            <h3>Customers</h3>
                            <p>
                                View and manage customer information,
                                contact details and customer records.
                            </p>

                            <div class="card-bottom">
                                <span>Manage Customers</span>
                                <span>&#8594;</span>
                            </div>
                        </div>
                    </a>

                    <!-- LEADS -->
                    <a class="card-link"
                       href="${pageContext.request.contextPath}/leads">
                        <div class="card">
                            <div class="card-top">
                                <div class="card-icon">&#9733;</div>
                                <span class="card-tag">SALES PIPELINE</span>
                            </div>

                            <h3>Leads</h3>
                            <p>
                                Track potential customers and organize
                                lead information for your sales pipeline.
                            </p>

                            <div class="card-bottom">
                                <span>Manage Leads</span>
                                <span>&#8594;</span>
                            </div>
                        </div>
                    </a>

                    <!-- FOLLOW-UPS -->
                    <a class="card-link"
                       href="${pageContext.request.contextPath}/follow-ups">
                        <div class="card">
                            <div class="card-top">
                                <div class="card-icon">&#128337;</div>
                                <span class="card-tag">ACTIVITY TRACKING</span>
                            </div>

                            <h3>Follow-ups</h3>
                            <p>
                                Organize customer follow-up activities
                                and keep track of ongoing communication.
                            </p>

                            <div class="card-bottom">
                                <span>Manage Follow-ups</span>
                                <span>&#8594;</span>
                            </div>
                        </div>
                    </a>

                    <!-- REPORTS -->
                    <a class="card-link"
                       href="${pageContext.request.contextPath}/reports">
                        <div class="card">
                            <div class="card-top">
                                <div class="card-icon">&#128202;</div>
                                <span class="card-tag">BUSINESS OVERVIEW</span>
                            </div>

                            <h3>Reports</h3>
                            <p>
                                Review customer, lead and follow-up summaries
                                along with available HRM reports.
                            </p>

                            <div class="card-bottom">
                                <span>View Reports</span>
                                <span>&#8594;</span>
                            </div>
                        </div>
                    </a>

                </div>
            </section>

            <section class="info-panel">
                <div class="info-icon">&#8505;</div>
                <div>
                    <h3>Your CRM Workspace</h3>
                    <p>
                        Use the navigation menu to move between CRM and HRM.
                        The layout stays consistent across PeopleFlow, while
                        the CRM uses teal and the HRM uses purple.
                    </p>
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
