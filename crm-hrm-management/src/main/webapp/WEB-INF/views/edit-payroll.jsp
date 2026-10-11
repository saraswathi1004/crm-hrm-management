
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Edit Payroll</title>

    <style>
        body {
            font-family: Arial, sans-serif;
            background: #f4f7fb;
            padding: 30px;
        }

        .container {
            max-width: 650px;
            margin: auto;
            background: white;
            padding: 25px;
            border-radius: 10px;
            box-shadow: 0 2px 8px #ddd;
        }

        h1 { color: #17365d; }

        label {
            display: block;
            margin-top: 14px;
            margin-bottom: 6px;
        }

        input, select {
            box-sizing: border-box;
            width: 100%;
            padding: 11px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        button, a {
            display: inline-block;
            margin-top: 20px;
            padding: 11px 16px;
            border: none;
            border-radius: 5px;
            background: #1769aa;
            color: white;
            text-decoration: none;
            cursor: pointer;
        }

        a { background: #666; }
    </style>
</head>

<body>
<div class="container">

    <h1>Edit Payroll</h1>

    <form action="${pageContext.request.contextPath}/payroll/update/${payroll.id}"
          method="post">

        <label>Employee ID</label>
        <input type="number" name="employeeId"
               value="${payroll.employeeId}" min="1" required>

        <label>Employee Name</label>
        <input type="text" name="employeeName"
               value="${payroll.employeeName}" required>

        <label>Basic Salary</label>
        <input type="number" name="basicSalary"
               value="${payroll.basicSalary}" min="0"
               step="0.01" required>

        <label>Allowance</label>
        <input type="number" name="allowance"
               value="${payroll.allowance}" min="0"
               step="0.01" required>

        <label>Deduction</label>
        <input type="number" name="deduction"
               value="${payroll.deduction}" min="0"
               step="0.01" required>

        <label>Payment Date</label>
        <input type="date" name="paymentDate"
               value="${payroll.paymentDate}" required>

        <label>Payment Status</label>
        <select name="paymentStatus" required>
            <option value="Pending"
                ${payroll.paymentStatus == 'Pending' ? 'selected' : ''}>
                Pending
            </option>
            <option value="Paid"
                ${payroll.paymentStatus == 'Paid' ? 'selected' : ''}>
                Paid
            </option>
        </select>

        <button type="submit">Update Payroll</button>

        <a href="${pageContext.request.contextPath}/payroll">
            Cancel
        </a>

    </form>

</div>
</body>
</html>
