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

@WebServlet(name = "productList", value = "/Product_list")
public class ProductListServlet extends HttpServlet {

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.setContentType("text/html;charset=UTF-8");

        PrintWriter out = response.getWriter();

        String ProduktID = request.getParameter("produkt");

        if( ProduktID != null ) {

        }
        else {


            out.println("<ul>");

            try {

                Connection con = DBUtils.getINSTANCE().getConnection(out);
                PreparedStatement ps = con.prepareStatement("select * from Produkter where brukes = 0");
                ResultSet res = ps.executeQuery();

                while (res.next()){
                    out.println("<li><a href='#'>"+res.getString("Produkt_navn")+"</a></li>");
                    out.println("<li>"+res.getString("Kategori")+"</li>");
                    out.println("<li>"+res.getString("Beskrivelse")+"</li>");
                }

                out.println("</ul>");
            }
            catch (SQLException | ClassNotFoundException e){
                out.println("Noe funket ikke: "+e);
            }
        }
    }
}


