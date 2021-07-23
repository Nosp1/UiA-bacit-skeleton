package bacit.web.bacit_web;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "GetUserServlet", value = "/GetUserServlet")
public class GetUserServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
        String uname = request.getParameter("uname");
        PrintWriter out = response.getWriter();
        try {
            UserModel model = getUser(uname, out);

            out.println(model.getFirstName());
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {

    }

    private UserModel getUser(String uname, PrintWriter out) throws SQLException {
        Connection db = null;
        try {
            db = DBUtils.getINSTANCE().getConnection(out);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }

        String query3 = "select * from user where User_firstName = ?";
        PreparedStatement statement = db.prepareStatement(query3);
        statement.setString(1, uname);
        ResultSet rs = statement.executeQuery();
        UserModel model = null;
        while (rs.next()) {
            model =
                new UserModel(rs.getString("User_firstName"), rs.getString("User_lastName"), rs.getString("User_Email"),
                    rs.getString("User_password"), rs.getString("User_dob"));
        }
        return model;
    }
}
