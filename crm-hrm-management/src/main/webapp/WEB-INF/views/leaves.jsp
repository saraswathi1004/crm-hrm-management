<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Leave Management</title>

    <style>
        * { box-sizing: border-box; }

        body {
            margin: 0;
            padding: 25px;
            font-family: Arial, sans-serif;
            background: #f1f5f9;
            color: #1e293b;
        }

        .container {
            max-width: 1150px;
            margin: auto;
        }

        .header {
            background: #1d4ed8;
            color: white;
            padding: 22px;
            border-radius: 10px;
            margin-bottom: 25px;
        }

        .header h2 { margin-top: 0; }

        .back-link {
            color: white;
            text-decoration: none;
        }

        .card {
            background: white;
            padding: 25px;
            border-radius: 10px;
            margin-bottom: 25px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.06);
        }

        .form-grid {
            display: grid;
            grid-template-columns: repeat(2, 1fr);
            gap: 18px;
        }

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

        button, .edit-btn {
            padding: 9px 14px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            color: white;
            text-decoration: none;
        }

        .add-btn { background: #15803d; margin-top: 20px; }
        .edit-btn { background: #2563eb; }
        .delete-btn { background: #dc2626; }

        .table-wrapper { overflow-x: auto; }

        table {
            width: 100%;
            min-width: 900px;
            border-collapse: collapse;
        }

        th, td {
            padding: 12px;
            text-align: left;
            border-bottom: 1px solid #e2e8f0;
        }

        th { background: #dbeafe; }

        .message {
            padding: 12px;
            margin-bottom: 15px;
            border-radius: 5px;
        }

        .success { background: #dcfce7; color: #166534; }
        .error { background: #fee2e2; color: #991b1b; }

        .delete-form { display: inline; }

        @media (max-width: 650px) {
            .form-grid { grid-template-columns: 1fr; }
        }
    </style>
</head>

<body>
<div class="container">

    <div class="header">
        <h2>Leave Management</h2>
        <p>Submit and manage employee leave requests.</p>
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
        <h3>Add Leave Request</h3>

        <form action="${pageContext.request.contextPath}/leaves/add"
              method="post">

            <div class="form-grid">
                <div>
                    <label>Employee ID</label>
                    <input type="number" name="employeeId"
                           min="1" placeholder="Enter employee ID" required>
                </div>

                <div>
                    <label>Employee Name</label>
                    <input type="text" name="employeeName"
                           placeholder="Enter employee name" required>
                </div>

                <div>
                    <label>Leave Type</label>
                    <select name="leaveType" required>
                        <option value="Casual">Casual Leave</option>
                        <option value="Sick">Sick Leave</option>
                        <option value="Earned">Earned Leave</option>
                        <option value="Other">Other</option>
                    </select>
                </div>

                <div>
                    <label>From Date</label>
                    <input type="date" name="fromDate" required>
                </div>

                <div>
                    <label>To Date</label>
                    <input type="date" name="toDate" required>
                </div>

                <div>
                    <label>Reason</label>
                    <textarea name="reason"
                              placeholder="Enter leave reason"
                              required></textarea>
                </div>
            </div>

            <button type="submit" class="add-btn">
                Submit Leave Request
            </button>
        </form>
    </div>

    <div class="card">
        <h3>Leave Requests</h3>

        <div class="table-wrapper">
            <table>
                <thead>
                <tr>
                    <th>ID</th>
                    <th>Employee ID</th>
                    <th>Employee Name</th>
                    <th>Leave Type</th>
                    <th>From Date</th>
                    <th>To Date</th>
                    <th>Reason</th>
                    <th>Status</th>
                    <th>Actions</th>
                </tr>
                </thead>

                <tbody>
                <c:forEach var="item" items="${leaveList}">
                    <tr>
                        <td><c:out value="${item.id}"/></td>
                        <td><c:out value="${item.employeeId}"/></td>
                        <td><c:out value="${item.employeeName}"/></td>
                        <td><c:out value="${item.leaveType}"/></td>
                        <td><c:out value="${item.fromDate}"/></td>
                        <td><c:out value="${item.toDate}"/></td>
                        <td><c:out value="${item.reason}"/></td>
                        <td><c:out value="${item.status}"/></td>
                        <td>
                            <a class="edit-btn"
                               href="${pageContext.request.contextPath}/leaves/edit/${item.id}">
                                Edit
                            </a>

                            <form class="delete-form"
                                  action="${pageContext.request.contextPath}/leaves/delete/${item.id}"
                                  method="post"
                                  onsubmit="return confirm('Delete this leave request?');">
                                <button class="delete-btn" type="submit">
                                    Delete
                                </button>
                            </form>
                        </td>
                    </tr>
                </c:forEach>

                <c:if test="${empty leaveList}">
                    <tr>
                        <td colspan="9" style="text-align:center;">
                            No leave requests found.
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