
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Payroll Management</title>

    <style>
        body {
            font-family: Arial, sans-serif;
            background: #f4f7fb;
            margin: 0;
            padding: 25px;
        }

        .container {
            max-width: 1150px;
            margin: auto;
        }

        h1 { color: #17365d; }

        .form-box, .table-box {
            background: white;
            padding: 22px;
            margin-bottom: 25px;
            border-radius: 10px;
            box-shadow: 0 2px 8px #ddd;
        }

        .form-grid {
            display: grid;
            grid-template-columns: repeat(2, 1fr);
            gap: 15px;
        }

        input, select {
            box-sizing: border-box;
            width: 100%;
            padding: 11px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        button, .back {
            display: inline-block;
            padding: 10px 15px;
            border: none;
            border-radius: 5px;
            background: #1769aa;
            color: white;
            cursor: pointer;
            text-decoration: none;
        }

        .delete { background: #d93636; }
        .edit { background: #218838; }

        table {
            width: 100%;
            border-collapse: collapse;
        }

        th, td {
            padding: 11px;
            border: 1px solid #ddd;
            text-align: left;
        }

        th {
            background: #1769aa;
            color: white;
        }

        .message { color: green; }
        .error { color: red; }

        .table-wrapper { overflow-x: auto; }

        @media (max-width: 650px) {
            .form-grid { grid-template-columns: 1fr; }
        }
    </style>
</head>

<body>
<div class="container">

    <h1>Payroll Management</h1>

    <a class="back"
       href="${pageContext.request.contextPath}/hrm-dashboard">
        Back to HRM Dashboard
    </a>

    <c:if test="${not empty success}">
        <p class="message"><c:out value="${success}"/></p>
    </c:if>

    <c:if test="${not empty error}">
        <p class="error"><c:out value="${error}"/></p>
    </c:if>

    <div class="form-box">
        <h2>Add Payroll</h2>

        <form action="${pageContext.request.contextPath}/payroll/add"
              method="post">

            <div class="form-grid">
                <input type="number" name="employeeId"
                       placeholder="Employee ID" min="1" required>

                <input type="text" name="employeeName"
                       placeholder="Employee Name" required>

                <input type="number" name="basicSalary"
                       placeholder="Basic Salary" min="0"
                       step="0.01" required>

                <input type="number" name="allowance"
                       placeholder="Allowance" min="0"
                       step="0.01" value="0" required>

                <input type="number" name="deduction"
                       placeholder="Deduction" min="0"
                       step="0.01" value="0" required>

                <input type="date" name="paymentDate" required>

                <select name="paymentStatus" required>
                    <option value="Pending">Pending</option>
                    <option value="Paid">Paid</option>
                </select>
            </div>

            <br>
            <button type="submit">Add Payroll</button>
        </form>
    </div>

    <div class="table-box">
        <h2>Payroll Records</h2>

        <div class="table-wrapper">
            <table>
                <thead>
                <tr>
                    <th>ID</th>
                    <th>Employee ID</th>
                    <th>Name</th>
                    <th>Basic Salary</th>
                    <th>Allowance</th>
                    <th>Deduction</th>
                    <th>Net Salary</th>
                    <th>Payment Date</th>
                    <th>Status</th>
                    <th>Actions</th>
                </tr>
                </thead>

                <tbody>
                <c:forEach var="p" items="${payrollList}">
                    <tr>
                        <td><c:out value="${p.id}"/></td>
                        <td><c:out value="${p.employeeId}"/></td>
                        <td><c:out value="${p.employeeName}"/></td>
                        <td><c:out value="${p.basicSalary}"/></td>
                        <td><c:out value="${p.allowance}"/></td>
                        <td><c:out value="${p.deduction}"/></td>
                        <td><c:out value="${p.netSalary}"/></td>
                        <td><c:out value="${p.paymentDate}"/></td>
                        <td><c:out value="${p.paymentStatus}"/></td>
                        <td>
                            <a class="back edit"
                               href="${pageContext.request.contextPath}/payroll/edit/${p.id}">
                                Edit
                            </a>

                            <form action="${pageContext.request.contextPath}/payroll/delete/${p.id}"
                                  method="post"
                                  onsubmit="return confirm('Delete this payroll record?');"
                                  style="display:inline;">
                                <button class="delete" type="submit">
                                    Delete
                                </button>
                            </form>
                        </td>
                    </tr>
                </c:forEach>

                <c:if test="${empty payrollList}">
                    <tr>
                        <td colspan="10">No payroll records found.</td>
                    </tr>
                </c:if>
                </tbody>
            </table>
        </div>
    </div>

</div>
</body>
</html>
