<%@page import="com.entity.Question"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page isELIgnored = "false" %>

<%!
    // Helper method to extract correct answer option number from the answer field
    public String getCorrectOption(String answerField) {
        if (answerField == null) return "";
        
        // Look for "Correct Answer: Option X" pattern
        if (answerField.contains("Correct Answer: Option 1")) {
            return "Option 1";
        } else if (answerField.contains("Correct Answer: Option 2")) {
            return "Option 2";
        } else if (answerField.contains("Correct Answer: Option 3")) {
            return "Option 3";
        } else if (answerField.contains("Correct Answer: Option 4")) {
            return "Option 4";
        }
        return "";
    }
    
    // Helper method to extract individual options from the answer field
    public String[] extractOptions(String answerField) {
        String[] options = new String[4];
        
        if (answerField == null) {
            return new String[]{"", "", "", ""};
        }
        
        // Handle pipe-separated format (like in rows 43, 44, etc.)
        if (answerField.contains("|")) {
            String[] parts = answerField.split("\\|");
            for (int i = 0; i < 4 && i < parts.length; i++) {
                String option = parts[i].trim();
                // Remove "Option X: " prefix if present
                if (option.startsWith("Option " + (i+1) + ": ")) {
                    option = option.substring(("Option " + (i+1) + ": ").length());
                }
                options[i] = option;
            }
        } else {
            // Handle newline-separated format (like in rows 38, 39, etc.)
            String[] lines = answerField.split("\n");
            int optionIndex = 0;
            
            for (String line : lines) {
                line = line.trim();
                if (line.startsWith("Option " + (optionIndex + 1) + ":") && optionIndex < 4) {
                    options[optionIndex] = line.substring(("Option " + (optionIndex + 1) + ": ").length()).trim();
                    optionIndex++;
                }
            }
        }
        
        // Fill empty options with default text
        for (int i = 0; i < 4; i++) {
            if (options[i] == null || options[i].trim().isEmpty()) {
                options[i] = "Option " + (i + 1);
            }
        }
        
        return options;
    }
%>

<!DOCTYPE html>
<html>
    <head>
        <title>Spring MCQs</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <style>
            .option-item {
                cursor: pointer;
                transition: background-color 0.3s;
                user-select: none;
            }
            .correct-answer {
                background-color: #d4edda !important;
                color: #155724 !important;
                border: 2px solid #28a745 !important;
                font-weight: bold;
            }
            .wrong-selection {
                background-color: #f8d7da !important;
                color: #721c24 !important;
                border: 2px solid #dc3545 !important;
                font-weight: bold;
            }
            .disabled-option {
                pointer-events: none;
                opacity: 0.8;
            }
        </style>
    </head>
    <body>
        <%@ include file="nav.jsp" %>
        <%
            List<Question> lq = (List<Question>) request.getAttribute("questions");
            int index = 1;
        %>
        <div class="container mt-5">
            <h2 class="text-center mb-4">All MCQ Questions</h2>
            <%
                for(Question q : lq) {
                    String[] options = extractOptions(q.getAnswer());
                    String correctOption = getCorrectOption(q.getAnswer());
            %>
                <div class="card mb-4 shadow-sm">
                    <div class="card-body">
                        <h5 class="card-title">Q<%= index++ %>. <%= q.getName() %></h5>
                        <ul class="list-group list-group-flush mt-3 question-block">
                            <li class="list-group-item option-item" role="button" tabindex="0"
                                data-correct="<%= correctOption.equals("Option 1") %>">
                                A) <%= options[0] %>
                            </li>
                            <li class="list-group-item option-item" role="button" tabindex="0"
                                data-correct="<%= correctOption.equals("Option 2") %>">
                                B) <%= options[1] %>
                            </li>
                            <li class="list-group-item option-item" role="button" tabindex="0"
                                data-correct="<%= correctOption.equals("Option 3") %>">
                                C) <%= options[2] %>
                            </li>
                            <li class="list-group-item option-item" role="button" tabindex="0"
                                data-correct="<%= correctOption.equals("Option 4") %>">
                                D) <%= options[3] %>
                            </li>
                        </ul>
                    </div>
                </div>
            <%
                }
            %>
        </div>

        <script>
            document.querySelectorAll('.question-block').forEach(block => {
                block.querySelectorAll('.option-item').forEach(option => {
                    option.addEventListener('click', function () {
                        const questionBlock = this.closest('.question-block');
                        if (questionBlock.querySelector('.disabled-option')) {
                            return;
                        }
                        
                        // Disable all options for this question
                        questionBlock.querySelectorAll('.option-item').forEach(opt => {
                            opt.classList.add('disabled-option');
                        });
                        
                        const isCorrect = this.dataset.correct === "true";
                        
                        if (isCorrect) {
                            this.classList.add('correct-answer');
                        } else {
                            this.classList.add('wrong-selection');
                            // Show correct option
                            questionBlock.querySelectorAll('.option-item').forEach(opt => {
                                if (opt.dataset.correct === "true") {
                                    opt.classList.add('correct-answer');
                                }
                            });
                        }
                    });
                });
            });
        </script>
        
        <%@ include file="footer.jsp" %>
    </body>
</html>