package com.jdwebapps.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import com.jdwebapps.model.Student;

@WebServlet("/welcome")
public class WelcomeServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<Student> students = new ArrayList<>();
        students.add(new Student("S1", "Student 1", "Dep 1", 35));
        students.add(new Student("S2", "Student 2", "Dep 1", 70));
        students.add(new Student("S3", "Student 3", "Dep 1", 60));
        students.add(new Student("S4", "Student 4", "Dep 1", 90));
        students.add(new Student("S5", "Student 5", "Dep 2", 30));
        students.add(new Student("S6", "Student 6", "Dep 3", 32));
        students.add(new Student("S7", "Student 7", "Dep 3", 70));
        students.add(new Student("S8", "Student 8", "Dep 3", 20));

        request.setAttribute("students", students);
        request.getRequestDispatcher("welcome.jsp").forward(request, response);
    }
}
