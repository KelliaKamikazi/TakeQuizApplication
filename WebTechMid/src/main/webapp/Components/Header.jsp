<%--
  Created by IntelliJ IDEA.
  User: a1234
  Date: 26/03/2024
  Time: 16:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>quizz app</title>
    <link rel="stylesheet"
          href="https://fonts.googleapis.com/css?family=Montserrat:400,400i,700,700i,600,600i&amp;display=swap">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/baguettebox.js/1.11.1/baguetteBox.min.css">
    <style>
        .table th, .table td {
            overflow: visible;
            white-space: nowrap;
            width: auto;
        }
    </style>
</head>
<body>
<nav class="navbar navbar-light navbar-expand-lg  bg-white clean-navbar">
    <div class="container"><a class="navbar-brand logo" href="index.jsp">keke quiz app</a><button data-bs-toggle="collapse"
                                                                                         class="navbar-toggler" data-bs-target="#navcol-1"><span class="visually-hidden">Toggle
                    navigation</span><span class="navbar-toggler-icon"></span></button>
        <div class="collapse navbar-collapse" id="navcol-1">
            <ul class="navbar-nav ms-auto">

                <li class="nav-item"><a class="nav-link" href="#">Signup</a></li>
                <li class="nav-item"><a class="nav-link" href="#">Login</a></li>
                <li class="nav-item"><a class="nav-link" href="CreateQuiz.jsp">Create a quiz</a></li>
                <li class="nav-item"><a class="nav-link" href="Question.jsp">Create A question</a></li>
                <li class="nav-item"><a class="nav-link" href="Options.jsp">Create A options</a></li>
                <li class="nav-item"><a class="nav-link" href="winners.jsp">Look at the performances</a></li>


            </ul>
        </div>
    </div>
</nav>