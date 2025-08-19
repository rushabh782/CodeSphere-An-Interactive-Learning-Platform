<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Add MCQs</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .form-container {
            max-width: 800px;
            margin: 0 auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }
        .option-input {
            margin-bottom: 10px;
        }
    </style>
</head>
<body>
<%@ include file="nav.jsp" %>

<div class="container py-5">
    <div class="form-container">
        <h2 class="mb-4">Add New MCQ Question</h2>
        <form action="<c:url value='/admin/save-mcq'/>" method="post">
            <!-- Question Text -->
            <div class="mb-3">
                <label for="questionText" class="form-label">Question</label>
                <input type="text" class="form-control" id="questionText" name="questionText" required>
            </div>

            <!-- Options -->
            <div class="mb-3">
                <label class="form-label">Options</label>
                <div class="option-input">
                    <input type="text" class="form-control" name="option1" placeholder="Option 1" required>
                </div>
                <div class="option-input">
                    <input type="text" class="form-control" name="option2" placeholder="Option 2" required>
                </div>
                <div class="option-input">
                    <input type="text" class="form-control" name="option3" placeholder="Option 3" required>
                </div>
                <div class="option-input">
                    <input type="text" class="form-control" name="option4" placeholder="Option 4" required>
                </div>
            </div>

            <!-- Correct Answer -->
            <div class="mb-3">
                <label for="correctAnswer" class="form-label">Correct Answer</label>
                <select class="form-select" id="correctAnswer" name="correctAnswer" required>
                    <option value="" disabled selected>Select correct option</option>
                    <option value="1">Option 1</option>
                    <option value="2">Option 2</option>
                    <option value="3">Option 3</option>
                    <option value="4">Option 4</option>
                </select>
            </div>

            <!-- Category -->
            <div class="mb-3">
                <label for="category" class="form-label">Category</label>
                <select class="form-select" id="category" name="category" required>
                    <option value="" disabled selected>Select category</option>
                    <option value="Core Java">Core Java</option>
                    <option value="Advanced Java">Advanced Java</option>
                    <option value="Spring">Spring</option>
                    <option value="SQL">SQL</option>
                    <option value="Spring Boot">Spring Boot</option>
                </select>
            </div>

            <div class="d-flex justify-content-between">
                <a href="/admin" class="btn btn-secondary">Back to Admin</a>
                <button type="submit" class="btn btn-primary">Save MCQ</button>
            </div>
        </form>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>