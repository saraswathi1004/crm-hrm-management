<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>PeopleFlow | Edit Lead</title>

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
    --danger: #dc2626;
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

/* SIDEBAR - SAME AS LEAD MANAGEMENT */

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

/* MAIN */

.main {
    min-height: 100vh;
    margin-left: 250px;
}

.topbar {
    min-height: 76px;
    padding: 15px 32px;
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

/* BANNER */

.welcome-banner {
    margin-bottom: 28px;
    padding: 26px 30px;
    border-radius: 17px;
    color: white;
    background: linear-gradient(115deg, #0f766e, #14b8a6);
}

.welcome-banner h2 {
    margin: 0 0 9px;
    font-size: 22px;
}

.welcome-banner p {
    margin: 0;
    color: #f0fdfa;
    font-size: 14px;
    line-height: 1.7;
}

/* EDIT FORM */

.panel {
    padding: 24px;
    margin-bottom: 24px;
    background: white;
    border: 1px solid var(--border);
    border-radius: 14px;
}

.panel-heading {
    display: flex;
    justify-content: space-between;
    align-items: center;
    flex-wrap: wrap;
    gap: 12px;
    margin-bottom: 22px;
}

.panel-heading h2 {
    margin: 0 0 7px;
    font-size: 19px;
}

.panel-heading p {
    margin: 0;
    color: var(--muted);
    font-size: 13px;
    line-height: 1.6;
}

.form-grid {
    display: grid;
    grid-template-columns: repeat(2, minmax(0, 1fr));
    gap: 19px;
}

.field {
    min-width: 0;
}

.field.full {
    grid-column: 1 / -1;
}

label {
    display: block;
    margin-bottom: 8px;
    color: var(--text);
    font-size: 13px;
    font-weight: 600;
}

.required {
    color: var(--danger);
}

input,
select {
    width: 100%;
    min-height: 44px;
    padding: 12px 13px;
    border: 1px solid #dedbe7;
    border-radius: 9px;
    background: white;
    color: var(--text);
    font-family: inherit;
    font-size: 14px;
    outline: none;
    transition: 0.2s;
}

input:focus,
select:focus {
    border-color: var(--primary);
    box-shadow: 0 0 0 3px rgba(15,118,110,0.10);
}

.button-row {
    display: flex;
    flex-wrap: wrap;
    gap: 10px;
    margin-top: 3px;
}

button,
.button {
    display: inline-flex;
    justify-content: center;
    align-items: center;
    gap: 7px;
    border: none;
    border-radius: 9px;
    padding: 11px 17px;
    cursor: pointer;
    font-family: inherit;
    font-size: 13px;
    font-weight: bold;
    transition: 0.2s;
}

.btn-primary {
    background: var(--primary);
    color: white;
}

.btn-primary:hover {
    background: var(--primary-dark);
}

.btn-secondary {
    background: #f3f4f6;
    color: var(--text);
    border: 1px solid var(--border);
}

.btn-secondary:hover {
    background: #e9e7ef;
}

.message {
    padding: 13px 15px;
    margin-bottom: 18px;
    border-radius: 9px;
    font-size: 13px;
    line-height: 1.5;
}

.error {
    background: #fee2e2;
    border: 1px solid #fecaca;
    color: #991b1b;
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
        padding: 22px;
    }

    .panel {
        padding: 18px;
    }

    .form-grid {
        grid-template-columns: 1fr;
    }

    .field.full {
        grid-column: auto;
    }
}
</style>
</head>

<body>

<!-- SIDEBAR: SAME AS LEAD MANAGEMENT -->

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
        <a class="nav-link"
           href="${pageContext.request.contextPath}/crm-dashboard">
            <span class="nav-icon">&#9635;</span> CRM Dashboard
        </a>

        <a class="nav-link"
           href="${pageContext.request.contextPath}/customers">
            <span class="nav-icon">&#128101;</span> Customers
        </a>

        <a class="nav-link active"
           href="${pageContext.request.contextPath}/leads">
            <span class="nav-icon">&#9733;</span> Leads
        </a>

        <a class="nav-link"
           href="${pageContext.request.contextPath}/follow-ups">
            <span class="nav-icon">&#128337;</span> Follow-ups
        </a>

        <a class="nav-link"
           href="${pageContext.request.contextPath}/reports">
            <span class="nav-icon">&#128202;</span> Reports
        </a>

        <div class="nav-label">HRM WORKSPACE</div>

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
    </nav>

    <div class="sidebar-info">
        <strong>CRM Workspace</strong>
        <p>Manage leads, track sales opportunities, and maintain your customer relationships.</p>
    </div>

</aside>

<!-- MAIN CONTENT -->

<main class="main">

    <header class="topbar">
        <div class="breadcrumb">
            PeopleFlow / CRM / Leads / <strong>Edit Lead</strong>
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
            <h1>Edit Lead</h1>
            <p>Update lead information and manage your sales opportunities.</p>
        </section>

        <section class="welcome-banner">
            <h2>Update Lead Details</h2>
            <p>
                Modify the lead information below and save your changes.
            </p>
        </section>

        <c:if test="${not empty errorMessage}">
            <div class="message error">
                <c:out value="${errorMessage}"/>
            </div>
        </c:if>

        <section class="panel">

            <div class="panel-heading">
                <div>
                    <h2>Lead Information</h2>
                    <p>Fields marked with * are required.</p>
                </div>
            </div>

            <form action="${pageContext.request.contextPath}/leads/update/${lead.id}"
                  method="post">

                <div class="form-grid">

                    <div class="field">
                        <label for="leadName">
                            Lead Name <span class="required">*</span>
                        </label>

                        <input type="text"
                               id="leadName"
                               name="leadName"
                               value="<c:out value='${lead.leadName}'/>"
                               placeholder="Enter lead name"
                               required>
                    </div>

                    <div class="field">
                        <label for="email">
                            Email <span class="required">*</span>
                        </label>

                        <input type="email"
                               id="email"
                               name="email"
                               value="<c:out value='${lead.email}'/>"
                               placeholder="Enter email address"
                               required>
                    </div>

                    <div class="field">
                        <label for="phone">
                            Phone <span class="required">*</span>
                        </label>

                        <input type="text"
                               id="phone"
                               name="phone"
                               value="<c:out value='${lead.phone}'/>"
                               placeholder="Enter phone number"
                               required>
                    </div>

                    <div class="field">
                        <label for="company">Company</label>

                        <input type="text"
                               id="company"
                               name="company"
                               value="<c:out value='${lead.company}'/>"
                               placeholder="Enter company name">
                    </div>

                    <div class="field">
                        <label for="source">
                            Lead Source <span class="required">*</span>
                        </label>

                        <select id="source" name="source" required>
                            <option value="Website"
                                ${lead.source == 'Website' ? 'selected' : ''}>
                                Website
                            </option>

                            <option value="Referral"
                                ${lead.source == 'Referral' ? 'selected' : ''}>
                                Referral
                            </option>

                            <option value="Social Media"
                                ${lead.source == 'Social Media' ? 'selected' : ''}>
                                Social Media
                            </option>

                            <option value="Advertisement"
                                ${lead.source == 'Advertisement' ? 'selected' : ''}>
                                Advertisement
                            </option>

                            <option value="Other"
                                ${lead.source == 'Other' ? 'selected' : ''}>
                                Other
                            </option>
                        </select>
                    </div>

                    <div class="field">
                        <label for="status">
                            Lead Status <span class="required">*</span>
                        </label>

                        <select id="status" name="status" required>
                            <option value="New"
                                ${lead.status == 'New' ? 'selected' : ''}>
                                New
                            </option>

                            <option value="Contacted"
                                ${lead.status == 'Contacted' ? 'selected' : ''}>
                                Contacted
                            </option>

                            <option value="Qualified"
                                ${lead.status == 'Qualified' ? 'selected' : ''}>
                                Qualified
                            </option>

                            <option value="Converted"
                                ${lead.status == 'Converted' ? 'selected' : ''}>
                                Converted
                            </option>

                            <option value="Lost"
                                ${lead.status == 'Lost' ? 'selected' : ''}>
                                Lost
                            </option>
                        </select>
                    </div>

                    <div class="field full">
                        <div class="button-row">

                            <button type="submit" class="btn-primary">
                                Update Lead
                            </button>

                            <a href="${pageContext.request.contextPath}/leads"
                               class="button btn-secondary">
                                Back to Leads
                            </a>

                        </div>
                    </div>

                </div>
            </form>

        </section>

    </div>

</main>

</body>
</html>