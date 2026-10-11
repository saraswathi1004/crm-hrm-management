
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Follow-up Management</title>

<style>
* {
    box-sizing: border-box;
}

body {
    margin: 0;
    padding: 25px;
    font-family: Arial, sans-serif;
    background: #f4f7fb;
    color: #263445;
}

.container {
    max-width: 1150px;
    margin: auto;
}

.header {
    background: #087f8c;
    color: white;
    padding: 22px;
    border-radius: 10px;
    margin-bottom: 22px;
}

.header h2 {
    margin: 0 0 8px;
}

.card {
    background: white;
    padding: 22px;
    border-radius: 10px;
    margin-bottom: 22px;
    box-shadow: 0 2px 8px #0000000d;
}

.form-grid {
    display: grid;
    grid-template-columns: repeat(2, minmax(0, 1fr));
    gap: 15px;
}

input, textarea, select {
    width: 100%;
    padding: 11px;
    margin-top: 7px;
    border: 1px solid #ccd5df;
    border-radius: 5px;
    font-size: 14px;
}

textarea {
    resize: vertical;
}

button, .back {
    display: inline-block;
    padding: 10px 15px;
    border: none;
    border-radius: 5px;
    color: white;
    background: #087f8c;
    text-decoration: none;
    cursor: pointer;
    margin-top: 15px;
}

.delete {
    background: #dc3545;
    margin-top: 0;
}

.edit {
    background: #e0a000;
    color: #222;
    margin-right: 5px;
}

table {
    width: 100%;
    border-collapse: collapse;
    background: white;
}

th, td {
    border: 1px solid #e0e5eb;
    padding: 11px;
    text-align: left;
}

th {
    background: #e8f4f5;
}

.message {
    padding: 12px;
    margin-bottom: 15px;
    border-radius: 5px;
    background: #d8f3dc;
    color: #17632b;
}

.error {
    background: #ffe0e0;
    color: #a10000;
}

.table-wrapper {
    overflow-x: auto;
}

@media (max-width: 650px) {
    .form-grid {
        grid-template-columns: 1fr;
    }
    body {
        padding: 12px;
    }
}
</style>
</head>

<body>
<div class="container">

    <div class="header">
        <h2>Follow-up Management</h2>
        <p>Schedule and manage customer follow-ups</p>
    </div>

    <c:if test="${not empty successMessage}">
        <div class="message">${successMessage}</div>
    </c:if>

    <c:if test="${not empty errorMessage}">
        <div class="message error">${errorMessage}</div>
    </c:if>

    <div class="card">
        <h3>Add New Follow-up</h3>

        <form action="${pageContext.request.contextPath}/follow-ups/add"
              method="post">

            <div class="form-grid">
                <div>
                    <label>Customer Name</label>
                    <input type="text" name="customerName"
                           placeholder="Enter customer name" required>
                </div>

                <div>
                    <label>Follow-up Date</label>
                    <input type="date" name="followUpDate" required>
                </div>

                <div>
                    <label>Follow-up Time</label>
                    <input type="time" name="followUpTime" required>
                </div>

                <div>
                    <label>Status</label>
                    <select name="status" required>
                        <option value="Pending">Pending</option>
                        <option value="Completed">Completed</option>
                        <option value="Cancelled">Cancelled</option>
                    </select>
                </div>

                <div style="grid-column: 1 / -1;">
                    <label>Notes</label>
                    <textarea name="notes" rows="3"
                              placeholder="Enter follow-up details"></textarea>
                </div>
            </div>

            <button type="submit">Add Follow-up</button>
        </form>
    </div>

    <div class="card">
        <h3>Follow-up Records</h3>

        <div class="table-wrapper">
            <table>
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Customer</th>
                        <th>Date</th>
                        <th>Time</th>
                        <th>Notes</th>
                        <th>Status</th>
                        <th>Actions</th>
                    </tr>
                </thead>

                <tbody>
                    <c:forEach var="item" items="${followUps}">
                        <tr>
                            <td>${item.id}</td>
                            <td><c:out value="${item.customerName}"/></td>
                            <td>${item.followUpDate}</td>
                            <td>${item.followUpTime}</td>
                            <td><c:out value="${item.notes}"/></td>
                            <td><c:out value="${item.status}"/></td>
                            <td>
                                <a class="back edit"
                                   href="${pageContext.request.contextPath}/follow-ups/edit/${item.id}">
                                   Edit
                                </a>

                                <form action="${pageContext.request.contextPath}/follow-ups/delete/${item.id}"
                                      method="post"
                                      style="display:inline"
                                      onsubmit="return confirm('Delete this follow-up?');">
                                    <button type="submit" class="delete">
                                        Delete
                                    </button>
                                </form>
                            </td>
                        </tr>
                    </c:forEach>

                    <c:if test="${empty followUps}">
                        <tr>
                            <td colspan="7" style="text-align:center;">
                                No follow-ups available.
                            </td>
                        </tr>
                    </c:if>
                </tbody>
            </table>
        </div>
    </div>

    <a class="back"
       href="${pageContext.request.contextPath}/crm-dashboard">
       Back to CRM Dashboard
    </a>

</div>
</body>
</html>
