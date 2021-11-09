package servlets;

import modell.loggInn.Verktoy;
import modell.loggInn.DBUtils;

import javax.servlet.Servlet;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import java.util.Base64;

import static utils.SessionRetrieval.getSessionUser;


@WebServlet(name = "VerktoyList", urlPatterns = {"/VerktoyList"})
public class VerktoyList extends Servlet {


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws IOException, ServletException {
        request.setCharacterEncoding("UTF-8");

        Connection db = null;
        PreparedStatement ps;

        ArrayList<Verktoy> VerktoyList = new ArrayList<>();
        try {
            db = DBUtils.getINSTANCE().getConnection();
            String query = null;

            ps = db.prepareStatement(null);
            ResultSet rs;
            rs = ps.executeQuery();
            while (rs.next()) {
                Verktoy user = new Verktoy();

                Verktoy.setVerktoyTypeID(rs.getInt("VerktoyTypeID"));

                String string = rs.getString("VerktoyBilde");

                }

                Verktoy.setVerktoyTypeID(rs.getInt("VerktoyTypeID"));
                Verktoy.setVerktoyTypeNavn(rs.getString("VerktoyTypeNavn"));
                Verktoy.setVerktoyBilde(rs.getString("VerktoyBilde"));


                Verktoy.add(Verktoy);
            } catch (SQLException throwables) {
            throwables.printStackTrace();
        } catch (ClassNotFoundException classNotFoundException) {
            classNotFoundException.printStackTrace();
        }
        request.setAttribute("userList", Verktoy);
            request.getRequestDispatcher("Verktoy.jsp").forward(request, response);
            rs.close();

        } catch (SQLException | ServletException e) {
            e.printStackTrace();

        } finally {
            try {
                assert db != null;
                db.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) {
    }
}