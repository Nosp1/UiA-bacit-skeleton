package bacit.web.bacit_web;
import bacit.web.bacit_models.HtmlGreier;
import bacit.web.bacit_models.RegisterUserModel;

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


    @Override
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
                writeUserToDb(user, out);
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

    private void writeUserToDb(RegisterUserModel user,PrintWriter out) throws SQLException, ClassNotFoundException {
        Connection db = DBUtils.getINSTANCE().getConnection(out);
        String insertUserCommand = "insert into Brukere (Fult_navn, Telefonnummer, E_post, Fagforbund, Passord) values(?,?,?,?,?);";
        PreparedStatement statement = db.prepareStatement(insertUserCommand);
        statement.setString(1, user.getFullName());
        statement.setString(2, user.getPhoneNumber());
        statement.setString(3, user.geteMail());
        statement.setBoolean(4, user.getFagforbund());
        statement.setString(5, user.getPassword());

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
        out.println("<input type='text' placeholder='fullName'/>");
        out.println("<br>");
        out.println("<label for='phoneNumber'>Telefonnummer</label>");
        out.println("<input type='tel' placeholder='phoneNumber'/>");
        out.println("<br>");
        out.println("<label for='email'>E-post</label>");
        out.println("<input type='text' placeholder='email'/>");
        out.println("<br>");
        out.println("<label for='password'>Passord</label> ");
        out.println("<input type='password' name='password'/>");
        out.println("<input type='submit' value='Registrer bruker'/>");
        out.println("</form>");
        HtmlGreier.writeHtmlEnd(out);
    }


    private void writeHtmlStart(PrintWriter out, String title) {
        out.println("z<html><head>\n" +
                "    <meta charset=\"UTF-8\">\n" +
                "    <meta name=\"viewport\" content=\"width=device-width\">\n" +
                "    <title>AMV</title>\n" +
                "    <link rel=\"stylesheet\" href=\"style.css\">\n" +
                "</head><body> <header>\n" +
                "    <div class=\"container\">\n" +
                "        <div id=\"branding\">\n" +
                "            <h1><span class=\"highlight\">A</span>M<span class=\"highlight\">V</span></h1>\n" +
                "        </div>\n" +
                "        <nav>\n" +
                "            <ul>\n" +
                "                <li><a href=\"http://localhost:8081/bacit-web-1.0-SNAPSHOT/product_list\">Startside</a></li>\n" +
                "                <li class=\"current\"><a href=\"http://localhost:8081/bacit-web-1.0-SNAPSHOT/register_user\">Cheerios</a></li>\n" +
                "                <li><a href=\"Iskaffe.html\">Iskaffe</a></li>\n" +
                "                <li><input type=\"text\" placeholder=\"Search..\"></li>\n" +
                "            </ul>\n" +
                "        </nav>\n" +
                "    </div>\n" +
                "</header>");
    }
    private void writeHtmlEnd(PrintWriter out) {
        out.println("</body> <footer>\n" +
                "    <p>Nora's forslag, copyright &copy; 2021</p>\n" +
                "</footer>\n" +
                "</body>\n" +
                "</html>");
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
