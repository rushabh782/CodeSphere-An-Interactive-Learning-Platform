<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>Contact Us</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
</head>
<body>
<jsp:include page="nav.jsp" />
<div class="container mt-4">
    <h2>Contact Us</h2>
    <form action="submitContact" method="post">
        <div class="mb-3">
            <label class="form-label">Name</label>
            <input type="text" name="name" required class="form-control" />
        </div>
        <div class="mb-3">
            <label class="form-label">Email</label>
            <input type="email" name="email" required class="form-control" />
        </div>
        <div class="mb-3">
            <label class="form-label">Message</label>
            <textarea name="message" required class="form-control"></textarea>
        </div>
        <button type="submit" class="btn btn-primary">Submit</button>

        <c:if test="${not empty msg}">
            <div class="alert alert-info mt-3">${msg}</div>
        </c:if>
    </form>
</div>
<jsp:include page="footer.jsp" />
</body>
</html>
