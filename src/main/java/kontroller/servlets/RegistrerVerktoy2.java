package kontroller.servlets;

import modell.Connector;

import java.io.*;
import java.sql.DriverManager;
import java.util.Scanner;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import javax.servlet.annotation.MultipartConfig;

import java.sql.*;

/**
 * Servlet implementation class uploadServlet
 */
@WebServlet("/RegistrerVerktoy2")
@MultipartConfig
public class RegistrerVerktoy2 extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub

        Part p2 = request.getPart("filesel");
        InputStream is = p2.getInputStream();

        Scanner
                sc = new Scanner(p2.getContentType());
        String type = sc.next();
        PrintWriter out = response.getWriter();
        try {
            String path = request.getServletContext().getRealPath("/Users/kevin/Desktop/IS-20X/UiA-bacit-skeleton/src/main/webapp/view/css/verktoybilder");
            FileOutputStream fos = new FileOutputStream(path);
            byte buf[] = new byte[is.available()];
            is.read(buf);
            fos.write(buf);
            fos.flush();
            fos.close();
            // use this part only if you wish to store files in database

            Connection con = Connector.getINSTANCE().getConnection(out);
            PreparedStatement ps = con.prepareStatement("insert into VerktoyType (VerktoyBilde) values(?) ");

            ps.setString(1, path);
            ps.execute();
            ps.close();
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void doGet(HttpServletRequest req, HttpServletResponse res) throws IOException {
        res.sendRedirect("registrerVerktoy2.jsp");
    }
}














































