```jsp
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Edit Customer</title>

    <style>
        body {
            font-family: Arial, sans-serif;
            background: #f4f7f8;
            margin: 0;
            padding: 30px;
        }

        .container {
            max-width: 550px;
            margin: 30px auto;
            background: white;
            padding: 25px;
            border-radius: 10px;
            box-shadow: 0 3px 12px rgba(0,0,0,0.1);
        }

        h2 {
            text-align: center;
            color: #00796b;
        }

        label {
            display: block;
            margin-top: 15px;
            font-weight: bold;
        }

        input, textarea {
            width: 100%;
            box-sizing: border-box;
            padding: 10px;
            margin-top: 6px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        button {
            width: 100%;
            margin-top: 22px;
            padding: 12px;
            background: #00796b;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        button:hover {
            background: #005f56;
        }

        .back {
            display: block;
            text-align: center;
            margin-top: 18px;
            color: #00796b;
            text-decoration: none;
        }
    </style>
</head>

<body>
<div class="container">

    <h2>Edit Customer</h2>

    <form action="${pageContext.request.contextPath}/customers/update/${customer.id}"
          method="post">

        <label>Customer Name</label>
        <input type="text" name="customerName"
               value="<c:out value='${customer.customerName}'/>"
               required>

        <label>Email</label>
        <input type="email" name="email"
               value="<c:out value='${customer.email}'/>"
               required>

        <label>Phone</label>
        <input type="text" name="phone"
               value="<c:out value='${customer.phone}'/>"
               required>

        <label>Company</label>
        <input type="text" name="company"
               value="<c:out value='${customer.company}'/>">

        <label>Address</label>
        <textarea name="address" rows="4"><c:out value="${customer.address}"/></textarea>

        <button type="submit">Update Customer</button>
    </form>

    <a class="back"
       href="${pageContext.request.contextPath}/customers">
       Back to Customers
    </a>

</div>
</body>
</html>
```