<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Attendance</title>

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

        input, select {
            width: 100%;
            padding: 11px;
            border: 1px solid #cbd5e1;
            border-radius: 5px;
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
        <h2>Edit Attendance</h2>
        <p>Update the attendance record.</p>
    </div>

    <div class="card">
        <form action="${pageContext.request.contextPath}/attendance/update/${attendance.id}"
              method="post">

            <div class="form-group">
                <label>Employee ID</label>
                <input type="number" name="employeeId"
                       min="1" value="${attendance.employeeId}" required>
            </div>

            <div class="form-group">
                <label>Employee Name</label>
                <input type="text" name="employeeName"
                       value="<c:out value='${attendance.employeeName}'/>"
                       required>
            </div>

            <div class="form-group">
                <label>Attendance Date</label>
                <input type="date" name="attendanceDate"
                       value="${attendance.attendanceDate}" required>
            </div>

            <div class="form-group">
                <label>Status</label>
                <select name="status" required>
                    <option value="Present"
                        ${attendance.status == 'Present' ? 'selected' : ''}>
                        Present
                    </option>

                    <option value="Absent"
                        ${attendance.status == 'Absent' ? 'selected' : ''}>
                        Absent
                    </option>

                    <option value="Leave"
                        ${attendance.status == 'Leave' ? 'selected' : ''}>
                        Leave
                    </option>
                </select>
            </div>

            <button type="submit" class="update-btn">
                Update Attendance
            </button>

            <a href="${pageContext.request.contextPath}/attendance"
               class="cancel-btn">Cancel</a>
        </form>
    </div>

</div>
</body>
</html>