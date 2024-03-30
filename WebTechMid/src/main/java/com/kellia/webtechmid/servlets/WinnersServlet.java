package com.kellia.webtechmid.servlets;

import com.kellia.webtechmid.dao.PerformanceDao;
import com.kellia.webtechmid.model.Performance;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;
import java.util.Collections;

@WebServlet("/winners")
public class WinnersServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        PerformanceDao performanceDao = new PerformanceDao();
        List<Performance> performances = performanceDao.getAllPerformance();

        // Sort performances based on score in ascending order
        Collections.sort(performances, (p1, p2) -> p1.getScore().compareTo(p2.getScore()));

        // Forward the sorted list to the JSP page
        request.setAttribute("performances", performances);
        request.getRequestDispatcher("/winners.jsp").forward(request, response);
    }
}