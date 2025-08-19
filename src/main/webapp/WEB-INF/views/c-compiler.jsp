<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Online C Compiler</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .editor-container {
            margin: 20px;
        }
        .code-editor {
            width: 100%;
            height: 400px;
            font-family: monospace;
            border: 1px solid #ccc;
            padding: 10px;
        }
        .output {
            margin-top: 20px;
            padding: 10px;
            border: 1px solid #ddd;
            background-color: #f8f9fa;
            min-height: 100px;
        }
    </style>
</head>
<body>
    <jsp:include page="nav.jsp" />
    
    <div class="container editor-container">
        <h2>Online C Compiler</h2>
        <form id="compileForm">
            <textarea id="code" class="code-editor" name="code">#include &lt;stdio.h&gt;

int main() {
    printf("Hello, World!");
    return 0;
}</textarea>
            <button type="button" onclick="compileCode()" class="btn btn-primary mt-3">Run</button>
        </form>
        <div class="output" id="output"></div>
    </div>

    <script>
        function compileCode() {
            const code = document.getElementById('code').value;
            const outputDiv = document.getElementById('output');
            outputDiv.innerHTML = "Compiling and running...";
            
            // In a real implementation, you would send this to a backend service
            // For demo purposes, we'll simulate a simple output
            setTimeout(() => {
                outputDiv.innerHTML = "Hello, World!";
            }, 1000);
        }
    </script>
</body>
</html>