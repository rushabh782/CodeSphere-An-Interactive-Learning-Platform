<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Login</title>
  <!-- Include Bootstrap CSS if not already -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
</head>
<body>

<%@ include file="nav.jsp" %>

<div class="container mt-5 mb-5" style="max-width: 400px">
  <div class="card">
    <div class="card-header bg-primary text-white">Login</div>
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

      <form action="logindata" method="post">
        <div class="mb-3">
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

        <div class="mb-3">
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

        <button type="submit" class="btn btn-primary w-100">Login</button>
      </form>
    </div>
  </div>
</div>

<%@ include file="footer.jsp" %>
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>

</body>
</html>
