
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Customer Management</title>

    <style>
        * {
            box-sizing: border-box;
        }

        body {
            margin: 0;
            padding: 30px;
            font-family: Arial, sans-serif;
            background: #f3f6fb;
            color: #263238;
        }

        .container {
            max-width: 1100px;
            margin: auto;
        }

        .header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            flex-wrap: wrap;
            gap: 12px;
            margin-bottom: 25px;
        }

        h1 {
            margin: 0;
            color: #173b70;
        }

        .back {
            text-decoration: none;
            background: #173b70;
            color: white;
            padding: 10px 16px;
            border-radius: 6px;
        }

        .card {
            background: white;
            padding: 25px;
            border-radius: 12px;
            margin-bottom: 25px;
            box-shadow: 0 3px 12px #00000010;
        }

        h2 {
            margin-top: 0;
            color: #173b70;
        }

        .form-grid {
            display: grid;
            grid-template-columns: repeat(2, minmax(0, 1fr));
            gap: 16px;
        }

        label {
            display: block;
            margin-bottom: 7px;
            font-weight: 600;
        }

        input,
        textarea {
            width: 100%;
            padding: 12px;
            border: 1px solid #ccd4df;
            border-radius: 6px;
            font-size: 14px;
        }

        textarea {
            min-height: 80px;
            resize: vertical;
        }

        .full {
            grid-column: 1 / -1;
        }

        button {
            border: none;
            border-radius: 6px;
            padding: 11px 18px;
            cursor: pointer;
            color: white;
            background: #176b45;
        }

        button:hover,
        .edit:hover {
            opacity: 0.9;
        }

        .message {
            padding: 12px;
            margin-bottom: 15px;
            border-radius: 6px;
        }

        .success {
            background: #d9f5e5;
            color: #176b45;
        }

        .error {
            background: #ffe2e2;
            color: #a32121;
        }

        .table-wrapper {
            overflow-x: auto;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            min-width: 700px;
        }

        th,
        td {
            text-align: left;
            padding: 13px;
            border-bottom: 1px solid #e4e8ef;
        }

        th {
            background: #edf2fa;
            color: #173b70;
        }

        .actions {
            display: flex;
            align-items: center;
            gap: 8px;
        }

        .edit {
            display: inline-block;
            background: #2563eb;
            color: white;
            padding: 8px 12px;
            border-radius: 6px;
            text-decoration: none;
        }

        .delete {
            background: #c93636;
            padding: 8px 12px;
        }

        .dashboard-link {
            display: inline-block;
            margin-bottom: 25px;
            background: #173b70;
            color: white;
            text-decoration: none;
            padding: 10px 16px;
            border-radius: 6px;
        }

        @media (max-width: 600px) {
            body {
                padding: 15px;
            }

            .form-grid {
                grid-template-columns: 1fr;
            }

            .full {
                grid-column: auto;
            }
        }
    </style>
</head>

<body>
<div class="container">

    <div class="header">
        <h1>Customer Management</h1>

        <a class="back"
           href="${pageContext.request.contextPath}/crm-dashboard">
            Back to Dashboard
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
        <h2>Add New Customer</h2>

        <form action="${pageContext.request.contextPath}/customers/add"
              method="post">

            <div class="form-grid">

                <div>
                    <label for="customerName">Customer Name *</label>
                    <input type="text"
                           id="customerName"
                           name="customerName"
                           maxlength="100"
                           required>
                </div>

                <div>
                    <label for="email">Email *</label>
                    <input type="email"
                           id="email"
                           name="email"
                           maxlength="150"
                           required>
                </div>

                <div>
                    <label for="phone">Phone</label>
                    <input type="tel"
                           id="phone"
                           name="phone"
                           maxlength="20">
                </div>

                <div>
                    <label for="company">Company</label>
                    <input type="text"
                           id="company"
                           name="company"
                           maxlength="200">
                </div>

                <div class="full">
                    <label for="address">Address</label>
                    <textarea id="address"
                              name="address"
                              maxlength="500"></textarea>
                </div>

                <div class="full">
                    <button type="submit">Add Customer</button>
                </div>

            </div>
        </form>
    </div>

    <div class="card">
        <h2>Customer List</h2>

        <div class="table-wrapper">
            <table>
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Name</th>
                        <th>Email</th>
                        <th>Phone</th>
                        <th>Company</th>
                        <th>Action</th>
                    </tr>
                </thead>

                <tbody>
                    <c:forEach var="customer" items="${customers}">
                        <tr>
                            <td><c:out value="${customer.id}"/></td>
                            <td><c:out value="${customer.customerName}"/></td>
                            <td><c:out value="${customer.email}"/></td>
                            <td><c:out value="${customer.phone}"/></td>
                            <td><c:out value="${customer.company}"/></td>

                            <td>
                                <div class="actions">

                                    <a class="edit"
                                       href="${pageContext.request.contextPath}/customers/edit/${customer.id}">
                                        Edit
                                    </a>

                                    <form action="${pageContext.request.contextPath}/customers/delete/${customer.id}"
                                          method="post"
                                          onsubmit="return confirm('Delete this customer?');">

                                        <button type="submit" class="delete">
                                            Delete
                                        </button>
                                    </form>

                                </div>
                            </td>
                        </tr>
                    </c:forEach>

                    <c:if test="${empty customers}">
                        <tr>
                            <td colspan="6">No customers added yet.</td>
                        </tr>
                    </c:if>
                </tbody>
            </table>
        </div>
    </div>

</div>
</body>
</html>
