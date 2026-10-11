<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Leave Request</title>

    <style>
        * { box-sizing: border-box; }

        body {
            margin: 0;
            padding: 30px;
            font-family: Arial, sans-serif;
            background: #f1f5f9;
            color: #1e293b;
        }

        .container {
            max-width: 750px;
            margin: auto;
        }

        .header {
            background: #1d4ed8;
            color: white;
            padding: 22px;
            border-radius: 10px;
            margin-bottom: 25px;
        }

        .card {
            background: white;
            padding: 25px;
            border-radius: 10px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.06);
        }

        .form-group { margin-bottom: 18px; }

        label {
            display: block;
            font-weight: bold;
            margin-bottom: 7px;
        }

        input, select, textarea {
            width: 100%;
            padding: 11px;
            border: 1px solid #cbd5e1;
            border-radius: 5px;
            font-family: inherit;
        }

        textarea {
            min-height: 80px;
            resize: vertical;
        }

        button, .cancel-btn {
            display: inline-block;
            padding: 11px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            text-decoration: none;
            color: white;
        }

        .update-btn { background: #15803d; }
        .cancel-btn { background: #64748b; margin-left: 8px; }
    </style>
</head>

<body>
<div class="container">

    <div class="header">
        <h2>Edit Leave Request</h2>
        <p>Update leave details and approval status.</p>
    </div>

    <div class="card">
        <form action="${pageContext.request.contextPath}/leaves/update/${leave.id}"
              method="post">

            <div class="form-group">
                <label>Employee ID</label>
                <input type="number" name="employeeId"
                       min="1" value="${leave.employeeId}" required>
            </div>

            <div class="form-group">
                <label>Employee Name</label>
                <input type="text" name="employeeName"
                       value="<c:out value='${leave.employeeName}'/>"
                       required>
            </div>

            <div class="form-group">
                <label>Leave Type</label>
                <select name="leaveType" required>
                    <option value="Casual"
                        ${leave.leaveType == 'Casual' ? 'selected' : ''}>
                        Casual Leave
                    </option>
                    <option value="Sick"
                        ${leave.leaveType == 'Sick' ? 'selected' : ''}>
                        Sick Leave
                    </option>
                    <option value="Earned"
                        ${leave.leaveType == 'Earned' ? 'selected' : ''}>
                        Earned Leave
                    </option>
                    <option value="Other"
                        ${leave.leaveType == 'Other' ? 'selected' : ''}>
                        Other
                    </option>
                </select>
            </div>

            <div class="form-group">
                <label>From Date</label>
                <input type="date" name="fromDate"
                       value="${leave.fromDate}" required>
            </div>

            <div class="form-group">
                <label>To Date</label>
                <input type="date" name="toDate"
                       value="${leave.toDate}" required>
            </div>

            <div class="form-group">
                <label>Reason</label>
                <textarea name="reason" required><c:out value="${leave.reason}"/></textarea>
            </div>

            <div class="form-group">
                <label>Leave Status</label>
                <select name="status" required>
                    <option value="Pending"
                        ${leave.status == 'Pending' ? 'selected' : ''}>
                        Pending
                    </option>
                    <option value="Approved"
                        ${leave.status == 'Approved' ? 'selected' : ''}>
                        Approved
                    </option>
                    <option value="Rejected"
                        ${leave.status == 'Rejected' ? 'selected' : ''}>
                        Rejected
                    </option>
                </select>
            </div>

            <button type="submit" class="update-btn">
                Update Leave
            </button>

            <a href="${pageContext.request.contextPath}/leaves"
               class="cancel-btn">Cancel</a>
        </form>
    </div>

</div>
</body>
</html>