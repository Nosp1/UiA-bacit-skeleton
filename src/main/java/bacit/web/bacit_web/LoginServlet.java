package bacit.web.bacit_web;

import bacit.web.bacit_models.RegisterUserModel;

import java.io.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.sql.*;

@WebServlet(name = "LoginServlet", value = "/login")
public class LoginServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
        response.setContentType("text/html;charset=utf-8");
        PrintWriter out = response.getWriter();

        String Telefonnummer = request.getParameter("Telefonnummer");
        String Passord = request.getParameter("Passord");

        if(Validate.checkUser(Telefonnummer, Passord)) {
            RequestDispatcher rs = request.getRequestDispatcher("Velkommen");
            rs.forward(request, response);
        }
        else {
            out.println("Brukernavn eller passord er feil");
            RequestDispatcher rs = request.getRequestDispatcher("login.html");
            rs.include(request, response);
        }
    }
    public static boolean checkUser(String Telefonnummer, String Passord) throws SQLException, ClassNotFoundException {
        Connection db = DBUtils.getINSTANCE().getConnection(out);
        String insertUserCommand = "SELECT * FROM Brukere WHERE Telefonnumer=? and Passord=?;";
        PreparedStatement statement = db.prepareStatement(insertUserCommand);
        statement.setString(1, user.getTelefonnummer());
        statement.setString(2, user.getPassord());
 
        statement.executeUpdate();
}

