<%@include file="Components/Header.jsp"%>
<%@page import="com.kellia.webtechmid.model.*"%>
<%@page import="com.kellia.webtechmid.dao.*"%>
<%@ page import="java.util.UUID" %>
<%@ page import="java.util.List" %>
<jsp:useBean id="questionBean" class="com.kellia.webtechmid.beans.QuestionsBean" scope="request" />
<%
    Questions question = new Questions();
    QuestionsDao questionDao = new QuestionsDao();

    if ("POST".equalsIgnoreCase(request.getMethod())) {
        try {
            question.setId(UUID.randomUUID());
            question.setTxtQuestion(request.getParameter("txtQuestion"));
            question.setAnswer(request.getParameter("answer"));
            question.setScore(Float.parseFloat(request.getParameter("score")));
            UUID quizId = UUID.fromString(request.getParameter("quizId"));
            Quiz quiz = new Quiz();
            quiz.setId(quizId);
            question.setQuiz(quiz);
            // Assuming quizId is passed as a parameter from the form
//            UUID quizId = UUID.fromString(request.getParameter("quizId"));
            question.setQuiz(quiz);
            // Save to the database
            questionDao.createQuestions(question);
            request.setAttribute("success", "Question successfully created.");
        } catch (Exception ex) {
            ex.printStackTrace();  // Log the error
            request.setAttribute("error", ex);
            request.getRequestDispatcher("CreateQuestion.jsp").forward(request, response);
        }
    }
%>
<main class="page contact-us-page">
    <section class="clean-block clean-form dark">
        <div class="container">
            <div class="block-heading">
                <h2 class="text-info">Create Question here!</h2>
                <p>You can create Question for a specific Quiz</p>
                <span class="form-label text-success" id="success-msg">${success}</span>
            </div>
            <form method="post" action="Question.jsp">
                <div class="row mb-3">
                    <div class="mb-3 col-xl">
                        <label class="form-label" for="quizId">Quiz ID</label>
                        <select class="form-control" id="quizId" name="quizId" required>
                            <%
                                List<Quiz> quizzes = QuizDao.getAllquiz();
                                for (Quiz quiz : quizzes) {
                            %>
                            <option value="<%= quiz.getId() %>"><%= quiz.getTitle() %></option>
                            <% } %>
                        </select>
                    </div>
                </div>
                <div class="row mb-3">
                    <div class="mb-3 col-xl">
                        <label class="form-label" for="txtQuestion">Question</label>
                        <textarea class="form-control" id="txtQuestion" name="txtQuestion" rows="3" required></textarea>
                    </div>
                </div>
                <div class="row mb-3">
                    <div class="mb-3 col-xl">
                        <label class="form-label" for="answer">Answer</label>
                        <input type="text" class="form-control" id="answer" name="answer" required>
                    </div>
                </div>
                <div class="row mb-3">
                    <div class="mb-3 col-xl">
                        <label class="form-label" for="score">Score</label>
                        <input type="number" class="form-control" id="score" name="score" required>
                    </div>
                </div>
                <div class="mb-2">
                    <button class="btn btn-primary" type="submit" id="createQuestion">Create Question</button>
                    <span class="form-label text-danger" id="error-msg">${error}</span>
                </div>
            </form>
        </div>
    </section>
</main>
<%@include file="Components/Footer.jsp"%>