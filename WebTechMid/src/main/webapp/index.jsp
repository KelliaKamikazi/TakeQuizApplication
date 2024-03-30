<%@include file="Components/Header.jsp"%>
<%@page import="com.kellia.webtechmid.model.*"%>
<%@page import="com.kellia.webtechmid.dao.*"%>
<%@ page import="java.util.List" %>
<%@ page import="java.time.LocalTime" %>
<%@ page import="java.util.UUID" %>
<jsp:useBean id="quizBean" class="com.kellia.webtechmid.beans.QuizBean" scope="request" />
<main class="page landing-page container" >
 <div class="row gap-3 align-items-center">
     <%
         QuizDao quizDao1 = new QuizDao();
         List<Quiz> quizzes = quizDao1.getAllquiz();
         for(Quiz quizz : quizzes) {
     %>
     <div class="card" style="width: 20rem;">
         <div class="card-body">
             <h5 class="card-title"><%= quizz.getTitle() %> </h5>
             <h6 class="card-subtitle mb-2 text-muted"><%= quizz.getDuration()%> Minutes</h6>
             <p class="card-text"><%
                 String description = quizz.getDescription();
                 if(description.length() > 100) {
                     description = description.substring(0, 100) + "...";
                 }
             %>
                 <%= description %></p>
             <a href="AttemptQuiz.jsp?quizId=<%= quizz.getId() %>"class="card-link">Attempt Quiz</a>
         </div>
     </div>
     <%
         }
     %>

    </div>
 </div>
</main>
<%@include file="Components/Footer.jsp"%>