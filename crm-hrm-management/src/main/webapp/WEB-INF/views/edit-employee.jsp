
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html>
<head>
    <title>Edit Employee</title>

    <style>
        * {
            box-sizing: border-box;
        }

        body {
            margin: 0;
            padding: 30px;
            font-family: Arial, sans-serif;
            background: #f3f6fa;
            color: #263238;
        }

        .container {
            max-width: 850px;
            margin: auto;
        }

        .header {
            background: #00897b;
            color: white;
            padding: 22px;
            border-radius: 10px;
            margin-bottom: 25px;
        }

        .header h2 {
            margin: 0;
        }

        .card {
            background: white;
            padding: 25px;
            border-radius: 10px;
            box-shadow: 0 3px 12px rgba(0,0,0,0.07);
        }

        .form-grid {
            display: grid;
            grid-template-columns: repeat(2, 1fr);
            gap: 18px;
        }

        label {
            display: block;
            margin-bottom: 7px;
            font-weight: bold;
        }

        input, select {
            width: 100%;
            padding: 11px;
            border: 1px solid #ccd3da;
            border-radius: 5px;
            font-size: 14px;
        }

        .update-btn, .cancel-btn {
            display: inline-block;
            margin-top: 22px;
            padding: 11px 22px;
            border: none;
            border-radius: 5px;
            color: white;
            text-decoration: none;
            cursor: pointer;
            font-size: 14px;
        }

        .update-btn {
            background: #00897b;
        }

        .cancel-btn {
            background: #607d8b;
            margin-left: 8px;
        }

        @media (max-width: 600px) {
            .form-grid {
                grid-template-columns: 1fr;
            }
        }
    </style>
</head>

<body>
<div class="container">

    <div class="header">
        <h2>Edit Employee Details</h2>
        <p>Update the employee information below.</p>
    </div>

    <div class="card">

        <form action="${pageContext.request.contextPath}/employees/update/${employee.id}"
              method="post">

            <div class="form-grid">

                <div>
                    <label>Employee Name</label>
                    <input type="text" name="employeeName"
                           value="<c:out value='${employee.employeeName}'/>"
                           required>
                </div>

                <div>
                    <label>Email</label>
                    <input type="email" name="email"
                           value="<c:out value='${employee.email}'/>"
                           required>
                </div>

                <div>
                    <label>Phone</label>
                    <input type="text" name="phone"
                           value="<c:out value='${employee.phone}'/>"
                           required>
                </div>

                <div>
                    <label>Department</label>
                    <input type="text" name="department"
                           value="<c:out value='${employee.department}'/>"
                           required>
                </div>

                <div>
                    <label>Designation</label>
                    <input type="text" name="designation"
                           value="<c:out value='${employee.designation}'/>"
                           required>
                </div>

                <div>
                    <label>Salary</label>
                    <input type="number" name="salary"
                           min="0" step="0.01"
                           value="${employee.salary}" required>
                </div>

                <div>
                    <label>Joining Date</label>
                    <input type="date" name="joiningDate"
                           value="<c:out value='${employee.joiningDate}'/>"
                           required>
                </div>

                <div>
                    <label>Status</label>
                    <select name="status" required>
                        <option value="Active"
                            ${employee.status == 'Active' ? 'selected' : ''}>
                            Active
                        </option>
                        <option value="Inactive"
                            ${employee.status == 'Inactive' ? 'selected' : ''}>
                            Inactive
                        </option>
                    </select>
                </div>

            </div>

            <button type="submit" class="update-btn">
                Update Employee
            </button>

            <a href="${pageContext.request.contextPath}/employees"
               class="cancel-btn">
                Cancel
            </a>

        </form>

    </div>
</div>
</body>
</html>