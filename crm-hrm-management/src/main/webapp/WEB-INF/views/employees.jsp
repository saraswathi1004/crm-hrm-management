
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html>
<head>
    <title>Employee Management</title>

    <style>
        * {
            box-sizing: border-box;
        }

        body {
            margin: 0;
            padding: 25px;
            font-family: Arial, sans-serif;
            background: #f3f6fa;
            color: #263238;
        }

        .container {
            max-width: 1200px;
            margin: auto;
        }

        .header {
            background: #00897b;
            color: white;
            padding: 20px 25px;
            border-radius: 10px;
            margin-bottom: 25px;
        }

        .header h2 {
            margin: 0 0 8px;
        }

        .back-link {
            display: inline-block;
            color: white;
            text-decoration: none;
            margin-top: 10px;
        }

        .card {
            background: white;
            padding: 25px;
            border-radius: 10px;
            margin-bottom: 25px;
            box-shadow: 0 3px 12px rgba(0,0,0,0.07);
        }

        .form-grid {
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            gap: 16px;
        }

        label {
            display: block;
            font-weight: bold;
            margin-bottom: 7px;
        }

        input, select {
            width: 100%;
            padding: 11px;
            border: 1px solid #ccd3da;
            border-radius: 5px;
            font-size: 14px;
        }

        .add-btn {
            margin-top: 20px;
            background: #00897b;
            color: white;
            padding: 12px 25px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        .table-wrapper {
            overflow-x: auto;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            min-width: 850px;
        }

        th, td {
            padding: 12px;
            border-bottom: 1px solid #e5e7eb;
            text-align: left;
        }

        th {
            background: #e0f2f1;
        }

        .edit-btn, .delete-btn {
            display: inline-block;
            padding: 7px 11px;
            border-radius: 4px;
            text-decoration: none;
            border: none;
            cursor: pointer;
            color: white;
        }

        .edit-btn {
            background: #1976d2;
        }

        .delete-btn {
            background: #d32f2f;
        }

        .message {
            padding: 12px;
            margin-bottom: 15px;
            border-radius: 5px;
        }

        .success {
            background: #d4edda;
            color: #155724;
        }

        .error {
            background: #f8d7da;
            color: #721c24;
        }

        .delete-form {
            display: inline;
        }

        @media (max-width: 750px) {
            .form-grid {
                grid-template-columns: 1fr;
            }
        }
    </style>
</head>

<body>
<div class="container">

    <div class="header">
        <h2>Employee Management</h2>
        <p>Add, view, update and delete employee details.</p>
        <a class="back-link"
           href="${pageContext.request.contextPath}/hrm-dashboard">
            &#8592; Back to HRM Dashboard
        </a>
    </div>

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

    <div class="card">
        <h3>Add New Employee</h3>

        <form action="${pageContext.request.contextPath}/employees/add"
              method="post">

            <div class="form-grid">

                <div>
                    <label>Employee Name</label>
                    <input type="text" name="employeeName"
                           placeholder="Enter employee name" required>
                </div>

                <div>
                    <label>Email</label>
                    <input type="email" name="email"
                           placeholder="Enter email" required>
                </div>

                <div>
                    <label>Phone</label>
                    <input type="text" name="phone"
                           placeholder="Enter phone number" required>
                </div>

                <div>
                    <label>Department</label>
                    <input type="text" name="department"
                           placeholder="e.g. IT" required>
                </div>

                <div>
                    <label>Designation</label>
                    <input type="text" name="designation"
                           placeholder="e.g. Java Developer" required>
                </div>

                <div>
                    <label>Salary</label>
                    <input type="number" name="salary"
                           min="0" step="0.01"
                           placeholder="Enter salary" required>
                </div>

                <div>
                    <label>Joining Date</label>
                    <input type="date" name="joiningDate" required>
                </div>

                <div>
                    <label>Status</label>
                    <select name="status" required>
                        <option value="Active">Active</option>
                        <option value="Inactive">Inactive</option>
                    </select>
                </div>

            </div>

            <button type="submit" class="add-btn">
                Add Employee
            </button>
        </form>
    </div>

    <div class="card">
        <h3>Employee List</h3>

        <div class="table-wrapper">
            <table>
                <thead>
                <tr>
                    <th>ID</th>
                    <th>Name</th>
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
                    <tr>
                        <td><c:out value="${item.id}"/></td>
                        <td><c:out value="${item.employeeName}"/></td>
                        <td><c:out value="${item.email}"/></td>
                        <td><c:out value="${item.phone}"/></td>
                        <td><c:out value="${item.department}"/></td>
                        <td><c:out value="${item.designation}"/></td>
                        <td><c:out value="${item.salary}"/></td>
                        <td><c:out value="${item.joiningDate}"/></td>
                        <td><c:out value="${item.status}"/></td>
                        <td>
                            <a class="edit-btn"
                               href="${pageContext.request.contextPath}/employees/edit/${item.id}">
                                Edit
                            </a>

                            <form class="delete-form"
                                  action="${pageContext.request.contextPath}/employees/delete/${item.id}"
                                  method="post"
                                  onsubmit="return confirm('Are you sure you want to delete this employee?');">
                                <button class="delete-btn" type="submit">
                                    Delete
                                </button>
                            </form>
                        </td>
                    </tr>
                </c:forEach>

                <c:if test="${empty employees}">
                    <tr>
                        <td colspan="10" style="text-align:center;">
                            No employees found. Add your first employee above.
                        </td>
                    </tr>
                </c:if>
                </tbody>
            </table>
        </div>
    </div>

</div>
</body>
</html>