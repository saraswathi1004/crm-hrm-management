
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Edit Lead</title>

    <style>
        body {
            font-family: Arial, sans-serif;
            background: #f4f7f8;
            padding: 30px;
        }

        .container {
            max-width: 600px;
            margin: 20px auto;
            padding: 25px;
            background: white;
            border-radius: 10px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
        }

        h2 {
            color: #00796b;
            text-align: center;
        }

        label {
            display: block;
            margin-top: 15px;
            font-weight: bold;
        }

        input, select {
            width: 100%;
            box-sizing: border-box;
            padding: 10px;
            margin-top: 6px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        button, .back {
            display: block;
            width: 100%;
            box-sizing: border-box;
            padding: 12px;
            margin-top: 20px;
            border: none;
            border-radius: 5px;
            text-align: center;
            text-decoration: none;
            cursor: pointer;
        }

        button {
            background: #00796b;
            color: white;
        }

        .back {
            background: #455a64;
            color: white;
        }
    </style>
</head>

<body>
<div class="container">

    <h2>Edit Lead</h2>

    <form action="${pageContext.request.contextPath}/leads/update/${lead.id}"
          method="post">

        <label>Lead Name</label>
        <input type="text" name="leadName"
               value="<c:out value='${lead.leadName}'/>"
               required>

        <label>Email</label>
        <input type="email" name="email"
               value="<c:out value='${lead.email}'/>"
               required>

        <label>Phone</label>
        <input type="text" name="phone"
               value="<c:out value='${lead.phone}'/>"
               required>

        <label>Company</label>
        <input type="text" name="company"
               value="<c:out value='${lead.company}'/>">

        <label>Source</label>
        <select name="source" required>
            <option value="Website" ${lead.source == 'Website' ? 'selected' : ''}>Website</option>
            <option value="Referral" ${lead.source == 'Referral' ? 'selected' : ''}>Referral</option>
            <option value="Social Media" ${lead.source == 'Social Media' ? 'selected' : ''}>Social Media</option>
            <option value="Advertisement" ${lead.source == 'Advertisement' ? 'selected' : ''}>Advertisement</option>
            <option value="Other" ${lead.source == 'Other' ? 'selected' : ''}>Other</option>
        </select>

        <label>Status</label>
        <select name="status" required>
            <option value="New" ${lead.status == 'New' ? 'selected' : ''}>New</option>
            <option value="Contacted" ${lead.status == 'Contacted' ? 'selected' : ''}>Contacted</option>
            <option value="Qualified" ${lead.status == 'Qualified' ? 'selected' : ''}>Qualified</option>
            <option value="Converted" ${lead.status == 'Converted' ? 'selected' : ''}>Converted</option>
            <option value="Lost" ${lead.status == 'Lost' ? 'selected' : ''}>Lost</option>
        </select>

        <button type="submit">Update Lead</button>
    </form>

    <a class="back"
       href="${pageContext.request.contextPath}/leads">
       Back to Leads
    </a>

</div>
</body>
</html>
