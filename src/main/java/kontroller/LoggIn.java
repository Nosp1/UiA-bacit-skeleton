package kontroller;


import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

//Denne servletten har ansvar for å logge inn dataen

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/LoggIn")
public class LoggIn extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.setContentType("text/html");

        // Hello
        PrintWriter out = response.getWriter();
        out.println("<html><body>");
        out.println("<h1>Get someone from the database :-)</h1>");
        out.println("<form action='loggIn' method='POST'>");
        out.println("  <label for='uname'>email:</label>");
        out.println("  <input type='text' name='uname'/>");
        out.println("  <input type='text' name='userpass'/>");
        out.println("  <input type='submit' />");
        out.println("</form>");
        out.println("</body></html>");
    }
    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        String n=request.getParameter("uname");
        String p=request.getParameter("userpass");
        out.println("HALLA");


        out.close();
    }
}