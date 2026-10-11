
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Follow-up</title>

<style>
body {
    font-family: Arial, sans-serif;
    background: #f4f7fb;
    padding: 25px;
    color: #263445;
}
.container {
    max-width: 650px;
    margin: 30px auto;
    background: white;
    padding: 25px;
    border-radius: 10px;
    box-shadow: 0 2px 10px #00000012;
}
h2 {
    color: #087f8c;
}
label {
    display: block;
    margin-top: 15px;
}
input, textarea, select {
    width: 100%;
    padding: 10px;
    margin-top: 6px;
    box-sizing: border-box;
    border: 1px solid #ccd5df;
    border-radius: 5px;
}
button, .back {
    display: inline-block;
    padding: 10px 15px;
    margin-top: 20px;
    background: #087f8c;
    color: white;
    border: none;
    border-radius: 5px;
    text-decoration: none;
    cursor: pointer;
}
.back {
    background: #657786;
}
</style>
</head>

<body>
<div class="container">

    <h2>Edit Follow-up</h2>

    <form action="${pageContext.request.contextPath}/follow-ups/update/${followUp.id}"
          method="post">

        <label>Customer Name</label>
        <input type="text" name="customerName"
               value="<c:out value='${followUp.customerName}'/>"
               required>

        <label>Follow-up Date</label>
        <input type="date" name="followUpDate"
               value="${followUp.followUpDate}" required>

        <label>Follow-up Time</label>
        <input type="time" name="followUpTime"
               value="${followUp.followUpTime}" required>

        <label>Notes</label>
        <textarea name="notes" rows="4"><c:out value="${followUp.notes}"/></textarea>

        <label>Status</label>
        <select name="status" required>
            <option value="Pending"
                ${followUp.status == 'Pending' ? 'selected' : ''}>
                Pending
            </option>
            <option value="Completed"
                ${followUp.status == 'Completed' ? 'selected' : ''}>
                Completed
            </option>
            <option value="Cancelled"
                ${followUp.status == 'Cancelled' ? 'selected' : ''}>
                Cancelled
            </option>
        </select>

        <button type="submit">Update Follow-up</button>

        <a class="back"
           href="${pageContext.request.contextPath}/follow-ups">
           Cancel
        </a>
    </form>

</div>
</body>
</html>
