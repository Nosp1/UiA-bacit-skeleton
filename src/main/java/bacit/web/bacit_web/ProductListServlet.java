package bacit.web.bacit_web;
import bacit.web.bacit_models.ProductListModel;

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

@WebServlet(name = "productListServlet", value = "/product_list")
public class ProductListServlet extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.setContentType("text/html");
        ProductListModel produkt = new ProductListModel();

        // Hello
        PrintWriter out = response.getWriter();
        writeHtmlStart(out, "Product liste");
        while (rs.next()) {
        //Print one row
            for(int i = 1 ; i <= 29; i++) {
                out.println("<section id=\"boxes\">\n" +
                        "    <div class=\"container\">\n" +
                        "        <article id=\"main-col\">\n" +
                        "            <ul id=\"Produkt\">\n" +
                        "                <li>\n" +
                        "                    <h3>" + produkt.getProductName() + "</h3>\n" +
                        "                    <p>Enkelt forklart er iskaffe akkurat det samme som varm kaffe den eneste store forskjellen er at den er servert kald. Det er den perfekte drikken til en varm dag, dersom du ønsker å holde deg våken mens du soler deg. Dersom du spør etter en \"Iced coffee\" vil du få kaffe blandet med melk, istedenfor vann, noe som vil dempe kaffesmaken.</p>\n" +
                        "                </li>\n" +
                        "            </ul>\n" +
                        "        </article>\n" +
                        "    </div>\n" +
                        "</section>");
                writeHtmlEnd(out);
            }
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }
    private void writeHtmlStart(PrintWriter out, String title) {
        out.println("<html><head>\n" +
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
                "                <li class=\"current\"><a href=\"http://localhost:8081/bacit-web-1.0-SNAPSHOT/product_list\">Startside</a></li>\n" +
                "                <li><a href=\"http://localhost:8081/bacit-web-1.0-SNAPSHOT/register_user\">Cheerios</a></li>\n" +
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
    }
