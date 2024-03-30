<%@include file="Components/Header.jsp"%>
<%@page import="com.kellia.webtechmid.model.*"%>
<%@page import="com.kellia.webtechmid.dao.*"%>
<%@ page import="java.util.UUID" %>
<%@ page import="java.util.List" %>
<jsp:useBean id="optionBean" class="com.kellia.webtechmid.beans.OptionsBean" scope="request" />
<%
    Options option = new Options();
    OptionsDao optionDao = new OptionsDao();

    if ("POST".equalsIgnoreCase(request.getMethod())) {
        try {
            option.setOptionId(UUID.randomUUID());
            option.setOptionText(request.getParameter("optionText"));
            UUID questionId = UUID.fromString(request.getParameter("questionId"));
            Questions question = new Questions();
            question.setId(questionId);
            optionDao.createOptions(option);
            request.setAttribute("success", "Option successfully created.");
        } catch (Exception ex) {
            ex.printStackTrace();  // Log the error
            request.setAttribute("error", ex);
            request.getRequestDispatcher("CreateOption.jsp").forward(request, response);
        }
    }
%>
<main class="page contact-us-page">
    <section class="clean-block clean-form dark">
        <div class="container">
            <div class="block-heading">
                <h2 class="text-info">Create Option here!</h2>
                <p>You can create an Option for a specific Question</p>
                <span class="form-label text-success" id="success-msg">${success}</span>
            </div>
            <form method="post" action="Options.jsp">
                <div class="row mb-3">
                    <div class="mb-3 col-xl">
                        <label class="form-label" for="questionId">Question ID</label>
                        <select class="form-control" id="questionId" name="questionId" required>
                            <%
                                // Assuming you have a method to get all questions from the database
                                List<Questions> questions = QuestionsDao.getAllquestion();
                                for (Questions question : questions) {
                            %>
                            <option value="<%= question.getId() %>"><%= question.getTxtQuestion() %></option>
                            <% } %>
                        </select>
                    </div>
                </div>
                <div class="row mb-3">
                    <div class="mb-3 col-xl">
                        <label class="form-label" for="optionText">Option Text</label>
                        <input type="text" class="form-control" id="optionText" name="optionText" required>
                    </div>
                </div>
                <div class="mb-2">
                    <button class="btn btn-primary" type="submit" id="createOption">Create Option</button>
                    <span class="form-label text-danger" id="error-msg">${error}</span>
                </div>
            </form>
        </div>
    </section>
</main>
<%@include file="Components/Footer.jsp"%>
