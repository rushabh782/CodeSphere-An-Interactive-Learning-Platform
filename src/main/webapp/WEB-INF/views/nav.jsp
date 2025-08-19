<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>EduSite</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
  <style>
    .navbar-brand {
      font-weight: bold;
      font-size: 1.5rem;
      color: #2c3e50;
    }

    .nav-link {
      color: #2c3e50 !important;
      font-weight: 500;
    }

    .nav-link:hover {
      color: #007bff !important;
    }

    .navbar {
      box-shadow: 0 2px 4px rgba(0,0,0,0.1);
    }
  </style>
</head>
<body>

<nav class="navbar navbar-expand-lg bg-light">
  <div class="container">
    <a class="navbar-brand" href="<c:url value='index'/>">EduSite</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavDropdown" 
      aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
  
    <div class="collapse navbar-collapse" id="navbarNavDropdown">
      <ul class="navbar-nav ms-auto">
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="<c:url value='index'/>">Home</a>
        </li>

        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown">
            Online IDE
          </a>
          <ul class="dropdown-menu">
            <li><a class="dropdown-item" href="<c:url value='/java-compiler'/>">Online Java Compiler</a></li>
            <li><a class="dropdown-item" href="<c:url value='/c-compiler'/>">Online C Compiler</a></li>
            <li><a class="dropdown-item" href="<c:url value='/python-compiler'/>">Online Python Compiler</a></li>
          </ul>
        </li>

        <li class="nav-item">
          <a class="nav-link" href="<c:url value='/aboutus'/>">About Us</a>
        </li>

        <li class="nav-item">
          <a class="nav-link" href="<c:url value='/contactus'/>">Contact</a>
        </li>
        
        <!-- Add this after the Contact nav-item -->
<li class="nav-item dropdown">
  <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown">
    MCQs
  </a>
  <ul class="dropdown-menu">
    <li><a class="dropdown-item" href="<c:url value='/mcqs'/>">Java MCQs</a></li>
    <li><a class="dropdown-item" href="<c:url value='/springmcqs'/>">Spring MCQs</a></li>
    <li><a class="dropdown-item" href="<c:url value='/sqlmcqs'/>">SQL MCQs</a></li>
  </ul>
</li>

        <li class="nav-item">
<c:choose>
  <c:when test="${not empty sessionScope.user or not empty sessionScope.admin}">
    <a class="btn btn-danger ms-3" href="<c:url value='/logout' />">Logout</a>
  </c:when>
  <c:otherwise>
    <a class="btn btn-primary ms-3" href="<c:url value='/login' />">Login</a>
  </c:otherwise>
</c:choose>

</li>
      </ul>
    </div>
  </div>
</nav>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>