<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Winners</title>
</head>
<body>
<h1>Winners</h1>
<table border="1">
    <tr>
        <th>Quiz</th>
        <th>User</th>
        <th>Score</th>
    </tr>
    <c:forEach var="performance" items="${winners}">
        <tr>
            <td>${performance.quiz.title}</td>
            <td>${performance.user.username}</td>
            <td>${performance.score}</td>
        </tr>
    </c:forEach>
</table>
</body>
</html>
