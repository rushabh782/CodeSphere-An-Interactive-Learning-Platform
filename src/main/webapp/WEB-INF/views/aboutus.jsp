<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>About Us</title>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
  <style>
    .hero-section {
      background: linear-gradient(to right, #0f2027, #203a43, #2c5364);
      color: white;
      padding: 60px 20px;
      text-align: center;
    }
    .section-title {
      font-size: 2rem;
      font-weight: 600;
    }
    .team-member img {
      border-radius: 50%;
      width: 100px;
      height: 100px;
      object-fit: cover;
    }
  </style>
</head>
<body>

<%@ include file="nav.jsp" %>

<!-- Hero Section -->
<div class="hero-section">
  <div class="container">
    <h1 class="display-5">About EduSite</h1>
    <p class="lead">Empowering learners with quality education and real-world skills.</p>
  </div>
</div>

<!-- About Us Content -->
<div class="container my-5">
  <h2 class="section-title text-center mb-4">Who We Are</h2>
  <p class="text-center mb-5">
    EduSite is a forward-thinking educational platform that brings top-tier learning experiences to students, professionals, and curious minds worldwide. 
    Our mission is to make knowledge accessible, engaging, and affordable for everyone.
  </p>

  <div class="row text-center">
    <div class="col-md-4 mb-4">
      <div class="card h-100 shadow-sm">
        <div class="card-body">
          <h5 class="card-title">Interactive Learning</h5>
          <p class="card-text">We offer hands-on, engaging, and innovative content to boost understanding and retention.</p>
        </div>
      </div>
    </div>
    <div class="col-md-4 mb-4">
      <div class="card h-100 shadow-sm">
        <div class="card-body">
          <h5 class="card-title">Expert Instructors</h5>
          <p class="card-text">Learn from experienced educators, industry leaders, and certified professionals.</p>
        </div>
      </div>
    </div>
    <div class="col-md-4 mb-4">
      <div class="card h-100 shadow-sm">
        <div class="card-body">
          <h5 class="card-title">Global Community</h5>
          <p class="card-text">Connect, collaborate, and grow with learners from across the globe.</p>
        </div>
      </div>
    </div>
  </div>
</div>

<!-- Team Section -->
<div class="container mt-5">
    <h2 class="text-center mb-4">Meet Our Team</h2>
    <div class="row text-center">
        <div class="col-md-4">
            <img src="${pageContext.request.contextPath}/images/rohit.jpg" class="rounded-circle mb-3" width="150" height="150" alt="Arjun">
            <h5>Arjun Mehta</h5>
            <p>Founder & Mentor</p>
        </div>
        <div class="col-md-4">
            <img src="${pageContext.request.contextPath}/images/neha.jpg" class="rounded-circle mb-3" width="150" height="150" alt="Neha">
            <h5>Neha Sharma</h5>
            <p>Curriculum Designer</p>
        </div>
        <div class="col-md-4">
            <img src="${pageContext.request.contextPath}/images/riya.jpg" class="rounded-circle mb-3" width="150" height="150" alt="Riya">
            <h5>Riya Gupta</h5>
            <p>Tech Lead</p>
        </div>
    </div>
</div>


<%@ include file="footer.jsp" %>

<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>

</body>
</html>
