<%@page import="com.entity.Question"%>
<%@page import="java.util.List"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page isELIgnored = "false" %>
<%@ page import="org.apache.commons.text.StringEscapeUtils" %>
<html>
<head>
    <title>Question List | EduSite</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <style>
        .category-badge {
            font-size: 0.75rem;
            vertical-align: middle;
        }
        .filter-dropdown {
            min-width: 200px;
        }
        .answer-text {
            white-space: pre-line;
            font-family: inherit;
            font-size: 1rem;
            line-height: 1.6;
            color: #212529;
        }
        .code-block {
            background-color: #f8f9fa;
            padding: 1rem;
            border-radius: 4px;
            position: relative;
        }
    </style>
</head>
<body>

<%
List<Question> lq = (List<Question>) request.getAttribute("lq");
String selectedCategory = request.getParameter("category");
%>

<%@ include file="nav.jsp" %>

<div class="container my-5">
    <div class="d-flex justify-content-between align-items-center mb-4">
        <h3 class="mb-0">Question List</h3>
        <div class="dropdown">
            <button class="btn btn-outline-primary dropdown-toggle filter-dropdown" type="button" id="categoryFilter" 
                    data-bs-toggle="dropdown" aria-expanded="false">
                <%= (selectedCategory != null && !selectedCategory.isEmpty() && !selectedCategory.equals("All")) ? 
                    selectedCategory : "All Categories" %>
            </button>
            <ul class="dropdown-menu" aria-labelledby="categoryFilter">
                <li><a class="dropdown-item" href="?category=All">All Categories</a></li>
                <li><hr class="dropdown-divider"></li>
                <li><a class="dropdown-item" href="?category=Core Java">Core Java</a></li>
                <li><a class="dropdown-item" href="?category=Advanced Java">Advanced Java</a></li>
                <li><a class="dropdown-item" href="?category=Spring">Spring</a></li>
                <li><a class="dropdown-item" href="?category=SQL">SQL</a></li>
                <li><a class="dropdown-item" href="?category=Spring Boot">Spring Boot</a></li>
                <li><a class="dropdown-item" href="?category=HTML">HTML</a></li>
                <li><a class="dropdown-item" href="?category=CSS">CSS</a></li>
                <li><a class="dropdown-item" href="?category=JavaScript">JavaScript</a></li>
            </ul>
        </div>
    </div>
    
    <% if (lq == null || lq.isEmpty()) { %>
        <div class="alert alert-info">No questions found<%=(selectedCategory != null && !selectedCategory.isEmpty() && !selectedCategory.equals("All")) ? 
            " for category: " + selectedCategory : "" %>.</div>
    <% } else { %>
        <div class="accordion" id="questionAccordion">
            <% 
            for(Question q: lq) { 
                if(q == null) continue;
                // Filter questions based on selected category
                if(selectedCategory == null || selectedCategory.isEmpty() || 
                   selectedCategory.equals("All") || 
                   (q.getCategory() != null && q.getCategory().equalsIgnoreCase(selectedCategory))) {
                    
                    String headingId = "heading" + q.getId();
                    String collapseId = "collapse" + q.getId();
                    String escapedCode = StringEscapeUtils.escapeHtml4(q.getAnswer());
            %>
            <div class="accordion-item">
                <h2 class="accordion-header" id="<%=headingId%>">
                    <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse"
                        data-bs-target="#<%=collapseId %>" aria-expanded="false" aria-controls="<%=collapseId %>">
                        Question <%=q.getId() %>: <%=q.getName() %>
                        <% if(q.getCategory() != null && !q.getCategory().isEmpty()) { %>
                            <span class="badge bg-primary category-badge ms-2"><%=q.getCategory()%></span>
                        <% } %>
                    </button>
                </h2>
                <div id="<%=collapseId %>" class="accordion-collapse collapse" aria-labelledby="<%=headingId %>"
                    data-bs-parent="#questionAccordion">
                    <div class="accordion-body">
                    <% if(q.getType() != null && q.getType().equals("coding")) { %>
                    <div class="code-block">
                        <button class="btn btn-sm btn-light position-absolute top-0 end-0 m-2 copy-btn" title="Copy">
                            <i class="bi bi-clipboard"></i>
                        </button>
                        <pre><code><%= escapedCode %></code></pre>
                    </div>
                    <% } else { %>
                    <div class="answer-text"><%= q.getAnswer() %></div>
                    <% } %>
                    </div>
                </div>
            </div>
            <% 
                }
            } 
            %>
        </div>
    <% } %>
</div>

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

<%@ include file="footer.jsp"%>
</body>
</html>