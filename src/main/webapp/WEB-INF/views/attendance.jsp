
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Attendance Management | PeopleFlow HRM</title>

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

        /* Sidebar */
        .sidebar {
            width: 250px;
            position: fixed;
            top: 0;
            bottom: 0;
            left: 0;
            overflow-y: auto;
            background: #fff;
            border-right: 1px solid #eceaf1;
            padding: 25px 16px;
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
            min-width: 42px;
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
            background: #f3e8ff;
            color: #9333ea;
        }

        .nav-link.active {
            font-weight: 700;
        }

        .nav-icon {
            width: 23px;
            min-width: 23px;
            text-align: center;
            font-size: 18px;
        }

        /* Main */
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
            padding: 30px;
            min-width: 0;
        }

        .page-heading {
            display: flex;
            align-items: center;
            justify-content: space-between;
            gap: 15px;
            flex-wrap: wrap;
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

        .btn {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            gap: 8px;
            padding: 12px 17px;
            border: 1px solid #e7e3ed;
            border-radius: 10px;
            background: white;
            color: #514c61;
            font-size: 12px;
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
        }

        .message {
            padding: 14px 17px;
            margin-bottom: 18px;
            border-radius: 10px;
            font-size: 13px;
        }

        .success {
            background: #ecfdf3;
            color: #16804a;
        }

        .error {
            background: #fff1f2;
            color: #be123c;
        }

        /* Welcome Banner */
        .welcome-banner {
            display: flex;
            justify-content: space-between;
            align-items: center;
            gap: 20px;
            padding: 25px 27px;
            margin-bottom: 25px;
            color: #fff;
            border-radius: 16px;
            background: linear-gradient(115deg, #8b5cf6, #a855f7);
        }

        .welcome-banner h2 {
            font-size: 20px;
            margin-bottom: 8px;
        }

        .welcome-banner p {
            color: #f4eaff;
            font-size: 13px;
            line-height: 1.6;
        }

        .banner-icon {
            width: 58px;
            height: 58px;
            min-width: 58px;
            display: flex;
            align-items: center;
            justify-content: center;
            border-radius: 15px;
            background: rgba(255,255,255,0.18);
            font-size: 28px;
        }

        /* Summary cards */
        .summary-grid {
            display: grid;
            grid-template-columns: repeat(3, minmax(0, 1fr));
            gap: 18px;
            margin-bottom: 25px;
        }

        .summary-card {
            padding: 22px;
            background: #fff;
            border: 1px solid #eceaf1;
            border-radius: 15px;
        }

        .summary-title {
            display: flex;
            justify-content: space-between;
            align-items: center;
            gap: 10px;
            color: #777187;
            font-size: 13px;
        }

        .summary-icon {
            display: flex;
            align-items: center;
            justify-content: center;
            width: 42px;
            height: 42px;
            min-width: 42px;
            background: #f3e8ff;
            color: #9333ea;
            border-radius: 12px;
            font-size: 20px;
        }

        .summary-value {
            margin-top: 15px;
            font-size: 25px;
            font-weight: 750;
        }

        .summary-note {
            margin-top: 6px;
            color: #898498;
            font-size: 12px;
        }

        /* Attendance form */
        .form-card {
            display: none;
            padding: 25px;
            margin-bottom: 25px;
            background: white;
            border: 1px solid #eceaf1;
            border-radius: 15px;
        }

        .form-card.show {
            display: block;
        }

        .form-heading {
            display: flex;
            justify-content: space-between;
            align-items: center;
            gap: 12px;
            margin-bottom: 23px;
        }

        .form-heading h3 {
            font-size: 19px;
        }

        .form-heading p {
            margin-top: 6px;
            color: #888397;
            font-size: 12px;
        }

        .form-grid {
            display: grid;
            grid-template-columns: repeat(2, minmax(0, 1fr));
            gap: 20px;
        }

        .form-field {
            min-width: 0;
        }

        .form-field label {
            display: block;
            margin-bottom: 8px;
            font-size: 12px;
            font-weight: 700;
            color: #5b566c;
        }

        .form-field input,
        .form-field select {
            display: block;
            width: 100%;
            min-width: 0;
            height: 45px;
            padding: 12px 13px;
            border: 1px solid #e5e1ed;
            border-radius: 10px;
            outline: none;
            background: white;
            color: #29263b;
            font-family: inherit;
            font-size: 13px;
        }

        .form-field input:focus,
        .form-field select:focus {
            border-color: #a855f7;
            box-shadow: 0 0 0 3px #f3e8ff;
        }

        .form-field input::placeholder {
            color: #aaa5b7;
        }

        .form-actions {
            display: flex;
            gap: 10px;
            flex-wrap: wrap;
            margin-top: 23px;
        }

        /* Search and filters */
        .toolbar {
            display: flex;
            justify-content: space-between;
            align-items: center;
            gap: 15px;
            flex-wrap: wrap;
            margin-bottom: 18px;
        }

        .search-box {
            display: flex;
            align-items: center;
            gap: 10px;
            width: 350px;
            max-width: 100%;
            padding: 0 14px;
            background: white;
            border: 1px solid #e5e1ed;
            border-radius: 10px;
        }

        .search-box span {
            flex: 0 0 auto;
            font-size: 16px;
        }

        .search-box input {
            width: 100%;
            min-width: 0;
            padding: 13px 0;
            border: none;
            outline: none;
            background: transparent;
            font: inherit;
            font-size: 13px;
        }

        .filters {
            display: flex;
            gap: 10px;
            flex-wrap: wrap;
        }

        .filters select {
            max-width: 100%;
            padding: 12px;
            border: 1px solid #e5e1ed;
            border-radius: 10px;
            background: white;
            color: #5d596e;
            font-size: 12px;
        }

        /* Status tabs */
        .tabs {
            display: flex;
            gap: 5px;
            padding: 5px;
            margin-bottom: 20px;
            background: white;
            border: 1px solid #eceaf1;
            border-radius: 12px;
            overflow-x: auto;
        }

        .tab {
            padding: 11px 17px;
            border: none;
            border-radius: 9px;
            background: transparent;
            color: #777187;
            font-size: 12px;
            font-weight: 650;
            cursor: pointer;
            white-space: nowrap;
        }

        .tab.active {
            background: #a855f7;
            color: white;
        }

        /* Table */
        .table-card {
            background: white;
            border: 1px solid #eceaf1;
            border-radius: 15px;
            overflow: hidden;
        }

        .table-heading {
            display: flex;
            align-items: center;
            justify-content: space-between;
            gap: 12px;
            padding: 22px;
            border-bottom: 1px solid #eceaf1;
        }

        .table-heading h3 {
            margin-bottom: 6px;
            font-size: 17px;
        }

        .table-heading p {
            color: #888397;
            font-size: 12px;
        }

        .record-count {
            color: #9333ea;
            background: #f3e8ff;
            padding: 8px 12px;
            border-radius: 20px;
            font-size: 12px;
            white-space: nowrap;
        }

        .table-wrapper {
            overflow-x: auto;
        }

        table {
            width: 100%;
            min-width: 950px;
            border-collapse: collapse;
        }

        th, td {
            padding: 16px 14px;
            text-align: left;
            border-bottom: 1px solid #efedf3;
            font-size: 12px;
            vertical-align: middle;
        }

        th {
            background: #faf9fc;
            color: #777187;
            font-size: 11px;
            font-weight: 750;
            text-transform: uppercase;
            letter-spacing: 0.4px;
            white-space: nowrap;
        }

        td {
            color: #504c61;
        }

        tbody tr:hover {
            background: #fcfaff;
        }

        .record-id {
            color: #9333ea;
            font-weight: 750;
        }

        .employee-name {
            color: #29263b;
            font-weight: 700;
        }

        .status-badge {
            display: inline-block;
            padding: 6px 10px;
            background: #f1eff5;
            color: #777187;
            border-radius: 20px;
            font-size: 11px;
            font-weight: 700;
            white-space: nowrap;
        }

        .status-present {
            background: #ecfdf3;
            color: #16804a;
        }

        .status-absent {
            background: #fff1f2;
            color: #be123c;
        }

        .status-leave {
            background: #fff7df;
            color: #9a6a00;
        }

        .actions {
            display: flex;
            align-items: center;
            gap: 7px;
            white-space: nowrap;
        }

        .edit-btn,
        .delete-btn {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            padding: 8px 11px;
            border: none;
            border-radius: 7px;
            font-family: inherit;
            font-size: 11px;
            font-weight: 700;
            cursor: pointer;
        }

        .edit-btn {
            background: #f3e8ff;
            color: #9333ea;
        }

        .edit-btn:hover {
            background: #e9d5ff;
        }

        .delete-btn {
            background: #fff1f2;
            color: #be123c;
        }

        .delete-btn:hover {
            background: #ffe0e4;
        }

        .delete-form {
            display: inline-flex;
            margin: 0;
        }

        .empty-state {
            padding: 35px !important;
            text-align: center;
            color: #888397;
        }

        .table-footer {
            padding: 17px 22px;
            display: flex;
            justify-content: space-between;
            gap: 12px;
            color: #888397;
            font-size: 12px;
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
                padding: 20px;
            }

            .summary-grid {
                grid-template-columns: repeat(2, minmax(0, 1fr));
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
                padding: 15px;
            }

            .content {
                padding: 16px;
            }

            .summary-grid,
            .form-grid {
                grid-template-columns: 1fr;
            }

            .search-box {
                width: 100%;
            }

            .filters {
                width: 100%;
            }

            .filters select {
                flex: 1;
                min-width: 0;
            }

            .page-heading h1 {
                font-size: 23px;
            }

            .welcome-banner {
                padding: 20px;
            }
        }

        @media (max-width: 450px) {
            .user-badge {
                font-size: 10px;
                padding: 8px 10px;
            }

            .banner-icon {
                display: none;
            }

            .page-heading > div:last-child {
                width: 100%;
            }

            .page-heading .btn {
                width: 100%;
                margin-top: 8px;
            }

            .form-card {
                padding: 17px;
            }

            .table-heading {
                padding: 16px;
            }

            .table-footer {
                padding: 14px 16px;
                flex-wrap: wrap;
            }
        }

        @media print {
            .sidebar,
            .topbar,
            .heading-actions,
            .form-card,
            .toolbar,
            .tabs,
            .actions {
                display: none !important;
            }

            .main {
                width: 100%;
                margin: 0;
            }

            .content {
                padding: 0;
            }
        }
    </style>
</head>

<body>

<div class="layout">

    <!-- SIDEBAR -->
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

        <a class="nav-link"
           href="${pageContext.request.contextPath}/employees">
            <span class="nav-icon">&#128100;</span> Staff Management
        </a>

        <a class="nav-link active"
           href="${pageContext.request.contextPath}/attendance">
            <span class="nav-icon">&#128203;</span> Attendance
        </a>

        <a class="nav-link"
           href="${pageContext.request.contextPath}/leaves">
            <span class="nav-icon">&#128197;</span> Leaves
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
                HR &nbsp; &#8250; &nbsp;
                <strong>Attendance Management</strong>
            </div>

            <div class="user-badge">
                &#10022; HR Workspace
            </div>
        </header>

        <section class="content">

            <!-- PAGE HEADER -->
            <div class="page-heading">
                <div>
                    <h1>Attendance Management</h1>
                    <p>Track employee attendance and manage daily records.</p>
                </div>

                <div>
                    <button type="button" class="btn"
                            onclick="window.print()">
                        Print
                    </button>

                    <button type="button" class="btn btn-primary"
                            onclick="toggleAttendanceForm()">
                        + Mark Attendance
                    </button>
                </div>
            </div>

            <!-- MESSAGES -->
            <c:if test="${not empty successMessage}">
                <div class="message success" role="status">
                    <c:out value="${successMessage}"/>
                </div>
            </c:if>

            <c:if test="${not empty errorMessage}">
                <div class="message error" role="alert">
                    <c:out value="${errorMessage}"/>
                </div>
            </c:if>

            <!-- BANNER -->
            <section class="welcome-banner">
                <div>
                    <h2>Employee Attendance Center</h2>
                    <p>Monitor attendance, review daily records, and keep employee details organized.</p>
                </div>

                <div class="banner-icon" aria-hidden="true">
                    &#128203;
                </div>
            </section>

            <!-- SUMMARY -->
            <div class="summary-grid">

                <div class="summary-card">
                    <div class="summary-title">
                        <span>Total Records</span>
                        <span class="summary-icon">&#128203;</span>
                    </div>
                    <div class="summary-value" id="totalCount">0</div>
                    <div class="summary-note">All attendance records</div>
                </div>

                <div class="summary-card">
                    <div class="summary-title">
                        <span>Present</span>
                        <span class="summary-icon">&#10003;</span>
                    </div>
                    <div class="summary-value" id="presentCount">0</div>
                    <div class="summary-note">Records marked present</div>
                </div>

                <div class="summary-card">
                    <div class="summary-title">
                        <span>Absent / Leave</span>
                        <span class="summary-icon">&#9203;</span>
                    </div>
                    <div class="summary-value" id="otherCount">0</div>
                    <div class="summary-note">Records marked absent or leave</div>
                </div>

            </div>

            <!-- ADD ATTENDANCE FORM -->
            <section class="form-card" id="attendanceForm">

                <div class="form-heading">
                    <div>
                        <h3>Mark Attendance</h3>
                        <p>Enter employee details and attendance status.</p>
                    </div>

                    <button type="button" class="btn"
                            onclick="toggleAttendanceForm()">
                        Close
                    </button>
                </div>

                <form action="${pageContext.request.contextPath}/attendance/add"
                      method="post" id="attendanceEntryForm">

                    <div class="form-grid">

                        <div class="form-field">
                            <label for="employeeId">Employee ID</label>
                            <input type="number"
                                   id="employeeId"
                                   name="employeeId"
                                   min="1"
                                   placeholder="Enter employee ID"
                                   required>
                        </div>

                        <div class="form-field">
                            <label for="employeeName">Employee Name</label>
                            <input type="text"
                                   id="employeeName"
                                   name="employeeName"
                                   placeholder="Enter employee name"
                                   required>
                        </div>

                        <div class="form-field">
                            <label for="attendanceDate">Attendance Date</label>
                            <input type="date"
                                   id="attendanceDate"
                                   name="attendanceDate"
                                   required>
                        </div>

                        <div class="form-field">
                            <label for="status">Attendance Status</label>
                            <select id="status" name="status" required>
                                <option value="Present">Present</option>
                                <option value="Absent">Absent</option>
                                <option value="Leave">Leave</option>
                            </select>
                        </div>

                    </div>

                    <div class="form-actions">
                        <button type="submit" class="btn btn-primary">
                            Save Attendance
                        </button>

                        <button type="reset" class="btn">
                            Clear Form
                        </button>
                    </div>
                </form>
            </section>

            <!-- SEARCH AND FILTER -->
            <div class="toolbar">

                <div class="search-box">
                    <span aria-hidden="true">&#128269;</span>
                    <input type="search"
                           id="attendanceSearch"
                           placeholder="Search employee or ID..."
                           oninput="filterAttendance()">
                </div>

                <div class="filters">
                    <select id="attendanceStatusFilter"
                            onchange="selectStatusFromFilter()">
                        <option value="">All Statuses</option>
                        <option value="present">Present</option>
                        <option value="absent">Absent</option>
                        <option value="leave">Leave</option>
                    </select>
                </div>
            </div>

            <!-- STATUS TABS -->
            <div class="tabs">

                <button type="button" class="tab active"
                        data-status=""
                        onclick="selectStatus(this)">
                    All Records
                </button>

                <button type="button" class="tab"
                        data-status="present"
                        onclick="selectStatus(this)">
                    Present
                </button>

                <button type="button" class="tab"
                        data-status="absent"
                        onclick="selectStatus(this)">
                    Absent
                </button>

                <button type="button" class="tab"
                        data-status="leave"
                        onclick="selectStatus(this)">
                    Leave
                </button>

            </div>

            <!-- ATTENDANCE TABLE -->
            <section class="table-card">

                <div class="table-heading">
                    <div>
                        <h3>Attendance Records</h3>
                        <p>View and manage employee attendance details.</p>
                    </div>

                    <span class="record-count" id="attendanceCount">
                        0 Records
                    </span>
                </div>

                <div class="table-wrapper">
                    <table id="attendanceTable">

                        <thead>
                        <tr>
                            <th>ID</th>
                            <th>Employee ID</th>
                            <th>Employee Name</th>
                            <th>Attendance Date</th>
                            <th>Status</th>
                            <th>Actions</th>
                        </tr>
                        </thead>

                        <tbody>

                        <c:forEach var="item" items="${attendanceList}">
                            <tr class="attendance-row">

                                <td class="record-id">
                                    <c:out value="${item.id}"/>
                                </td>

                                <td>
                                    <c:out value="${item.employeeId}"/>
                                </td>

                                <td class="employee-name">
                                    <c:out value="${item.employeeName}"/>
                                </td>

                                <td>
                                    <c:out value="${item.attendanceDate}"/>
                                </td>

                                <td class="status-cell">
                                    <c:choose>
                                        <c:when test="${item.status eq 'Present'}">
                                            <span class="status-badge status-present">
                                                <c:out value="${item.status}"/>
                                            </span>
                                        </c:when>

                                        <c:when test="${item.status eq 'Absent'}">
                                            <span class="status-badge status-absent">
                                                <c:out value="${item.status}"/>
                                            </span>
                                        </c:when>

                                        <c:when test="${item.status eq 'Leave'}">
                                            <span class="status-badge status-leave">
                                                <c:out value="${item.status}"/>
                                            </span>
                                        </c:when>

                                        <c:otherwise>
                                            <span class="status-badge">
                                                <c:out value="${item.status}"/>
                                            </span>
                                        </c:otherwise>
                                    </c:choose>
                                </td>

                                <td>
                                    <div class="actions">

                                        <a class="edit-btn"
                                           href="${pageContext.request.contextPath}/attendance/edit/${item.id}">
                                            Edit
                                        </a>

                                        <form class="delete-form"
                                              action="${pageContext.request.contextPath}/attendance/delete/${item.id}"
                                              method="post"
                                              onsubmit="return confirm('Delete this attendance record?');">

                                            <button type="submit" class="delete-btn">
                                                Delete
                                            </button>

                                        </form>
                                    </div>
                                </td>
                            </tr>
                        </c:forEach>

                        <c:if test="${empty attendanceList}">
                            <tr>
                                <td colspan="6" class="empty-state">
                                    No attendance records found. Add your first attendance record.
                                </td>
                            </tr>
                        </c:if>

                        </tbody>
                    </table>
                </div>

                <div class="table-footer">
                    <span id="tableResult">Attendance records</span>
                    <span>PeopleFlow HRM System</span>
                </div>

            </section>

        </section>
    </main>

</div>

<script>
    function toggleAttendanceForm() {
        const form = document.getElementById("attendanceForm");
        form.classList.toggle("show");

        if (form.classList.contains("show")) {
            form.scrollIntoView({
                behavior: "smooth",
                block: "start"
            });
        }
    }

    function selectStatus(button) {
        document.querySelectorAll(".tab").forEach(function(tab) {
            tab.classList.remove("active");
        });

        button.classList.add("active");

        document.getElementById("attendanceStatusFilter").value =
            button.getAttribute("data-status");

        filterAttendance();
    }

    function selectStatusFromFilter() {
        const status =
            document.getElementById("attendanceStatusFilter").value;

        document.querySelectorAll(".tab").forEach(function(tab) {
            tab.classList.toggle(
                "active",
                tab.getAttribute("data-status") === status
            );
        });

        filterAttendance();
    }

    function filterAttendance() {
        const search = document.getElementById("attendanceSearch")
            .value.toLowerCase().trim();

        const status = document.getElementById("attendanceStatusFilter")
            .value.toLowerCase();

        const rows = document.querySelectorAll(
            "#attendanceTable tbody tr.attendance-row"
        );

        let visibleCount = 0;

        rows.forEach(function(row) {
            const rowText = row.innerText.toLowerCase();

            const statusText = row.querySelector(".status-cell")
                .innerText.toLowerCase().trim();

            const matchesSearch = rowText.includes(search);
            const matchesStatus = !status || statusText === status;

            const visible = matchesSearch && matchesStatus;

            row.style.display = visible ? "" : "none";

            if (visible) {
                visibleCount++;
            }
        });

        document.getElementById("attendanceCount").innerText =
            visibleCount + " Record(s)";

        document.getElementById("tableResult").innerText =
            "Showing " + visibleCount + " record(s)";
    }

    function updateSummary() {
        const rows = document.querySelectorAll(
            "#attendanceTable tbody tr.attendance-row"
        );

        let total = 0;
        let present = 0;
        let other = 0;

        rows.forEach(function(row) {
            total++;

            const status = row.querySelector(".status-cell")
                .innerText.toLowerCase().trim();

            if (status === "present") {
                present++;
            } else if (status === "absent" || status === "leave") {
                other++;
            }
        });

        document.getElementById("totalCount").innerText = total;
        document.getElementById("presentCount").innerText = present;
        document.getElementById("otherCount").innerText = other;
    }

    document.addEventListener("DOMContentLoaded", function() {
        updateSummary();
        filterAttendance();

        const attendanceDate = document.getElementById("attendanceDate");

        // Default the date to today when adding an attendance record.
        if (attendanceDate && !attendanceDate.value) {
            const today = new Date();
            const localDate = new Date(
                today.getTime() - today.getTimezoneOffset() * 60000
            ).toISOString().split("T")[0];

            attendanceDate.value = localDate;
        }
    });
</script>

</body>
</html>
