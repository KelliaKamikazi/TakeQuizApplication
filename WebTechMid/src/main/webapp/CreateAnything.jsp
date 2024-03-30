<%@include file="Components/Header.jsp"%>
<%@page import="com.kellia.webtechmid.model.*"%>
<%@page import="java.util.UUID"%>
<%@ page import="java.util.List" %>
<jsp:useBean id="courseBean" class="com.kellia.webtechmid.beans.QuestionsBean" scope="request" />
<%
    Questions  question  = new Questions();
//    CourseDefinitionService courseDefinitionService = new CourseDefinitionServiceImpl(); // check Reverse Engineering Wizard
//    TeacherService teacherService = new TeacherServiceImpl();
//    SemesterService semesterService = new SemesterServiceImpl();

    if ("POST".equalsIgnoreCase(request.getMethod())) {
        try {
            question.set(UUID.randomUUID());

            String accUnitId = request.getParameter("acc_unit");
            if (accUnitId != null && !accUnitId.trim().isEmpty()) {
                AcademicUnit acc = academicUnitService.findById(UUID.fromString(accUnitId));
                course.setAcc_unit(acc);
            }

            String courseDefId = request.getParameter("courseDefinition");
            if (courseDefId != null && !courseDefId.trim().isEmpty()) {
                CourseDefinition coursdefi = courseDefinitionService.findById(UUID.fromString(courseDefId));
                course.setCourseDefinition(coursdefi);
            }

            String tutorId = request.getParameter("tutor");
            if (tutorId != null && !tutorId.trim().isEmpty()) {
                Teacher tchr = teacherService.findById(UUID.fromString(tutorId));
                course.setTutor(tchr);
            }

            String assId = request.getParameter("assistant");
            if (assId != null && !assId.trim().isEmpty()) {
                Teacher ass = teacherService.findById(UUID.fromString(assId));
                course.setAssistant(ass);
            }

            String semesterId = request.getParameter("semesterId");
            if (semesterId != null && !semesterId.trim().isEmpty()) {
                Semester sem_id = semesterService.findById(UUID.fromString(semesterId));
                course.setSemester(sem_id);
            }

            // save to db
            courseService.createCourse(course);

            request.setAttribute("success", "Course successfully created.");
        } catch (Exception ex) {
            ex.printStackTrace();  // Log the error
            request.setAttribute("error", ex);
        }
    }
%>
<main class="page contact-us-page">
    <section class="clean-block clean-form dark">
        <div class="container">
            <div class="block-heading">
                <h2 class="text-info">AUCA - Create Course</h2>
                <p>You can create Course Definition</p>
                <span class="form-label text-success" id="success-msg">${success}</span>
            </div>
            <form method="post" action="course.jsp">
                <div class="row mb-3">
                    <div class="mb-3 col-xl">
                        <label class="form-label" for="acc_unit">Academic Unit</label>
                        <select class="form-control" id="acc_unit" name="acc_unit" required>
                            <%
                                CourseService courseDropAccUnitInt = new CourseServiceImpl();
                                List<Object[]> courseDropAccUnits = courseDropAccUnitInt.getAcademicUnits();
                                for(Object[] obj : courseDropAccUnits) {
                                    String id = String.valueOf(obj[0]);
                                    String name = String.valueOf(obj[1]);
                            %>
                            <option value="<%= id %>"><%= name %></option>
                            <%
                                }
                            %>
                        </select>
                    </div>
                    <div class="mb-3 col-xl">
                        <label class="form-label" for="courseDefinition">Course Definition</label>
                        <select class="form-control" id="courseDefinition" name="courseDefinition" required>
                            <%
                                CourseService courseDropIntCDef = new CourseServiceImpl();
                                List<Object[]> courseDropCDefs= courseDropIntCDef.getCourseDefinition();
                                for(Object[] obj : courseDropCDefs) {
                                    String id = String.valueOf(obj[0]);
                                    String name = String.valueOf(obj[1]);
                            %>
                            <option value="<%= id %>"><%= name %></option>
                            <%
                                }
                            %>
                        </select>
                    </div>
                </div>
                <div class="row mb-3">
                    <div class="mb-3 col-xl">
                        <label class="form-label" for="tutor">Course Tutor</label>
                        <select class="form-control" id="tutor" name="tutor" required>
                            <%
                                CourseService courseDropIntTutor = new CourseServiceImpl();
                                List<Object[]> courseDropTutors= courseDropIntTutor.getTutorsAndAssistants();
                                for(Object[] obj : courseDropTutors) {
                                    String id = String.valueOf(obj[0]);
                                    String name = String.valueOf(obj[1]);
                            %>
                            <option value="<%= id %>"><%= name %></option>
                            <%
                                }
                            %>
                        </select>
                    </div>
                    <div class="mb-3 col-xl">
                        <label class="form-label" for="assistant">Course Assistant</label>
                        <select class="form-control" id="assistant" name="assistant">
                            <%
                                CourseService courseDropInt = new CourseServiceImpl();
                                List<Object[]> courseDrops= courseDropInt.getTutorsAndAssistants();
                                for(Object[] obj : courseDrops) {
                                    String id = String.valueOf(obj[0]);
                                    String name = String.valueOf(obj[1]);
                            %>
                            <option value="<%= id %>"><%= name %></option>
                            <%
                                }
                            %>
                        </select>
                    </div>
                </div>

                <div class="row mb-3">
                    <div class="mb-3 col-xl">
                        <label class="form-label" for="semesterId">Semester</label>
                        <select class="form-control" id="semesterId" name="semesterId" required>
                            <%
                                CourseService courseService1 = new CourseServiceImpl();
                                List<Object[]> semesterDropList= courseService1.getAllSemesters();
                                for(Object[] obj : semesterDropList) {
                                    String id = String.valueOf(obj[0]);
                                    String sem_code = String.valueOf(obj[1]);
                                    String sem_name = String.valueOf(obj[2]);
                                    String sem_start_date = String.valueOf(obj[3]);
                                    String sem_reg_date = String.valueOf(obj[4]);
                            %>
                            <option value="<%= id %>"><%= sem_code +" - "+ sem_name + ". from " + sem_start_date + " to " + sem_reg_date%></option>
                            <%
                                }
                            %>
                        </select>
                    </div>
                </div>

                <div class="mb-2">
                    <button class="btn btn-primary" type="submit" id="createUnit">Create Course</button>
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
                                <th scope="col">Academic Unit</th>
                                <th scope="col">Course Definition</th>
                                <th scope="col">Tutor</th>
                                <th scope="col">Assistant</th>
                            </tr>
                            </thead>
                            <tbody>
                            <%
                                CourseService coursInt = new CourseServiceImpl();
                                List<Course> courses= coursInt.fetchAllCourses();
                                for(Course cours : courses) {
                            %>
                            <tr>
                                <td hidden="true"><%= cours.getCourse_id() %></td>
                                <td><%= cours.getAcc_unit() %></td>
                                <td><%= cours.getCourseDefinition() %></td>
                                <td><%= cours.getTutor() %></td>
                                <td><%= cours.getAssistant() %></td>
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
<%@include file="components/footer.jsp"%>