<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Welcome Page</title>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script>
        $(document).ready(function () {
            $(".show-name-button").click(function () {
                var studentName = $(this).data("student-name");
                var buttonOffset = $(this).offset();

                $("#student-name-text").text("Student Name: " + studentName);
                $("#student-name-popup").css({
                    top: buttonOffset.top + $(this).outerHeight(),
                    left: buttonOffset.left
                }).show();
            });

            $(document).click(function (e) {
                if (!$(e.target).closest(".show-name-button").length && !$(e.target).is("#student-name-popup")) {
                    $("#student-name-popup").hide();
                }
            });
        });
    </script>
    <style>
        #student-name-popup {
            display: none;
            position: absolute;
            background-color: white;
            padding: 10px;
            border: 1px solid #ccc;
            box-shadow: 2px 2px 5px #888;
        }
    </style>
</head>
<body>
    <h1>Welcome, <%= session.getAttribute("userID") %></h1>
    
    <table border="1">
    <thead>
        <tr>
            <th>Department</th>
            <th>Student ID</th>
            <th>Marks</th>
            <th>Pass %</th>
        </tr>
    </thead>
    <tbody>
        <c:forEach items="${students}" var="student">
            <tr>
                <td>${student.getDepartment()}</td>
                <td>
                    <button class="show-name-button" data-student-name="${student.getName()}">
                        ${student.getId()}
                    </button>
                </td>
                <td>${student.getMark()}</td>
                <td>
                    <c:if test="${student.getMark() >= 40}">
                        ${100.0 * (student.getMark() >= 40 ? 1 : 0)}
                    </c:if>
                </td>
            </tr>
        </c:forEach>
    </tbody>
</table>

<div id="student-name-popup" style="display: none; position: absolute; background-color: white; padding: 10px;">
    <p id="student-name-text"></p>
</div>
</body>
</html>
