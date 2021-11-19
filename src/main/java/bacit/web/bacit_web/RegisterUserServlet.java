package bacit.web.bacit_web;
import bacit.web.bacit_models.HtmlGreier;
import bacit.web.bacit_models.RegisterUserModel;
import bacit_utils.DBUtils;
import bacit_utils.PasswordHash;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

@WebServlet(name = "registerUserServlet", value = "/register_user")
public class RegisterUserServlet extends HttpServlet {

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.setContentType("text/html");

        PrintWriter out = response.getWriter();
        writeCreateUserForm(out,null);
    }


    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html");
        RegisterUserModel user = new RegisterUserModel();
        user.setFullName(request.getParameter("fullName"));
        user.setPhoneNumber(request.getParameter("phoneNumber"));
        user.seteMail(request.getParameter("email"));
        user.setFagforbund(false);
        user.setPassword(request.getParameter("password"));
        PrintWriter out = response.getWriter();
        if(validateUser(user)){
            try{
                writeUserToDb(user, out, request);
            }
            catch (SQLException | ClassNotFoundException ex){
                out.println(ex.getMessage());
            }
            HtmlGreier.writeHtmlStart(out, "Register user response");
            out.println("User: "+user.getFullName()+" and phone number: "
                    +user.getPhoneNumber()+" is registered");
            HtmlGreier.writeHtmlEnd(out);
        }
        else
        {
            writeCreateUserForm(out, "Validation failed");
        }
    }

    private void writeUserToDb(RegisterUserModel user, PrintWriter out, HttpServletRequest request) throws SQLException, ClassNotFoundException {
        Connection db = DBUtils.getINSTANCE().getConnection(out);
        String insertUserCommand = "insert into Brukere (Fult_navn, Telefonnummer, E_post, Fagforbund, Passord) values(?,?,?,?,?);";
        PreparedStatement statement = db.prepareStatement(insertUserCommand);
        statement.setString(1, user.getFullName());
        statement.setString(2, user.getPhoneNumber());
        statement.setString(3, user.geteMail());
        statement.setBoolean(4, user.getFagforbund());
        statement.setString(5, PasswordHash.encryptThisString(request.getParameter("password")));

        statement.executeUpdate();
    }

    private void writeCreateUserForm(PrintWriter out, String errorMessage) {
        HtmlGreier.writeHtmlStart(out, "Registrer bruker");
        if(errorMessage!=null)
        {
            out.println("<h3>"+errorMessage+"</h3>");
        }
        out.println("<form action='register_user' method='POST'>");
        out.println("<label for='fullName'>Fullt navn</label>");
        out.println("<input type='text' name='fullName'/>");
        out.println("<br>");
        out.println("<label for='phoneNumber'>Telefonnummer</label>");
        out.println("<input type='tel' name='phoneNumber' maxlength='11'/>");
        out.println("<br>");
        out.println("<label for='email'>E-post</label>");
        out.println("<input type='text' name='email'/>");
        out.println("<br>");
        out.println("<label for='password'>Passord</label> ");
        out.println("<input type='password' name='password'/>");
        out.println("<input type='submit' value='Registrer bruker'/>");
        out.println("</form>");
        HtmlGreier.writeHtmlEnd(out);
    }

    private Boolean validateUser(RegisterUserModel model){
        if(model.getFullName()==null)
            return false;
        if(model.getFullName().trim().equalsIgnoreCase(""))
            return false;
        if(model.getPhoneNumber()==null)
            return false;
        if(model.getPhoneNumber().trim().equalsIgnoreCase(""))
            return false;
        if(model.geteMail()==null)
            return false;
        if(model.geteMail().trim().equalsIgnoreCase(""))
            return false;
        if(model.getFagforbund()==null)
            return false;
        if(model.getPassword()==null)
            return false;
        if(model.getPassword().trim().equalsIgnoreCase(""))
            return false;

        return true;
    }
}
