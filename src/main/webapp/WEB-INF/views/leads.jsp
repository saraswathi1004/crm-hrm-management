
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>PeopleFlow | Lead Management</title>

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

/* SIDEBAR - SAME AS CUSTOMER JSP */

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

/* PANELS AND FORMS */

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

.btn-edit {
    background: #e0f2fe;
    color: #075985;
    padding: 8px 11px;
}

.btn-delete {
    background: #fee2e2;
    color: #b91c1c;
    padding: 8px 11px;
}

.btn-edit:hover {
    background: #bae6fd;
}

.btn-delete:hover {
    background: #fecaca;
}

/* MESSAGES */

.message {
    padding: 13px 15px;
    margin-bottom: 18px;
    border-radius: 9px;
    font-size: 13px;
    line-height: 1.5;
}

.success {
    background: #dcfce7;
    border: 1px solid #bbf7d0;
    color: #166534;
}

.error {
    background: #fee2e2;
    border: 1px solid #fecaca;
    color: #991b1b;
}

/* LEAD TABLE */

.table-toolbar {
    display: flex;
    align-items: center;
    justify-content: space-between;
    gap: 15px;
    flex-wrap: wrap;
    margin-bottom: 18px;
}

.table-toolbar h2 {
    margin: 0;
    font-size: 19px;
}

.search-box {
    width: 260px;
    max-width: 100%;
}

.table-wrapper {
    overflow-x: auto;
    border: 1px solid var(--border);
    border-radius: 11px;
}

table {
    width: 100%;
    min-width: 950px;
    border-collapse: collapse;
}

th,
td {
    padding: 15px 16px;
    text-align: left;
    border-bottom: 1px solid var(--border);
    font-size: 13px;
    vertical-align: middle;
}

th {
    background: #f8fafc;
    color: var(--muted);
    font-size: 11px;
    text-transform: uppercase;
    letter-spacing: 0.4px;
    white-space: nowrap;
}

td {
    color: var(--text);
}

tbody tr:last-child td {
    border-bottom: none;
}

tbody tr:hover {
    background: #fafffe;
}

.lead-name {
    font-weight: bold;
}

.status {
    display: inline-block;
    padding: 6px 10px;
    border-radius: 20px;
    font-size: 11px;
    font-weight: bold;
    white-space: nowrap;
    background: #f1f5f9;
    color: #475569;
}

.status-new {
    background: #dbeafe;
    color: #1d4ed8;
}

.status-contacted {
    background: #fef3c7;
    color: #92400e;
}

.status-qualified {
    background: #ccfbf1;
    color: #115e59;
}

.status-converted {
    background: #dcfce7;
    color: #166534;
}

.status-lost {
    background: #fee2e2;
    color: #991b1b;
}

.actions {
    display: flex;
    align-items: center;
    gap: 7px;
}

.actions form {
    margin: 0;
}

.empty-state {
    padding: 30px;
    text-align: center;
    color: var(--muted);
    font-size: 13px;
    line-height: 1.6;
}

.footer-note {
    padding: 20px 0 5px;
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

    .search-box {
        width: 100%;
    }
}
</style>
</head>

<body>

<!-- SAME SIDEBAR AS CUSTOMER JSP -->

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
            PeopleFlow / CRM / <strong>Leads</strong>
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
            <h1>Lead Management</h1>
            <p>Manage potential customers and monitor your sales opportunities.</p>
        </section>

        <section class="welcome-banner">
            <h2>Lead Management</h2>
            <p>
                Track potential customers, organize lead sources, and manage
                sales progress from one place.
            </p>
        </section>

        <!-- SUCCESS MESSAGE -->

        <c:if test="${not empty successMessage}">
            <div class="message success">
                <c:out value="${successMessage}"/>
            </div>
        </c:if>

        <!-- ERROR MESSAGE -->

        <c:if test="${not empty errorMessage}">
            <div class="message error">
                <c:out value="${errorMessage}"/>
            </div>
        </c:if>

        <!-- ADD LEAD FORM -->

        <section class="panel">

            <div class="panel-heading">
                <div>
                    <h2>Add New Lead</h2>
                    <p>Enter the lead details below.</p>
                </div>
            </div>

            <form action="${pageContext.request.contextPath}/leads/add"
                  method="post">

                <div class="form-grid">

                    <div class="field">
                        <label for="leadName">
                            Lead Name <span class="required">*</span>
                        </label>

                        <input type="text"
                               id="leadName"
                               name="leadName"
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
                               placeholder="Enter phone number"
                               required>
                    </div>

                    <div class="field">
                        <label for="company">Company</label>

                        <input type="text"
                               id="company"
                               name="company"
                               placeholder="Enter company name">
                    </div>

                    <div class="field">
                        <label for="source">
                            Lead Source <span class="required">*</span>
                        </label>

                        <select id="source" name="source" required>
                            <option value="">Select source</option>
                            <option value="Website">Website</option>
                            <option value="Referral">Referral</option>
                            <option value="Social Media">Social Media</option>
                            <option value="Advertisement">Advertisement</option>
                            <option value="Other">Other</option>
                        </select>
                    </div>

                    <div class="field">
                        <label for="status">
                            Lead Status <span class="required">*</span>
                        </label>

                        <select id="status" name="status" required>
                            <option value="New">New</option>
                            <option value="Contacted">Contacted</option>
                            <option value="Qualified">Qualified</option>
                            <option value="Converted">Converted</option>
                            <option value="Lost">Lost</option>
                        </select>
                    </div>

                    <div class="field full">
                        <div class="button-row">
                            <button type="submit" class="btn-primary">
                                + Add Lead
                            </button>

                            <button type="reset" class="btn-secondary">
                                Clear Form
                            </button>
                        </div>
                    </div>

                </div>
            </form>
        </section>

        <!-- LEAD LIST -->

        <section class="panel">

            <div class="table-toolbar">
                <div>
                    <h2>Lead List</h2>
                    <p style="color:var(--muted);font-size:13px;margin:7px 0 0;">
                        View and manage your registered leads.
                    </p>
                </div>

                <input type="search"
                       id="leadSearch"
                       class="search-box"
                       placeholder="Search leads..."
                       aria-label="Search leads">
            </div>

            <div class="table-wrapper">

                <table id="leadTable">

                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Name</th>
                            <th>Email</th>
                            <th>Phone</th>
                            <th>Company</th>
                            <th>Source</th>
                            <th>Status</th>
                            <th>Actions</th>
                        </tr>
                    </thead>

                    <tbody>

                        <c:forEach var="item" items="${leads}">

                            <tr>
                                <td>
                                    <c:out value="${item.id}"/>
                                </td>

                                <td class="lead-name">
                                    <c:out value="${item.leadName}"/>
                                </td>

                                <td>
                                    <c:out value="${item.email}"/>
                                </td>

                                <td>
                                    <c:out value="${item.phone}"/>
                                </td>

                                <td>
                                    <c:out value="${item.company}"/>
                                </td>

                                <td>
                                    <c:out value="${item.source}"/>
                                </td>

                                <td>
                                    <c:choose>

                                        <c:when test="${item.status eq 'New'}">
                                            <span class="status status-new">
                                                <c:out value="${item.status}"/>
                                            </span>
                                        </c:when>

                                        <c:when test="${item.status eq 'Contacted'}">
                                            <span class="status status-contacted">
                                                <c:out value="${item.status}"/>
                                            </span>
                                        </c:when>

                                        <c:when test="${item.status eq 'Qualified'}">
                                            <span class="status status-qualified">
                                                <c:out value="${item.status}"/>
                                            </span>
                                        </c:when>

                                        <c:when test="${item.status eq 'Converted'}">
                                            <span class="status status-converted">
                                                <c:out value="${item.status}"/>
                                            </span>
                                        </c:when>

                                        <c:when test="${item.status eq 'Lost'}">
                                            <span class="status status-lost">
                                                <c:out value="${item.status}"/>
                                            </span>
                                        </c:when>

                                        <c:otherwise>
                                            <span class="status">
                                                <c:out value="${item.status}"/>
                                            </span>
                                        </c:otherwise>

                                    </c:choose>
                                </td>

                                <td>
                                    <div class="actions">

                                        <a class="button btn-edit"
                                           href="${pageContext.request.contextPath}/leads/edit/${item.id}">
                                            Edit
                                        </a>

                                        <form action="${pageContext.request.contextPath}/leads/delete/${item.id}"
                                              method="post"
                                              onsubmit="return confirm('Are you sure you want to delete this lead?');">

                                            <button type="submit" class="btn-delete">
                                                Delete
                                            </button>

                                        </form>

                                    </div>
                                </td>
                            </tr>

                        </c:forEach>

                        <c:if test="${empty leads}">
                            <tr>
                                <td colspan="8" class="empty-state">
                                    No leads found. Add your first lead using the form above.
                                </td>
                            </tr>
                        </c:if>

                    </tbody>
                </table>

            </div>
        </section>

        <div class="footer-note">
            PeopleFlow Management System &copy; 2026
        </div>

    </div>

</main>

<script>
document.addEventListener("DOMContentLoaded", function () {

    const searchInput = document.getElementById("leadSearch");
    const table = document.getElementById("leadTable");

    searchInput.addEventListener("input", function () {

        const query = this.value.toLowerCase().trim();
        const rows = table.querySelectorAll("tbody tr");

        rows.forEach(function (row) {

            if (row.querySelector(".empty-state")) {
                return;
            }

            row.style.display =
                row.textContent.toLowerCase().includes(query) ? "" : "none";
        });
    });
});
</script>

</body>
</html>
