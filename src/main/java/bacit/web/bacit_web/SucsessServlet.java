package bacit.web.bacit_web;

import bacit.web.bacit_models.HtmlGreier;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "SucsessServlet", value = "/rent_product")
public class SucsessServlet extends HttpServlet {

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.setContentType("text/html");

        PrintWriter out = response.getWriter();
        writeSucsessForm(out,null);
    }

    private void writeSucsessForm(PrintWriter out, String errorMessage) {
        HtmlGreier.writeHtmlStart(out, "Produktet er reservert!");
        if(errorMessage!=null)
        {
            out.println("<h3>"+errorMessage+"</h3>");
        }
        out.println("</form>");
        HtmlGreier.writeHtmlEnd(out);
    }
}
