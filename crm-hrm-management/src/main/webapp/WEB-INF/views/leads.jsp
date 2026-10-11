
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>CRM - Leads</title>

    <style>
        body {
            font-family: Arial, sans-serif;
            background: #f4f7f8;
            margin: 0;
            padding: 25px;
        }

        .container {
            max-width: 1100px;
            margin: auto;
        }

        h2 {
            color: #00796b;
        }

        .panel {
            background: white;
            padding: 22px;
            margin-bottom: 25px;
            border-radius: 10px;
            box-shadow: 0 2px 8px rgba(0,0,0,0.08);
        }

        .form-grid {
            display: grid;
            grid-template-columns: repeat(2, minmax(0, 1fr));
            gap: 15px;
        }

        label {
            display: block;
            margin-bottom: 6px;
            font-weight: bold;
        }

        input, select {
            width: 100%;
            box-sizing: border-box;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        button, .edit, .back {
            display: inline-block;
            padding: 9px 14px;
            border: none;
            border-radius: 5px;
            text-decoration: none;
            cursor: pointer;
            font-size: 14px;
        }

        .add-btn {
            background: #00796b;
            color: white;
            margin-top: 18px;
        }

        .edit {
            background: #1976d2;
            color: white;
        }

        .delete {
            background: #d32f2f;
            color: white;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 15px;
            background: white;
        }

        th, td {
            padding: 12px 9px;
            border: 1px solid #ddd;
            text-align: left;
        }

        th {
            background: #00796b;
            color: white;
        }

        .message {
            padding: 10px;
            margin-bottom: 12px;
            border-radius: 5px;
            background: #e8f5e9;
            color: #256029;
        }

        .error {
            background: #ffebee;
            color: #b71c1c;
        }

        .back {
            background: #455a64;
            color: white;
            margin-bottom: 18px;
        }

        .actions {
            display: flex;
            gap: 6px;
            align-items: center;
        }

        @media (max-width: 650px) {
            .form-grid {
                grid-template-columns: 1fr;
            }

            .panel {
                overflow-x: auto;
            }
        }
    </style>
</head>

<body>
<div class="container">

    <a class="back"
       href="${pageContext.request.contextPath}/crm-dashboard">
       Back to CRM Dashboard
    </a>

    <h2>CRM - Lead Management</h2>

    <c:if test="${not empty successMessage}">
        <div class="message">
            <c:out value="${successMessage}"/>
        </div>
    </c:if>

    <c:if test="${not empty errorMessage}">
        <div class="message error">
            <c:out value="${errorMessage}"/>
        </div>
    </c:if>

    <div class="panel">
        <h3>Add New Lead</h3>

        <form action="${pageContext.request.contextPath}/leads/add"
              method="post">

            <div class="form-grid">
                <div>
                    <label>Lead Name</label>
                    <input type="text" name="leadName" required>
                </div>

                <div>
                    <label>Email</label>
                    <input type="email" name="email" required>
                </div>

                <div>
                    <label>Phone</label>
                    <input type="text" name="phone" required>
                </div>

                <div>
                    <label>Company</label>
                    <input type="text" name="company">
                </div>

                <div>
                    <label>Source</label>
                    <select name="source" required>
                        <option value="">Select Source</option>
                        <option value="Website">Website</option>
                        <option value="Referral">Referral</option>
                        <option value="Social Media">Social Media</option>
                        <option value="Advertisement">Advertisement</option>
                        <option value="Other">Other</option>
                    </select>
                </div>

                <div>
                    <label>Status</label>
                    <select name="status" required>
                        <option value="New">New</option>
                        <option value="Contacted">Contacted</option>
                        <option value="Qualified">Qualified</option>
                        <option value="Converted">Converted</option>
                        <option value="Lost">Lost</option>
                    </select>
                </div>
            </div>

            <button type="submit" class="add-btn">Add Lead</button>
        </form>
    </div>

    <div class="panel">
        <h3>Lead List</h3>

        <table>
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Email</th>
                    <th>Phone</th>
                    <th>Company</th>
                    <th>Source</th>
                    <th>Status</th>
                    <th>Actions</th>
                </tr>
            </thead>

            <tbody>
                <c:forEach var="item" items="${leads}">
                    <tr>
                        <td><c:out value="${item.id}"/></td>
                        <td><c:out value="${item.leadName}"/></td>
                        <td><c:out value="${item.email}"/></td>
                        <td><c:out value="${item.phone}"/></td>
                        <td><c:out value="${item.company}"/></td>
                        <td><c:out value="${item.source}"/></td>
                        <td><c:out value="${item.status}"/></td>

                        <td>
                            <div class="actions">
                                <a class="edit"
                                   href="${pageContext.request.contextPath}/leads/edit/${item.id}">
                                   Edit
                                </a>

                                <form action="${pageContext.request.contextPath}/leads/delete/${item.id}"
                                      method="post"
                                      onsubmit="return confirm('Delete this lead?');">
                                    <button type="submit" class="delete">
                                        Delete
                                    </button>
                                </form>
                            </div>
                        </td>
                    </tr>
                </c:forEach>

                <c:if test="${empty leads}">
                    <tr>
                        <td colspan="8" style="text-align:center;">
                            No leads found. Add your first lead above.
                        </td>
                    </tr>
                </c:if>
            </tbody>
        </table>
    </div>

</div>
</body>
</html>
