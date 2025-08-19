<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isELIgnored = "false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8" />
    <title>Edit Question | EduSite</title>
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
    </style>
</head>
<body>
    <%@ include file="nav.jsp" %>
    <div class="container mt-5">
        <div class="card mb-5">
            <div class="card-header bg-primary text-white">Edit Question</div>
            <div class="card-body">
                <form action="${pageContext.request.contextPath}/updatequestion/${q.id}" method="post">
                    <!-- Question Text -->
                    <div class="mb-3">
                        <label for="questionText" class="form-label">Question</label>
                        <input
                            type="text"
                            name="name"
                            value="${q.name}"
                            class="form-control"
                            id="questionText"
                            placeholder="Enter your question"
                            required
                        />
                    </div>

                    <!-- Answer -->
                    <div class="mb-3">
                        <label for="questionAnswer" class="form-label">Answer</label>
                        <textarea
                            class="form-control"
                            name="answer"
                            id="questionAnswer"
                            rows="4"
                            placeholder="Enter the answer here"
                            required
                        >${q.answer}</textarea>
                    </div>

                    <!-- Question Type -->
                    <div class="mb-3">
                        <label for="questionType" class="form-label">Question Type</label>
                        <select class="form-select" id="questionType" name="type" required>
                            <option value="" disabled>Select question type</option>
                            <option value="theory" ${q.type eq 'theory' ? 'selected' : ''}>Theory</option>
                            <option value="coding" ${q.type eq 'coding' ? 'selected' : ''}>Coding</option>
                        </select>
                    </div>

                    <!-- Category -->
                    <div class="mb-3">
                        <label for="questionCategory" class="form-label">Category</label>
                        <select class="form-select" id="questionCategory" name="category" required>
                            <option value="" disabled>Select category</option>
                            <option value="Core Java" ${q.category eq 'Core Java' ? 'selected' : ''}>Core Java</option>
                            <option value="Advanced Java" ${q.category eq 'Advanced Java' ? 'selected' : ''}>Advanced Java</option>
                            <option value="Spring" ${q.category eq 'Spring' ? 'selected' : ''}>Spring</option>
                            <option value="SQL" ${q.category eq 'SQL' ? 'selected' : ''}>SQL</option>
                            <option value="Spring Boot" ${q.category eq 'Spring Boot' ? 'selected' : ''}>Spring Boot</option>
                            <option value="HTML" ${q.category eq 'HTML' ? 'selected' : ''}>HTML</option>
                            <option value="CSS" ${q.category eq 'CSS' ? 'selected' : ''}>CSS</option>
                            <option value="JavaScript" ${q.category eq 'JavaScript' ? 'selected' : ''}>JavaScript</option>
                        </select>
                    </div>

                    <button type="submit" class="btn btn-success">Update Question</button>
                    <a href="${pageContext.request.contextPath}/admin" class="btn btn-secondary">Cancel</a>
                </form>
            </div>
        </div>
    </div>

    <!-- Bootstrap JS Bundle -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <%@ include file="footer.jsp" %>
</body>
</html>