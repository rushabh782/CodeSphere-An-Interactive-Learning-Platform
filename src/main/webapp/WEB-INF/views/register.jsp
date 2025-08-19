<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Register</title>
  <!-- Bootstrap 4 CSS -->
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
  <style>
    body {
      background-color: #f8f9fa;
    }

    .register-container {
      max-width: 420px;
      margin: 60px auto;
    }

    .card {
      padding: 25px;
      border-radius: 10px;
      box-shadow: 0 5px 25px rgba(0, 0, 0, 0.1);
    }

    .card-header {
      padding: 15px 20px;
      font-size: 1.25rem;
      font-weight: bold;
      text-align: center;
      border-top-left-radius: 10px;
      border-top-right-radius: 10px;
    }

    .btn-primary {
      padding: 10px;
      font-size: 1rem;
      font-weight: 500;
    }
  </style>
</head>
<body>

<%@ include file="nav.jsp" %>

<div class="container register-container">
  <div class="card">
    <div class="card-header bg-primary text-white">
      Register
    </div>
    <div class="card-body">

      <% String msg = (String) request.getAttribute("msg"); %>
      <% if (msg != null) { %>
        <div class="alert alert-success alert-dismissible fade show" role="alert">
          <%= msg %>
          <button type="button" class="close" data-dismiss="alert" aria-label="Close">
            <span aria-hidden="true">&times;</span>
          </button>
        </div>
      <% } %>

      <form action="registerUser" method="post">
        <div class="form-group mb-4">
          <label for="username" class="form-label">UserName</label>
          <input
            type="text"
            name="username"
            id="username"
            class="form-control"
            placeholder="Enter username"
            required
          />
        </div>

        <div class="form-group mb-4">
          <label for="password" class="form-label">Password</label>
          <input
            type="password"
            name="password"
            id="password"
            class="form-control"
            placeholder="Enter password"
            required
          />
        </div>

        <button type="submit" class="btn btn-primary w-100">Register</button>
      </form>

    </div>
  </div>
</div>

<%@ include file="footer.jsp" %>

<!-- Bootstrap 4 JS Dependencies -->
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>

</body>
</html>
