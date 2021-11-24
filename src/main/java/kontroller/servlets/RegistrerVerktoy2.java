package kontroller.servlets;

import modell.Connector;


import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import java.io.IOException;

import java.io.InputStream;
import java.io.PrintWriter;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.logging.Logger;


@WebServlet("/RegistrerVerktoy2")
@MultipartConfig(maxFileSize = 1024 * 1024 * 2)
public class RegistrerVerktoy2 extends HttpServlet {



    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        request.getRequestDispatcher("registrerVerktoy2.jsp").forward(request, response);
    }
    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        InputStream image = null;

        PreparedStatement ps;
        Connection con;
        Part filePart = request.getPart("image");

        if (filePart != null) {
            image = filePart.getInputStream();
        }

        try{
            String VerktoyNavn = request.getParameter("VerktoyTypeNavn");
            con = Connector.getINSTANCE().getConnection(out);
            String query = "INSERT INTO amv.VerktoyType (VerktoyTypeNavn, VerktoyBilde) values (?,?)";

            ps = con.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);
            ps.setString(1, VerktoyNavn);
            if (image != null) {
                ps.setBlob(2, image);
            }
            ps.execute();
            int VtID = 0;
            ResultSet rs = ps.getGeneratedKeys();
            if (rs.next()){
                    VtID = (int) rs.getLong(1);

            }

               request.setAttribute("VtID", VtID);
               request.getRequestDispatcher("registrerVerktoy3.jsp").forward(request, response);



           // request.getRequestDispatcher("/RegistrerVerktoy3").forward(request, response);*/



        }
        catch(Exception ex)
        {
            ex.printStackTrace();

        }

    }


}