package kontroller.servlets;

import DAO.TilgjengligeVerktoyDAO;
import DAO.VerktoyDAO;
import modell.loggInn.Verktoy;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

@WebServlet("/ListTilgjengligeVerktoy")
public class ListTilgjengligeVerktoy extends HttpServlet{

    public void doGet(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
        ArrayList<Verktoy> verktoy = null;
        try {
            verktoy = TilgjengligeVerktoyDAO.getAllVerktoyTilgjenglige();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        req.setAttribute("hentVerktoy", verktoy);

        req.getRequestDispatcher("tilgjengligeVerktoy.jsp").forward(req,res);
    }
}
