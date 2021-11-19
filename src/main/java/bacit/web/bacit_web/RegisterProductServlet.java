package bacit.web.bacit_web;

import bacit.web.bacit_models.HtmlGreier;
import bacit.web.bacit_models.RegisterProductModel;
import bacit_utils.DBUtils;

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

    @WebServlet(name = "registerProductServlet", value = "/register_product")
    public class RegisterProductServlet extends HttpServlet {

        public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
            response.setContentType("text/html");

            PrintWriter out = response.getWriter();
            writeCreateProductForm(out,null);
        }


        protected void doPost(HttpServletRequest request, HttpServletResponse response)
                throws ServletException, IOException {

            response.setContentType("text/html");
            RegisterProductModel Product = new RegisterProductModel();
            Product.setProductName(request.getParameter("productName"));
            Product.setCategory(request.getParameter("category"));
            Product.setBeskrivelse(request.getParameter("beskrivelse"));
            PrintWriter out = response.getWriter();
            if(validateProduct(Product)){
                try{
                    writeProductToDb(Product, out);
                }
                catch (SQLException | ClassNotFoundException ex){
                    out.println(ex.getMessage());
                }
                HtmlGreier.writeHtmlStart(out, "Register Product response");
                out.println("Product: "+Product.getproductName()+" is registered");
                HtmlGreier.writeHtmlEnd(out);
            }
            else
            {
                writeCreateProductForm(out, "Validation failed");
            }
        }

        private void writeProductToDb(RegisterProductModel Product,PrintWriter out) throws SQLException, ClassNotFoundException {
            Connection db = DBUtils.getINSTANCE().getConnection(out);
            String insertProductCommand = "insert into Produkter (Produkt_navn, Kategori, Beskrivelse, Brukes) values(?,?,?,0);";
            PreparedStatement statement = db.prepareStatement(insertProductCommand);
            statement.setString(1, Product.getproductName());
            statement.setString(2, Product.getCategory());
            statement.setString(3, Product.getBeskrivelse());

            statement.executeUpdate();
        }

        private void writeCreateProductForm(PrintWriter out, String errorMessage) {
            HtmlGreier.writeHtmlStart(out, "Registrer produkt");
            if(errorMessage!=null)
            {
                out.println("<h3>"+errorMessage+"</h3>");
            }
            out.println("<form action='register_product' method='POST'>");
            out.println("<label for='productName'>Produkt navn</label>");
            out.println("<input type='text' name='productName'/>");
            out.println("<br>");
            out.println("<label for='category'>Kategori</label>");
            out.println("<input type='text' name='category'/>");
            out.println("<br>");
            out.println("<label for='beskrivelse'>Produkt beskrivelse</label>");
            out.println("<input type='text' name='beskrivelse'/>");
            out.println("<input type='submit' value='Registrer produkt'/>");
            out.println("</form>");
            HtmlGreier.writeHtmlEnd(out);
        }

        private Boolean validateProduct(RegisterProductModel model){
            if(model.getproductName()==null)
                return false;
            if(model.getproductName().trim().equalsIgnoreCase(""))
                return false;
            if(model.getCategory()==null)
                return false;
            if(model.getCategory().trim().equalsIgnoreCase(""))
                return false;
            if(model.getBeskrivelse()==null)
                return false;
            if(model.getBeskrivelse().trim().equalsIgnoreCase(""))
                return false;

            return true;
        }
    }

