
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>PeopleFlow - Follow-up Management</title>

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

        .app-layout {
            min-height: 100vh;
        }

        /* SIDEBAR - same as Lead Management */
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
            flex-shrink: 0;
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
            text-decoration: none;
        }

        .workspace-link:hover {
            color: var(--primary);
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
            text-decoration: none;
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
            flex-shrink: 0;
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
        .main-area {
            min-height: 100vh;
            margin-left: 250px;
            min-width: 0;
        }

        .topbar {
            min-height: 76px;
            background: var(--white);
            border-bottom: 1px solid var(--border);
            display: flex;
            align-items: center;
            justify-content: space-between;
            gap: 15px;
            padding: 0 30px;
        }

        .breadcrumb {
            font-size: 14px;
            color: var(--muted);
        }

        .breadcrumb strong {
            color: var(--text);
        }

        .workspace-badge {
            padding: 8px 12px;
            border-radius: 20px;
            background: var(--primary-light);
            color: var(--primary-dark);
            font-size: 11px;
            font-weight: bold;
            letter-spacing: 0.5px;
            white-space: nowrap;
        }

        .content {
            width: 100%;
            max-width: 1550px;
            margin: 0 auto;
            padding: 30px;
        }

        .welcome-banner {
            padding: 26px 28px;
            border-radius: 16px;
            background: linear-gradient(120deg, #0f766e, #159e91);
            color: white;
            margin-bottom: 26px;
        }

        .welcome-banner h1 {
            margin: 0 0 9px;
            font-size: 26px;
        }

        .welcome-banner p {
            margin: 0;
            font-size: 14px;
            line-height: 1.6;
            color: #e0f7f4;
        }

        .page-heading {
            display: flex;
            justify-content: space-between;
            align-items: center;
            gap: 15px;
            flex-wrap: wrap;
            margin: 0 0 20px;
        }

        .page-heading h2 {
            margin: 0 0 7px;
            font-size: 22px;
        }

        .page-heading p {
            margin: 0;
            color: var(--muted);
            font-size: 13px;
        }

        .panel {
            background: var(--white);
            border: 1px solid var(--border);
            border-radius: 14px;
            padding: 24px;
            margin-bottom: 24px;
            box-shadow: 0 4px 15px rgba(35, 31, 55, 0.03);
        }

        .panel-heading {
            display: flex;
            align-items: center;
            justify-content: space-between;
            flex-wrap: wrap;
            gap: 12px;
            margin-bottom: 22px;
        }

        .panel-heading h3 {
            margin: 0;
            font-size: 17px;
        }

        .panel-subtitle {
            color: var(--muted);
            font-size: 12px;
            margin-top: 6px;
        }

        .form-grid {
            display: grid;
            grid-template-columns: repeat(2, minmax(0, 1fr));
            gap: 19px;
        }

        .form-group label {
            display: block;
            margin-bottom: 8px;
            font-size: 13px;
            font-weight: bold;
        }

        .form-group input,
        .form-group select,
        .form-group textarea {
            width: 100%;
            min-height: 43px;
            padding: 11px 12px;
            border: 1px solid #dedce7;
            border-radius: 8px;
            background: white;
            color: var(--text);
            font-size: 13px;
            font-family: inherit;
            outline: none;
        }

        .form-group textarea {
            resize: vertical;
            min-height: 90px;
        }

        .form-group input:focus,
        .form-group select:focus,
        .form-group textarea:focus,
        .search-input:focus {
            border-color: var(--primary);
            box-shadow: 0 0 0 3px rgba(15, 118, 110, 0.10);
        }

        .button {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            gap: 6px;
            padding: 10px 14px;
            border: none;
            border-radius: 8px;
            font-size: 13px;
            font-weight: bold;
            text-decoration: none;
            cursor: pointer;
            white-space: nowrap;
            font-family: inherit;
        }

        .add-btn {
            margin-top: 21px;
            background: var(--primary);
            color: white;
        }

        .add-btn:hover {
            background: var(--primary-dark);
        }

        .edit-btn {
            background: #fff4d6;
            color: #8a5a00;
        }

        .delete-btn {
            background: #fee2e2;
            color: #b91c1c;
        }

        .message {
            padding: 13px 16px;
            border-radius: 9px;
            margin-bottom: 18px;
            font-size: 13px;
            line-height: 1.5;
        }

        .success-message {
            background: #dcfce7;
            color: #166534;
            border: 1px solid #bbf7d0;
        }

        .error-message {
            background: #fee2e2;
            color: #991b1b;
            border: 1px solid #fecaca;
        }

        .table-toolbar {
            display: flex;
            align-items: center;
            justify-content: space-between;
            flex-wrap: wrap;
            gap: 12px;
            margin-bottom: 17px;
        }

        .table-toolbar p {
            margin: 0;
            color: var(--muted);
            font-size: 12px;
        }

        .search-input {
            width: 260px;
            max-width: 100%;
            padding: 10px 12px;
            border: 1px solid #dedce7;
            border-radius: 8px;
            outline: none;
            font-size: 13px;
        }

        .table-wrapper {
            width: 100%;
            overflow-x: auto;
            border: 1px solid var(--border);
            border-radius: 10px;
        }

        table {
            width: 100%;
            min-width: 850px;
            border-collapse: collapse;
            background: white;
        }

        thead {
            background: #f4f8f8;
        }

        th {
            color: #686579;
            font-size: 11px;
            text-transform: uppercase;
            letter-spacing: 0.5px;
            font-weight: bold;
        }

        th, td {
            padding: 15px 13px;
            text-align: left;
            border-bottom: 1px solid var(--border);
            vertical-align: middle;
        }

        td {
            font-size: 13px;
            color: #555267;
        }

        tbody tr:last-child td {
            border-bottom: none;
        }

        tbody tr:hover {
            background: #fbfdfd;
        }

        .customer-name {
            color: var(--text);
            font-weight: bold;
        }

        .status {
            display: inline-block;
            padding: 6px 9px;
            border-radius: 20px;
            font-size: 11px;
            font-weight: bold;
        }

        .status-pending {
            background: #fef3c7;
            color: #92400e;
        }

        .status-completed {
            background: #dcfce7;
            color: #166534;
        }

        .status-cancelled {
            background: #fee2e2;
            color: #991b1b;
        }

        .status-default {
            background: #f1f5f9;
            color: #475569;
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
            text-align: center;
            padding: 30px 15px;
            color: var(--muted);
        }

        .empty-state strong {
            display: block;
            margin-bottom: 7px;
            color: var(--text);
        }

        .footer {
            padding: 0 30px 25px;
            text-align: center;
            font-size: 12px;
            color: var(--muted);
        }

        /* RESPONSIVE */
        @media (max-width: 900px) {
            .sidebar {
                width: 215px;
                padding: 22px 12px;
            }

            .main-area {
                margin-left: 215px;
            }

            .content {
                padding: 22px;
            }

            .topbar {
                padding: 0 22px;
            }

            .panel {
                padding: 20px;
            }
        }

        @media (max-width: 760px) {
            .app-layout {
                display: block;
            }

            .sidebar {
                position: relative;
                width: 100%;
                height: auto;
                padding: 15px;
                overflow: visible;
                border-right: none;
                border-bottom: 1px solid var(--border);
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
                font-size: 12px;
            }

            .main-area {
                margin-left: 0;
            }

            .topbar {
                min-height: 65px;
                padding: 14px 18px;
                flex-wrap: wrap;
            }

            .workspace-badge {
                display: none;
            }

            .content {
                padding: 18px 14px;
            }

            .welcome-banner {
                padding: 22px 19px;
            }

            .welcome-banner h1 {
                font-size: 22px;
            }

            .panel {
                padding: 17px;
            }

            .form-grid {
                grid-template-columns: 1fr;
            }

            .full-width {
                grid-column: auto !important;
            }

            .search-input {
                width: 100%;
            }

            .table-toolbar {
                align-items: stretch;
            }

            .footer {
                padding: 0 14px 20px;
            }
        }
    </style>
</head>

<body>
<div class="app-layout">

    <!-- SAME SIDEBAR AS LEAD MANAGEMENT -->
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

            <a class="nav-link active"
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
            <p>
                Manage leads, track sales opportunities, and maintain
                your customer relationships.
            </p>
        </div>

    </aside>

    <!-- MAIN CONTENT -->
    <main class="main-area">

        <header class="topbar">
            <div class="breadcrumb">
                CRM &nbsp; / &nbsp; <strong>Follow-up Management</strong>
            </div>

            <div class="workspace-badge">CRM WORKSPACE</div>
        </header>

        <div class="content">

            <section class="welcome-banner">
                <h1>Follow-up Management</h1>
                <p>
                    Schedule customer follow-ups, record discussions,
                    and keep track of every interaction.
                </p>
            </section>

            <div class="page-heading">
                <div>
                    <h2>Follow-ups</h2>
                    <p>Create and manage your customer follow-up activities.</p>
                </div>
            </div>

            <!-- SUCCESS MESSAGE -->
            <c:if test="${not empty successMessage}">
                <div class="message success-message">
                    <c:out value="${successMessage}"/>
                </div>
            </c:if>

            <!-- ERROR MESSAGE -->
            <c:if test="${not empty errorMessage}">
                <div class="message error-message">
                    <c:out value="${errorMessage}"/>
                </div>
            </c:if>

            <!-- ADD FOLLOW-UP FORM -->
            <section class="panel">

                <div class="panel-heading">
                    <div>
                        <h3>Add New Follow-up</h3>
                        <div class="panel-subtitle">
                            Enter the customer, date, time, and follow-up details.
                        </div>
                    </div>
                </div>

                <form action="${pageContext.request.contextPath}/follow-ups/add"
                      method="post">

                    <div class="form-grid">

                        <div class="form-group">
                            <label for="customerName">Customer Name *</label>
                            <input type="text"
                                   id="customerName"
                                   name="customerName"
                                   placeholder="Enter customer name"
                                   required>
                        </div>

                        <div class="form-group">
                            <label for="followUpDate">Follow-up Date *</label>
                            <input type="date"
                                   id="followUpDate"
                                   name="followUpDate"
                                   required>
                        </div>

                        <div class="form-group">
                            <label for="followUpTime">Follow-up Time *</label>
                            <input type="time"
                                   id="followUpTime"
                                   name="followUpTime"
                                   required>
                        </div>

                        <div class="form-group">
                            <label for="status">Status *</label>
                            <select id="status" name="status" required>
                                <option value="Pending">Pending</option>
                                <option value="Completed">Completed</option>
                                <option value="Cancelled">Cancelled</option>
                            </select>
                        </div>

                        <div class="form-group full-width"
                             style="grid-column: 1 / -1;">
                            <label for="notes">Notes</label>
                            <textarea id="notes"
                                      name="notes"
                                      rows="3"
                                      placeholder="Enter follow-up details"></textarea>
                        </div>

                    </div>

                    <button type="submit" class="button add-btn">
                        + Add Follow-up
                    </button>

                </form>
            </section>

            <!-- FOLLOW-UP RECORDS -->
            <section class="panel">

                <div class="panel-heading">
                    <div>
                        <h3>Follow-up Records</h3>
                        <div class="panel-subtitle">
                            View and manage scheduled customer follow-ups.
                        </div>
                    </div>
                </div>

                <div class="table-toolbar">
                    <p>Follow-up records</p>

                    <input type="search"
                           id="followUpSearch"
                           class="search-input"
                           placeholder="Search follow-ups..."
                           aria-label="Search follow-ups">
                </div>

                <div class="table-wrapper">
                    <table id="followUpsTable">

                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Customer</th>
                                <th>Date</th>
                                <th>Time</th>
                                <th>Notes</th>
                                <th>Status</th>
                                <th>Actions</th>
                            </tr>
                        </thead>

                        <tbody>

                            <c:forEach var="item" items="${followUps}">
                                <tr>

                                    <td>
                                        <c:out value="${item.id}"/>
                                    </td>

                                    <td class="customer-name">
                                        <c:out value="${item.customerName}"/>
                                    </td>

                                    <td>
                                        <c:out value="${item.followUpDate}"/>
                                    </td>

                                    <td>
                                        <c:out value="${item.followUpTime}"/>
                                    </td>

                                    <td>
                                        <c:out value="${item.notes}"/>
                                    </td>

                                    <td>
                                        <c:choose>

                                            <c:when test="${item.status eq 'Pending'}">
                                                <span class="status status-pending">
                                                    <c:out value="${item.status}"/>
                                                </span>
                                            </c:when>

                                            <c:when test="${item.status eq 'Completed'}">
                                                <span class="status status-completed">
                                                    <c:out value="${item.status}"/>
                                                </span>
                                            </c:when>

                                            <c:when test="${item.status eq 'Cancelled'}">
                                                <span class="status status-cancelled">
                                                    <c:out value="${item.status}"/>
                                                </span>
                                            </c:when>

                                            <c:otherwise>
                                                <span class="status status-default">
                                                    <c:out value="${item.status}"/>
                                                </span>
                                            </c:otherwise>

                                        </c:choose>
                                    </td>

                                    <td>
                                        <div class="actions">

                                            <a class="button edit-btn"
                                               href="${pageContext.request.contextPath}/follow-ups/edit/${item.id}">
                                                Edit
                                            </a>

                                            <form action="${pageContext.request.contextPath}/follow-ups/delete/${item.id}"
                                                  method="post"
                                                  onsubmit="return confirm('Delete this follow-up?');">

                                                <button type="submit"
                                                        class="button delete-btn">
                                                    Delete
                                                </button>

                                            </form>

                                        </div>
                                    </td>

                                </tr>
                            </c:forEach>

                            <c:if test="${empty followUps}">
                                <tr>
                                    <td colspan="7">
                                        <div class="empty-state">
                                            <strong>No follow-ups found</strong>
                                            Add your first follow-up using the form above.
                                        </div>
                                    </td>
                                </tr>
                            </c:if>

                        </tbody>

                    </table>
                </div>
            </section>

        </div>

        <footer class="footer">
            PeopleFlow CRM &nbsp;·&nbsp; Follow-up Management
        </footer>

    </main>

</div>

<script>
    const followUpSearch = document.getElementById("followUpSearch");
    const followUpsTable = document.getElementById("followUpsTable");

    followUpSearch.addEventListener("input", function () {
        const searchValue = this.value.toLowerCase().trim();
        const rows = followUpsTable.querySelectorAll("tbody tr");

        rows.forEach(function (row) {
            const rowText = row.textContent.toLowerCase();

            // Keep the empty-state row visible.
            if (row.querySelector(".empty-state")) {
                row.style.display = "";
            } else {
                row.style.display =
                    rowText.includes(searchValue) ? "" : "none";
            }
        });
    });
</script>

</body>
</html>
