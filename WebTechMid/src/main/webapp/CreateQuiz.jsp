<%@include file="Components/Header.jsp"%>
<%@page import="com.kellia.webtechmid.model.*"%>
<%@page import="com.kellia.webtechmid.dao.*"%>
<%@ page import="java.util.List" %>
<%@ page import="java.time.LocalTime" %>
<%@ page import="java.util.UUID" %>
<jsp:useBean id="quizBean" class="com.kellia.webtechmid.beans.QuizBean" scope="request" />
<%
    Quiz quiz = new Quiz();
    QuizDao quizDao = new QuizDao();

    if ("POST".equalsIgnoreCase(request.getMethod())) {
        try {
            quiz.setId(UUID.randomUUID());
            quiz.setTitle(request.getParameter("title"));
            quiz.setDescription(request.getParameter("description"));
            quiz.setTotalScore(Float.parseFloat(request.getParameter("totalScore")));
            quiz.setDuration(Integer.parseInt(request.getParameter("duration")));
            // save to db
            quizDao.createQuiz(quiz);
            request.setAttribute("success", "Quiz successfully created.");
        } catch (Exception ex) {
            ex.printStackTrace();  // Log the error
            request.setAttribute("error", ex);
            request.getRequestDispatcher("CreateQuiz.jsp").forward(request, response);
        }
    }
%>
<main class="page contact-us-page">
    <section class="clean-block clean-form dark">
        <div class="container">
            <div class="block-heading">
                <h2 class="text-info">Kellia Quiz App - Create Quiz</h2>
                <p>You can create Quiz</p>
                <span class="form-label text-success" id="success-msg">${success}</span>
            </div>
            <form method="post" action="CreateQuiz.jsp">
                <div class="row mb-3">
                    <div class="mb-3 col-xl">
                        <label class="form-label" for="title">Title</label>
                        <input class="form-control" type="text" id="title" name="title" value="${quizBean.title}" required>
                    </div>
                    <div class="mb-3 col-xl">
                        <label class="form-label" for="description">Description</label>
                        <input class="form-control" type="text" id="description" name="description" value="${quizBean.description}" required>
                    </div>
                </div>

                <div class="row mb-3">
                    <div class="mb-3 col-xl">
                        <label class="form-label" for="duration">Duration</label>
                        <input class="form-control" type="number" id="duration" name="duration" value="${quizBean.duration}" required>
                    </div>
                    <div class="mb-3 col-xl">
                        <label class="form-label" for="totalScore">Total score</label>
                        <input class="form-control" type="number" id="totalScore" name="totalScore" value="${quizBean.totalScore}" required>
                    </div>
                </div>

                <div class="mb-2">
                    <button class="btn btn-primary" type="submit" id="createQuiz">Create Quiz</button>
                    <span class="form-label text-danger" id="error-msg">${error}</span>
                </div>
            </form>

            <div class="card mt-4">
                <div class="card-body">
                    <div class="table-responsive">
                        <table class="table">
                            <thead>
                            <tr>
                                <th scope="col" hidden="true">ID</th>
                                <th scope="col">Title</th>
                                <th scope="col">Description</th>
                                <th scope="col">Duration</th>
                                <th scope="col">Tot. Score</th>
                                <th scope="col">Creation Date</th>
                            </tr>
                            </thead>
                            <tbody>
                            <%
                                QuizDao quizDao1 = new QuizDao();
                                List<Quiz> quizzes = quizDao1.getAllquiz();
                                for(Quiz quizz : quizzes) {
                            %>
                            <tr>
                                <td hidden="true"><%= quizz.getId() %></td>
                                <td><%= quizz.getTitle() %></td>
                                <td>
                                    <%
                                        String description = quizz.getDescription();
                                        if(description.length() > 100) {
                                            description = description.substring(0, 100) + "...";
                                        }
                                    %>
                                    <%= description %>
                                </td>
                                <td><%= quizz.getDuration() %></td>
                                <td><%= quizz.getTotalScore() %></td>
                                <td><%= quizz.getCreatedDate() %></td>
                            </tr>
                            <%
                                }
                            %>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </section>
</main>
<%@include file="Components/Footer.jsp"%>