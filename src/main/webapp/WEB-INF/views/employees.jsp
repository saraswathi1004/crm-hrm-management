
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Staff Management | PeopleFlow</title>

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
            background: #fff;
            border-right: 1px solid #eceaf1;
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
            background: #f3e8ff;
            color: #9333ea;
            border-radius: 12px;
            font-size: 22px;
            font-weight: bold;
        }

        .brand h2 {
            font-size: 21px;
            color: #29263b;
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
        }

        .heading-actions {
            display: flex;
            gap: 10px;
            flex-wrap: wrap;
        }

        .btn {
            padding: 12px 17px;
            border: 1px solid #e7e3ed;
            border-radius: 10px;
            background: white;
            color: #514c61;
            font-weight: 600;
            cursor: pointer;
            font-size: 13px;
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

        /* Summary */

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
            flex-shrink: 0;
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

        /* Add Employee Form */

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

        .form-grid {
            display: grid;
            grid-template-columns: repeat(3, minmax(0, 1fr));
            gap: 20px;
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
            width: 100%;
            padding: 12px 13px;
            border: 1px solid #e5e1ed;
            border-radius: 10px;
            outline: none;
            background: white;
            font-size: 13px;
            color: #29263b;
        }

        .form-field input:focus,
        .form-field select:focus {
            border-color: #a855f7;
            box-shadow: 0 0 0 3px #f3e8ff;
        }

        .form-actions {
            display: flex;
            gap: 10px;
            flex-wrap: wrap;
            margin-top: 23px;
        }

        /* Search and Filters */

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

        .search-box input {
            width: 100%;
            min-width: 0;
            padding: 13px 0;
            border: none;
            outline: none;
            background: transparent;
            font-size: 13px;
        }

        .filters {
            display: flex;
            gap: 10px;
            flex-wrap: wrap;
        }

        .filters select {
            padding: 12px;
            border: 1px solid #e5e1ed;
            border-radius: 10px;
            background: white;
            color: #5d596e;
            font-size: 12px;
        }

        /* Tabs */

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

        /* Employee Table */

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
            min-width: 1050px;
            border-collapse: collapse;
        }

        th, td {
            padding: 17px 15px;
            text-align: left;
            border-bottom: 1px solid #efedf3;
            font-size: 12px;
        }

        th {
            background: #faf9fc;
            color: #777187;
            font-weight: 700;
            white-space: nowrap;
        }

        td {
            color: #504c61;
        }

        tbody tr:hover {
            background: #fcfaff;
        }

        .employee-name {
            color: #29263b;
            font-weight: 700;
        }

        .status-badge {
            display: inline-block;
            padding: 6px 11px;
            background: #edf8e8;
            color: #558b35;
            border-radius: 20px;
            font-size: 11px;
            font-weight: 700;
        }

        .status-inactive {
            background: #f1eff5;
            color: #777187;
        }

        .actions {
            display: flex;
            gap: 7px;
            align-items: center;
        }

        .edit-btn,
        .delete-btn {
            display: inline-block;
            padding: 8px 11px;
            border: none;
            border-radius: 7px;
            color: white;
            font-size: 12px;
            cursor: pointer;
            white-space: nowrap;
        }

        .edit-btn {
            background: #8b5cf6;
        }

        .edit-btn:hover {
            background: #7c3aed;
        }

        .delete-btn {
            background: #ef4444;
        }

        .delete-btn:hover {
            background: #dc2626;
        }

        .delete-form {
            display: inline;
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
            flex-wrap: wrap;
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

            .form-grid {
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

            .table-heading {
                padding: 16px;
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

            .table-card {
                border: none;
            }

            table {
                min-width: 0;
            }

            th, td {
                padding: 8px;
                font-size: 10px;
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

        <a class="nav-link active"
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

    <!-- MAIN CONTENT -->
    <main class="main">

        <header class="topbar">
            <div class="breadcrumb">
                HR &nbsp; &#8250; &nbsp;
                <strong>Staff Management</strong>
            </div>

            <div class="user-badge">
                &#10022; HR Workspace
            </div>
        </header>

        <section class="content">

            <!-- PAGE HEADER -->
            <div class="page-heading">
                <div>
                    <h1>Staff Management</h1>
                    <p>Manage employee information and employment details.</p>
                </div>

                <div class="heading-actions">
                    <button type="button" class="btn"
                            onclick="window.print()">
                        Print
                    </button>

                    <button type="button" class="btn btn-primary"
                            onclick="toggleEmployeeForm()">
                        + Add Employee
                    </button>
                </div>
            </div>

            <!-- MESSAGES -->
            <c:if test="${not empty successMessage}">
                <div class="message success">
                    <c:out value="${successMessage}"/>
                </div>
            </c:if>

            <c:if test="${not empty errorMessage}">
                <div class="message error">
                    <c:out value="${errorMessage}"/>
                </div>
            </c:if>

            <!-- SUMMARY -->
            <div class="summary-grid">

                <div class="summary-card">
                    <div class="summary-title">
                        <span>Employee Directory</span>
                        <span class="summary-icon">&#128100;</span>
                    </div>
                    <div class="summary-value" id="totalEmployees">0</div>
                    <div class="summary-note">
                        Total employee records
                    </div>
                </div>

                <div class="summary-card">
                    <div class="summary-title">
                        <span>Active Employees</span>
                        <span class="summary-icon">&#10003;</span>
                    </div>
                    <div class="summary-value" id="activeEmployees">0</div>
                    <div class="summary-note">
                        Currently active staff
                    </div>
                </div>

                <div class="summary-card">
                    <div class="summary-title">
                        <span>Inactive Employees</span>
                        <span class="summary-icon">&#128100;</span>
                    </div>
                    <div class="summary-value" id="inactiveEmployees">0</div>
                    <div class="summary-note">
                        Inactive staff records
                    </div>
                </div>

            </div>

            <!-- ADD EMPLOYEE FORM -->
            <div class="form-card" id="employeeForm">

                <div class="form-heading">
                    <h3>Add New Employee</h3>
                    <button type="button" class="btn"
                            onclick="toggleEmployeeForm()">
                        Close
                    </button>
                </div>

                <form action="${pageContext.request.contextPath}/employees/add"
                      method="post">

                    <div class="form-grid">

                        <div class="form-field">
                            <label for="employeeName">Employee Name</label>
                            <input type="text" id="employeeName"
                                   name="employeeName"
                                   placeholder="Enter employee name"
                                   required>
                        </div>

                        <div class="form-field">
                            <label for="email">Email</label>
                            <input type="email" id="email" name="email"
                                   placeholder="Enter email address"
                                   required>
                        </div>

                        <div class="form-field">
                            <label for="phone">Phone</label>
                            <input type="text" id="phone" name="phone"
                                   placeholder="Enter phone number"
                                   required>
                        </div>

                        <div class="form-field">
                            <label for="department">Department</label>
                            <input type="text" id="department"
                                   name="department"
                                   placeholder="e.g. IT"
                                   required>
                        </div>

                        <div class="form-field">
                            <label for="designation">Designation</label>
                            <input type="text" id="designation"
                                   name="designation"
                                   placeholder="e.g. Java Developer"
                                   required>
                        </div>

                        <div class="form-field">
                            <label for="salary">Salary</label>
                            <input type="number" id="salary" name="salary"
                                   min="0" step="0.01"
                                   placeholder="Enter salary"
                                   required>
                        </div>

                        <div class="form-field">
                            <label for="joiningDate">Joining Date</label>
                            <input type="date" id="joiningDate"
                                   name="joiningDate" required>
                        </div>

                        <div class="form-field">
                            <label for="status">Status</label>
                            <select id="status" name="status" required>
                                <option value="Active">Active</option>
                                <option value="Inactive">Inactive</option>
                            </select>
                        </div>

                    </div>

                    <div class="form-actions">
                        <button type="submit" class="btn btn-primary">
                            Save Employee
                        </button>

                        <button type="reset" class="btn">
                            Clear
                        </button>
                    </div>

                </form>
            </div>

            <!-- SEARCH AND FILTERS -->
            <div class="toolbar">

                <div class="search-box">
                    <span>&#128269;</span>
                    <input type="search" id="employeeSearch"
                           placeholder="Search employees..."
                           oninput="filterEmployees()">
                </div>

                <div class="filters">

                    <select id="departmentFilter"
                            onchange="filterEmployees()">
                        <option value="">All Departments</option>
                    </select>

                    <select id="designationFilter"
                            onchange="filterEmployees()">
                        <option value="">All Designations</option>
                    </select>

                    <select id="statusFilter"
                            onchange="updateActiveTab(); filterEmployees()">
                        <option value="">All Statuses</option>
                        <option value="active">Active</option>
                        <option value="inactive">Inactive</option>
                    </select>

                </div>
            </div>

            <!-- STATUS TABS -->
            <div class="tabs">

                <button type="button" class="tab active"
                        data-status=""
                        onclick="selectStatus(this)">
                    All Employees
                </button>

                <button type="button" class="tab"
                        data-status="active"
                        onclick="selectStatus(this)">
                    Active
                </button>

                <button type="button" class="tab"
                        data-status="inactive"
                        onclick="selectStatus(this)">
                    Inactive
                </button>

            </div>

            <!-- EMPLOYEE TABLE -->
            <div class="table-card">

                <div class="table-heading">
                    <div>
                        <h3>Employee Directory</h3>
                        <p>View and manage your employee records.</p>
                    </div>

                    <span class="record-count" id="employeeCount">
                        0 employees
                    </span>
                </div>

                <div class="table-wrapper">

                    <table id="employeeTable">

                        <thead>
                        <tr>
                            <th>ID</th>
                            <th>Employee Name</th>
                            <th>Email</th>
                            <th>Phone</th>
                            <th>Department</th>
                            <th>Designation</th>
                            <th>Salary</th>
                            <th>Joining Date</th>
                            <th>Status</th>
                            <th>Actions</th>
                        </tr>
                        </thead>

                        <tbody>

                        <c:forEach var="item" items="${employees}">
                            <tr class="employee-row">

                                <td>
                                    <c:out value="${item.id}"/>
                                </td>

                                <td class="employee-name">
                                    <c:out value="${item.employeeName}"/>
                                </td>

                                <td>
                                    <c:out value="${item.email}"/>
                                </td>

                                <td>
                                    <c:out value="${item.phone}"/>
                                </td>

                                <td class="department-cell">
                                    <c:out value="${item.department}"/>
                                </td>

                                <td class="designation-cell">
                                    <c:out value="${item.designation}"/>
                                </td>

                                <td>
                                    <c:out value="${item.salary}"/>
                                </td>

                                <td>
                                    <c:out value="${item.joiningDate}"/>
                                </td>

                                <td class="status-cell">
                                    <c:choose>
                                        <c:when test="${item.status eq 'Active'}">
                                            <span class="status-badge">
                                                Active
                                            </span>
                                        </c:when>

                                        <c:otherwise>
                                            <span class="status-badge status-inactive">
                                                <c:out value="${item.status}"/>
                                            </span>
                                        </c:otherwise>
                                    </c:choose>
                                </td>

                                <td>
                                    <div class="actions">

                                        <a class="edit-btn"
                                           href="${pageContext.request.contextPath}/employees/edit/${item.id}">
                                            Edit
                                        </a>

                                        <form class="delete-form"
                                              action="${pageContext.request.contextPath}/employees/delete/${item.id}"
                                              method="post"
                                              onsubmit="return confirm('Are you sure you want to delete this employee?');">

                                            <button type="submit"
                                                    class="delete-btn">
                                                Delete
                                            </button>

                                        </form>

                                    </div>
                                </td>

                            </tr>
                        </c:forEach>

                        <c:if test="${empty employees}">
                            <tr>
                                <td colspan="10" class="empty-state">
                                    No employees found. Add your first employee.
                                </td>
                            </tr>
                        </c:if>

                        </tbody>
                    </table>

                </div>

                <div class="table-footer">
                    <span id="tableResult">Showing 0 employees</span>
                    <span>PeopleFlow &middot; HRM Workspace</span>
                </div>

            </div>

        </section>
    </main>

</div>

<script>
    function toggleEmployeeForm() {
        const form = document.getElementById("employeeForm");
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

        document.getElementById("statusFilter").value =
            button.getAttribute("data-status");

        filterEmployees();
    }

    function updateActiveTab() {
        const status = document.getElementById("statusFilter")
            .value.toLowerCase();

        document.querySelectorAll(".tab").forEach(function(tab) {
            tab.classList.toggle(
                "active",
                tab.getAttribute("data-status").toLowerCase() === status
            );
        });
    }

    function filterEmployees() {
        const search = document.getElementById("employeeSearch")
            .value.toLowerCase().trim();

        const department = document.getElementById("departmentFilter")
            .value.toLowerCase();

        const designation = document.getElementById("designationFilter")
            .value.toLowerCase();

        const status = document.getElementById("statusFilter")
            .value.toLowerCase();

        const rows = document.querySelectorAll(
            "#employeeTable tbody tr.employee-row"
        );

        let count = 0;

        rows.forEach(function(row) {
            const text = row.innerText.toLowerCase();

            const departmentText = row.querySelector(".department-cell")
                .innerText.toLowerCase().trim();

            const designationText = row.querySelector(".designation-cell")
                .innerText.toLowerCase().trim();

            const statusText = row.querySelector(".status-cell")
                .innerText.toLowerCase().trim();

            const matchesSearch = text.includes(search);

            const matchesDepartment =
                !department || departmentText === department;

            const matchesDesignation =
                !designation || designationText === designation;

            const matchesStatus =
                !status || statusText === status;

            const visible = matchesSearch &&
                matchesDepartment &&
                matchesDesignation &&
                matchesStatus;

            row.style.display = visible ? "" : "none";

            if (visible) {
                count++;
            }
        });

        document.getElementById("employeeCount").innerText =
            count + (count === 1 ? " employee" : " employees");

        document.getElementById("tableResult").innerText =
            "Showing " + count + (count === 1 ? " employee" : " employees");
    }

    function populateFilters() {
        const rows = document.querySelectorAll(
            "#employeeTable tbody tr.employee-row"
        );

        const departments = new Set();
        const designations = new Set();

        let total = 0;
        let active = 0;
        let inactive = 0;

        rows.forEach(function(row) {
            total++;

            const department = row.querySelector(".department-cell")
                .innerText.trim();

            const designation = row.querySelector(".designation-cell")
                .innerText.trim();

            const status = row.querySelector(".status-cell")
                .innerText.toLowerCase().trim();

            if (department) {
                departments.add(department);
            }

            if (designation) {
                designations.add(designation);
            }

            if (status === "active") {
                active++;
            } else if (status === "inactive") {
                inactive++;
            }
        });

        document.getElementById("totalEmployees").innerText = total;
        document.getElementById("activeEmployees").innerText = active;
        document.getElementById("inactiveEmployees").innerText = inactive;

        addFilterOptions("departmentFilter", departments);
        addFilterOptions("designationFilter", designations);

        filterEmployees();
    }

    function addFilterOptions(id, values) {
        const select = document.getElementById(id);

        Array.from(values).sort().forEach(function(value) {
            const option = document.createElement("option");
            option.value = value.toLowerCase();
            option.textContent = value;
            select.appendChild(option);
        });
    }

    document.addEventListener("DOMContentLoaded", function() {
        populateFilters();
    });
</script>

</body>
</html>
