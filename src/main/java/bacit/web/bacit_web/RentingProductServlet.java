package bacit.web.bacit_web;

import bacit.web.bacit_models.HtmlGreier;
import bacit.web.bacit_models.RegisterUserModel;
import bacit.web.bacit_models.RentProductModel;
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

@WebServlet(name="RentingProductServlet", value = "/renting")
public class RentingProductServlet extends HttpServlet {

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.setContentType("text/html");

        PrintWriter out = response.getWriter();
        writeCreateRentForm(out, null);
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        RentProductModel product = new RentProductModel();
        product.setProductName(request.getParameter("productName"));
        product.setCategory(request.getParameter("category"));
        product.setDescription(request.getParameter("description"));
        product.setBeeingUsed(true);
        PrintWriter out = response.getWriter();
        if (prodcutIsAvalible(product)) {
            try {
                reserveProduct();
            } catch (SQLException | ClassNotFoundException ex) {
                out.println(ex.getMessage());
            }
            HtmlGreier.writeHtmlStart(out, "Rent product response");
            out.println("Product: " + product.getProductName() + " is reserved");
            HtmlGreier.writeHtmlEnd(out);
        } else {
            System.out.println("Reservering av produkt feilet!");
        }
    }

    private void reserveProduct(RentProductModel product, PrintWriter out, HttpServletRequest request) throws SQLException, ClassNotFoundException {
        Connection db = DBUtils.getINSTANCE().getConnection(out);
        String insertUserCommand = "insert into Reservasjoner (Produk_ID, Bruker_ID, Reservasjon_dato_fra, Reservasjon_dato_til) values(?,?,?,?);";
        PreparedStatement statement = db.prepareStatement(insertUserCommand);
        statement.setString(1, product.getProduktID());
        statement.setString(2, product.getBrukerID());
        statement.setString(3, product.getReservasjonFra());
        statement.setBoolean(4, product.getReservasjonTil());

        statement.executeUpdate();
    }

    private void writeCreateRentForm(PrintWriter out, String errorMessage) {
        HtmlGreier.writeHtmlStart(out, "Lån");
        if (errorMessage != null) {
            out.println("<h3>" + errorMessage + "</h3>");
        }
        out.println("<form action='rent_product' method='POST'>");
        out.println("<label for='dato_fra'>Fra</label>");
        out.println("<input type='date' name='date_from'/>");
        out.println("<label for='dato_til'>Til</label>");
        out.println("<input type='date' name='date_to'/>");
        out.println("<input type='submit' value='Bekreft'/>");
        out.println("</form>");
        HtmlGreier.writeHtmlEnd(out);
    }

    public boolean prodcutIsAvalible(RentProductModel product) {
        if (product.getProductName() == null) return false;
        if (product.getProductName().trim().equalsIgnoreCase(""))
            return false;
        if (product.getCategory() == null)
            return false;
        if (product.getCategory().trim().equalsIgnoreCase(""))
            return false;
        if (product.getDescription() == null)
            return false;
        if (product.getDescription().trim().equalsIgnoreCase(""))
            return false;
        if (product.getBeeingUsed() == null)
            return false;

        return true;
    }
}



