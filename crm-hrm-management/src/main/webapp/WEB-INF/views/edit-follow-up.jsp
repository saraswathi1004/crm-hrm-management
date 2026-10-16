
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>PeopleFlow - Edit Follow-up</title>

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

        /* Same PeopleFlow sidebar */
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

        /* Main content */
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
            max-width: 1200px;
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

        .panel {
            background: var(--white);
            border: 1px solid var(--border);
            border-radius: 14px;
            padding: 26px;
            margin-bottom: 24px;
            box-shadow: 0 4px 15px rgba(35, 31, 55, 0.03);
        }

        .panel-heading {
            margin-bottom: 24px;
        }

        .panel-heading h2 {
            margin: 0 0 7px;
            font-size: 21px;
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
            gap: 20px;
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
            min-height: 110px;
        }

        .form-group input:focus,
        .form-group select:focus,
        .form-group textarea:focus {
            border-color: var(--primary);
            box-shadow: 0 0 0 3px rgba(15, 118, 110, 0.10);
        }

        .full-width {
            grid-column: 1 / -1;
        }

        .button-row {
            display: flex;
            align-items: center;
            flex-wrap: wrap;
            gap: 10px;
            margin-top: 24px;
        }

        .button {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            gap: 6px;
            padding: 11px 16px;
            border: none;
            border-radius: 8px;
            font-size: 13px;
            font-weight: bold;
            text-decoration: none;
            cursor: pointer;
            font-family: inherit;
        }

        .update-btn {
            background: var(--primary);
            color: white;
        }

        .update-btn:hover {
            background: var(--primary-dark);
        }

        .cancel-btn {
            background: #f1f5f9;
            color: #475569;
            border: 1px solid #e2e8f0;
        }

        .cancel-btn:hover {
            background: #e2e8f0;
        }

        .footer {
            padding: 0 30px 25px;
            text-align: center;
            font-size: 12px;
            color: var(--muted);
        }

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
                padding: 22px;
            }
        }

        @media (max-width: 760px) {
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
                padding: 15px 18px;
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
                padding: 18px;
            }

            .form-grid {
                grid-template-columns: 1fr;
            }

            .full-width {
                grid-column: auto;
            }

            .footer {
                padding: 0 14px 20px;
            }
        }
    </style>
</head>

<body>
<div class="app-layout">

    <!-- SAME SIDEBAR AS LEAD AND FOLLOW-UP MANAGEMENT -->
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
                <span class="nav-icon">&#9635;</span>
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
                CRM &nbsp; / &nbsp; Follow-ups &nbsp; / &nbsp;
                <strong>Edit Follow-up</strong>
            </div>

            <div class="workspace-badge">CRM WORKSPACE</div>
        </header>

        <div class="content">

            <section class="welcome-banner">
                <h1>Edit Follow-up</h1>
                <p>
                    Update customer details, scheduled date and time,
                    notes, and follow-up status.
                </p>
            </section>

            <section class="panel">

                <div class="panel-heading">
                    <h2>Follow-up Details</h2>
                    <p>
                        Modify the details below and select Update Follow-up
                        to save your changes.
                    </p>
                </div>

                <form action="${pageContext.request.contextPath}/follow-ups/update/${followUp.id}"
                      method="post">

                    <div class="form-grid">

                        <div class="form-group">
                            <label for="customerName">Customer Name *</label>
                            <input type="text"
                                   id="customerName"
                                   name="customerName"
                                   value="<c:out value='${followUp.customerName}'/>"
                                   placeholder="Enter customer name"
                                   required>
                        </div>

                        <div class="form-group">
                            <label for="followUpDate">Follow-up Date *</label>
                            <input type="date"
                                   id="followUpDate"
                                   name="followUpDate"
                                   value="${followUp.followUpDate}"
                                   required>
                        </div>

                        <div class="form-group">
                            <label for="followUpTime">Follow-up Time *</label>
                            <input type="time"
                                   id="followUpTime"
                                   name="followUpTime"
                                   value="${followUp.followUpTime}"
                                   required>
                        </div>

                        <div class="form-group">
                            <label for="status">Status *</label>
                            <select id="status" name="status" required>
                                <option value="Pending"
                                    ${followUp.status == 'Pending' ? 'selected' : ''}>
                                    Pending
                                </option>

                                <option value="Completed"
                                    ${followUp.status == 'Completed' ? 'selected' : ''}>
                                    Completed
                                </option>

                                <option value="Cancelled"
                                    ${followUp.status == 'Cancelled' ? 'selected' : ''}>
                                    Cancelled
                                </option>
                            </select>
                        </div>

                        <div class="form-group full-width">
                            <label for="notes">Notes</label>
                            <textarea id="notes"
                                      name="notes"
                                      rows="4"
                                      placeholder="Enter follow-up notes"><c:out value="${followUp.notes}"/></textarea>
                        </div>

                    </div>

                    <div class="button-row">

                        <button type="submit" class="button update-btn">
                            &#10003; Update Follow-up
                        </button>

                        <a class="button cancel-btn"
                           href="${pageContext.request.contextPath}/follow-ups">
                            Cancel
                        </a>

                    </div>

                </form>

            </section>

        </div>

        <footer class="footer">
            PeopleFlow CRM &nbsp;·&nbsp; Follow-up Management
        </footer>

    </main>

</div>
</body>
</html>
