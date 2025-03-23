package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Madusanka
 */
@WebServlet(name = "A", urlPatterns = {"/A"})
public class A extends HttpServlet {

//    int n = 0;
    int x = 0;
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ServletContext sc = request.getServletContext();
//    
        Integer requests = (Integer) sc.getAttribute("requests");
        if (requests == null) {
            requests = 1;
        } else {
            requests++;
        }
        sc.setAttribute("requests", requests);
        
        HttpSession session = request.getSession();
        if (session.isNew()) {
            Integer users = (Integer) sc.getAttribute("users");
            if (users == null) {
                users = 1;
            } else {
                users++;
            }
            sc.setAttribute("users", users);
        }
        response.getWriter().write("<h1>Requets: " + requests + "</h1>");
        response.getWriter().write("<h1>Users: " + sc.getAttribute("users") + "</h1>");
    }
    
}
