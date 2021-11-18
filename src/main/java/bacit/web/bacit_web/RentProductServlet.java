package bacit.web.bacit_web;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDate;

@WebServlet(name="RentProductServlet", value = "/rent")
public class RentProductServlet extends HttpServlet {
    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        try {
            HttpSession mySession = request.getSession(false);
            Integer Bruker_ID = null;
            if (mySession != null) {
                Bruker_ID = (Integer) mySession.getAttribute("Bruker_ID");
            }
            if (Bruker_ID == null) {
                response.sendRedirect("/bacit-web-1.0-SNAPSHOT/login");
                return;
            }
            int Produkt_ID = Integer.parseInt(request.getParameter("Produkter"));
            int Inputdager = Integer.parseInt("Dager");
            int Bruker_ID = getBrukerID(Bruker_ID);
            LocalDate datoFraWanted = LocalDate.parse(request.getParameter("Dato"));
            LocalDate datoTil = datoFraWanted.plusDays(Inputdager);

            ToolModel tool =getTool(Produkt_ID);

            int totalPris = tool.getPris
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
