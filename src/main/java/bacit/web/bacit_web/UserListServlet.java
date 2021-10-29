package bacit.web.bacit_web;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

@WebServlet(name = "userList", value = "/User_list")
public class UserListServlet extends HttpServlet {

    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
       response.setContentType("text/html");

        PrintWriter out = response.getWriter();

        String brukerId = request.getParameter("user");

        if( !brukerId.isEmpty() ) {

        }
        else {


        out.println("<ul>");

        try {

            Connection con = DBUtils.getINSTANCE().getConnection(out);
            PreparedStatement ps = con.prepareStatement("select * from Brukere");
            ResultSet res = ps.executeQuery();

            while (res.next()){
                out.println("<li><a href='#'>"+res.getString("Fult_navn")+"</a></li>");
            }

            out.println("</ul>");
        }
        catch (SQLException | ClassNotFoundException e){
            out.println("Noe funket ikke: "+e);
        }
        }
    }
}
