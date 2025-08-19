<%@page import="com.entity.Question"%>
<%@page import="java.util.List"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page isELIgnored = "false" %>
<%@ page import="org.apache.commons.text.StringEscapeUtils" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Admin - Manage Questions</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <!-- Bootstrap CSS -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
  <style>
    body {
      background-color: #f8f9fa;
    }
    .card {
      border-radius: 8px;
    }
    .category-badge {
      font-size: 0.75rem;
      vertical-align: middle;
    }
    .filter-dropdown {
      min-width: 200px;
    }
    .code-block {
      background-color: #f8f9fa;
      padding: 1rem;
      border-radius: 4px;
      position: relative;
    }
    .copy-btn {
      position: absolute;
      top: 0.5rem;
      right: 0.5rem;
    }
    .answer-preview {
      max-width: 300px;
      white-space: nowrap;
      overflow: hidden;
      text-overflow: ellipsis;
    }
  </style>
</head>
<body>

<%
List<Question> lq = (List<Question>) request.getAttribute("lq");
String selectedCategory = request.getParameter("category");
%>

<%@ include file="nav.jsp" %>

<div class="container py-5">
  <div class="d-flex justify-content-between align-items-center mb-4">
    <h2 class="mb-0">Admin Panel – Manage Questions</h2>
    <div class="d-flex">
      <div class="dropdown me-2">
        <button class="btn btn-outline-primary dropdown-toggle filter-dropdown" type="button" id="categoryFilter" 
                data-bs-toggle="dropdown" aria-expanded="false">
          <%= (selectedCategory != null && !selectedCategory.isEmpty() && !selectedCategory.equals("All")) ? 
              selectedCategory : "All Categories" %>
        </button>
        <ul class="dropdown-menu" aria-labelledby="categoryFilter">
          <li><a class="dropdown-item" href="admin?category=All">All Categories</a></li>
          <li><hr class="dropdown-divider"></li>
          <li><a class="dropdown-item" href="admin?category=Core Java">Core Java</a></li>
          <li><a class="dropdown-item" href="admin?category=Advanced Java">Advanced Java</a></li>
          <li><a class="dropdown-item" href="admin?category=Spring">Spring</a></li>
          <li><a class="dropdown-item" href="admin?category=SQL">SQL</a></li>
          <li><a class="dropdown-item" href="admin?category=Spring Boot">Spring Boot</a></li>
          <li><a class="dropdown-item" href="admin?category=HTML">HTML</a></li>
          <li><a class="dropdown-item" href="admin?category=CSS">CSS</a></li>
          <li><a class="dropdown-item" href="admin?category=JavaScript">JavaScript</a></li>
        </ul>
      </div>
      <a href="<c:url value='/admin/add-mcqs'/>" class="btn btn-info">Manage MCQs</a>
    </div>
  </div>

  <!-- Rest of your admin.jsp remains exactly the same -->

  <!-- Add Question Form -->
  <div class="card mb-5">
    <div class="card-header bg-primary text-white">
      Add New Question
    </div>
    <div class="card-body">
      <form action="addquestion" method="post">
        <!-- Question Text -->
        <div class="mb-3">
          <label for="questionText" class="form-label">Question</label>
          <input type="text" name="name" class="form-control" id="questionText" placeholder="Enter your question" required>
        </div>

        <!-- Answer -->
        <div class="mb-3">
          <label for="questionAnswer" class="form-label">Answer</label>
          <textarea class="form-control" name="answer" id="questionAnswer" rows="4" placeholder="Enter the answer" required></textarea>
        </div>

        <!-- Question Type -->
        <div class="mb-3">
          <label for="questionType" class="form-label">Question Type</label>
          <select class="form-select" id="questionType" name="type" required>
            <option value="" disabled selected>Select question type</option>
            <option value="theory">Theory</option>
            <option value="coding">Coding</option>
          </select>
        </div>

        <!-- Category -->
        <div class="mb-3">
          <label for="questionCategory" class="form-label">Category</label>
          <select class="form-select" id="questionCategory" name="category" required>
            <option value="" disabled selected>Select category</option>
            <option value="Core Java">Core Java</option>
            <option value="Advanced Java">Advanced Java</option>
            <option value="Spring">Spring</option>
            <option value="SQL">SQL</option>
            <option value="Spring Boot">Spring Boot</option>
            <option value="HTML">HTML</option>
            <option value="CSS">CSS</option>
            <option value="JavaScript">JavaScript</option>
          </select>
        </div>

        <button type="submit" class="btn btn-success">Save Question</button>
      </form>
    </div>
  </div>

  <!-- Questions Table -->
  <div class="card">
    <div class="card-header bg-dark text-white d-flex justify-content-between align-items-center">
      <span>Existing Questions</span>
      <span class="badge bg-light text-dark">
        <%= (selectedCategory != null && !selectedCategory.isEmpty() && !selectedCategory.equals("All")) ? 
            "Showing: " + selectedCategory : "Showing All Questions" %>
      </span>
    </div>
    <div class="card-body p-0">
      <% if (lq == null || lq.isEmpty()) { %>
        <div class="alert alert-info m-3">No questions found<%=(selectedCategory != null && !selectedCategory.isEmpty() && !selectedCategory.equals("All")) ? 
            " for category: " + selectedCategory : "" %>.</div>
      <% } else { %>
        <div class="table-responsive">
          <table class="table table-hover mb-0">
            <thead class="table-light">
              <tr>
                <th>ID</th>
                <th>Question</th>
                <th>Answer Preview</th>
                <th>Type</th>
                <th>Category</th>
                <th>Actions</th>
              </tr>
            </thead>
            <tbody>
              <% for(Question q: lq) { 
                  if(q == null) continue;
                  if(selectedCategory == null || selectedCategory.isEmpty() || 
                     selectedCategory.equals("All") || 
                     (q.getCategory() != null && q.getCategory().equalsIgnoreCase(selectedCategory))) {
                     
                     String questionType = q.getType() != null ? q.getType() : "theory";
                     String answerPreview = q.getAnswer() != null ? q.getAnswer() : "";
              %>
              <tr>
                <td><%=q.getId() %></td>
                <td><%=q.getName() != null ? q.getName() : "" %></td>
                <td class="answer-preview">
                  <% if("coding".equalsIgnoreCase(questionType)) { %>
                    <div class="code-block">
                      <button class="btn btn-sm btn-light copy-btn" title="Copy">
                        <i class="bi bi-clipboard"></i>
                      </button>
                      <pre class="m-0"><code><%= StringEscapeUtils.escapeHtml4(answerPreview.length() > 100 ? 
                          answerPreview.substring(0, 100) + "..." : answerPreview) %></code></pre>
                    </div>
                  <% } else { %>
                    <%= answerPreview.length() > 100 ? 
                        answerPreview.substring(0, 100) + "..." : answerPreview %>
                  <% } %>
                </td>
                <td><span class="badge <%= "coding".equalsIgnoreCase(questionType) ? "bg-info" : "bg-secondary" %>">
                  <%=questionType %>
                </span></td>
                <td><span class="badge bg-primary"><%=q.getCategory() != null ? q.getCategory() : "N/A" %></span></td>
                <td>
                  <a href="edit/<%=q.getId()%>" class="btn btn-sm btn-warning me-1" title="Edit">
                    <i class="bi bi-pencil"></i>
                  </a>
                  <a href="delete/<%=q.getId()%>" class="btn btn-sm btn-danger" title="Delete" 
                     onclick="return confirm('Are you sure you want to delete this question?');">
                    <i class="bi bi-trash"></i>
                  </a>
                </td>
              </tr>
              <% } 
                 } %>
            </tbody>
          </table>
        </div>
      <% } %>
    </div>
  </div>
</div>

<!-- Bootstrap JS Bundle -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
$(document).ready(function() {
    // Copy button functionality
    $('.copy-btn').click(function() {
        const codeElement = $(this).next('pre').find('code');
        const text = codeElement.text();
        
        navigator.clipboard.writeText(text).then(() => {
            const icon = $(this).find('i');
            icon.removeClass('bi-clipboard').addClass('bi-clipboard-check');
            setTimeout(() => {
                icon.removeClass('bi-clipboard-check').addClass('bi-clipboard');
            }, 1500);
        }).catch(err => {
            console.error('Copy failed', err);
        });
    });
    
    // Highlight current category in dropdown
    const currentCategory = "<%= selectedCategory != null ? selectedCategory : "All" %>";
    $('.dropdown-item').each(function() {
        if ($(this).text() === currentCategory || 
            (currentCategory === "All" && $(this).text() === "All Categories")) {
            $(this).addClass('active');
        }
    });
});
</script>

<%@ include file="footer.jsp" %>
</body>
</html>