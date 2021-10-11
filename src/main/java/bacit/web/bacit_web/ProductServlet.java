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

@WebServlet(name = "Productlist", value = "/Productlist")
public class ProductServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        HtmlHelper.writeHtmlStart(out, "Produkt");
        try{
            out.println("<table>");
            out.println("<tr>");
            out.println("<th>ID</th>");
            out.println("<th>Name</th>");
            out.println("<th>Image</th>");
            out.println("</tr>");

            Products<ProductModel> products = getProducts(out);
            for(ProductModel product : products)
            {
                out.println("<tr>");
                out.println("<td>"+product.getId()+"</td>");
                out.println("<td>"+product.getName()+"</td>");
                out.println("<td><img src='"+product.getImagePath()+"' alt='"+product.getName()+"'/></td>");
                out.println("</tr>");
            }
            out.println("</table>");
        }
        catch(SQLException ex){
            out.println(ex.getMessage());
        }
        HtmlHelper.writeHtmlEnd(out);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    private Products<ProductModel> getProducts(PrintWriter out)throws SQLException {
        ArrayList<ProductModel> result =  new ArrayList<ProductModel>();

        Connection db = DBUtils.getINSTANCE().getConnection(out);
        String query3 = "select * from products";
        PreparedStatement statement = db.prepareStatement(query3);
        ResultSet rs =  statement.executeQuery();

        while (rs.next()) {
            result.add(new ProductModel(
                    rs.getInt("Id"),
                    rs.getString("Name"),
                    rs.getString("ImagePath")
            ));
        }
        return result;
    }
}
