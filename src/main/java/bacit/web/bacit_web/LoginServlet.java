package bacit.web.bacit_web;

import bacit.web.bacit_models.HtmlGreier;
import bacit_utils.DBUtils;
import bacit_utils.PasswordHash;

import java.io.*;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
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

        String Telefonnummer = request.getParameter("E_post");
        String Passord = PasswordHash.encryptThisString(request.getParameter("password"));

        if(checkUser(Telefonnummer, Passord, out)) {
            response.sendRedirect("Product_list");
        }
        else {
            out.println("Epost eller passord er feil");
            out.println("<a href='/bacit-web-1.0-SNAPSHOT/login'>Prøv igjen</a>");
        }
    }

    private void writeLoginForm(PrintWriter out, String errorMessage) {
        HtmlGreier.writeHtmlStart(out, "Logg inn");
        if (errorMessage != null) {
            out.println("<h3>" + errorMessage + "</h3>");
        }
        out.println("<form action='login' method='post'/>");
        out.println("<label for='E_post'>E-post</label>");
        out.println("<input type='text' name='E_post'/>");
        out.println("<label for='Passord'>Passord</label>");
        out.println("<input type='password' name='Passord'/>");
        out.println("<input type='submit' value='Login'/>");
        out.println("<br>");
        out.println("<a href='/bacit-web-1.0-SNAPSHOT/register_user'>Registrer bruker</a>");
        out.println("</form>");
        HtmlGreier.writeHtmlEnd(out);
    }

    public static boolean checkUser(String E_post, String Passord, PrintWriter out) {

        {
            boolean st = false;
            try {

                Connection con = DBUtils.getINSTANCE().getConnection(out);

                PreparedStatement ps = con.prepareStatement("select * from Brukere where E_post=? and Passord=?");
                ps.setString(1, E_post);
                ps.setString(2, Passord);
                ResultSet rs = ps.executeQuery();
                st = rs.next();
            } catch (Exception e) {
                e.printStackTrace();
            }
            return st;
        }
    }
}
