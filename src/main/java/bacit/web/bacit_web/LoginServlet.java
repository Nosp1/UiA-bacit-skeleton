package bacit.web.bacit_web;

import java.io.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet(name = "LoginServlet", value = "/login")
public class LoginServlet extends HttpServlet {

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.setContentType("text/html");

        PrintWriter out = response.getWriter();
        writeLoginForm(out,null);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
        response.setContentType("text/html;charset=utf-8");
        PrintWriter out = response.getWriter();

        String Telefonnummer = request.getParameter("Telefonnummer");
        String Passord = request.getParameter("Passord");

        if(Validate.checkUser(Telefonnummer, Passord, out)) {
            RequestDispatcher rs = request.getRequestDispatcher("Welcome");
            rs.forward(request, response);
        }
        else {
            out.println("Brukernavn eller passord er feil");
            RequestDispatcher rs = request.getRequestDispatcher("LoginServlet");
            rs.include(request, response);
        }
    }

    private void writeLoginForm(PrintWriter out, String errorMessage) {
        writeHtmlStart(out, "Logg inn");
        if(errorMessage!=null)
        {
            out.println("<h3>"+errorMessage+"</h3>");
        }
        out.println("<form action='login' method='post'/>");
        out.println("<label for='Telefonnummer'>Telefonnummer</label>");
        out.println("<input type='text' name='Telefonnummer'/>");
        out.println("<label for='Passord'>Passord</label>");
        out.println("<input type='password' name='Passord'/>");
        out.println("<input type='submit' value='login'/>");
        out.println("<br>");
        out.println("<a href='/bacit-web-1.0-SNAPSHOT/register_user'>Registrer bruker</a>");
        out.println("</form>");
        writeHtmlEnd(out);
    }
    private void writeHtmlStart(PrintWriter out, String title) {
        out.println("<html>");
        out.println("<head>");
        out.println("<title>"+title+"</title>");
        out.println("</head>");
        out.println("<body>");
        out.println("<h2>"+title+"</h2>");
    }
    private void writeHtmlEnd(PrintWriter out) {
        out.println("</body>");
        out.println("</html>");
    }
}

