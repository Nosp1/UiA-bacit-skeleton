package kontroller.servlets;

import DAO.VerktoyDAO;
import modell.loggInn.Verktoy;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet("/VelgVerktoy")
public class VelgVerktoyServlet extends HttpServlet {

    public void doGet(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
        int ID = Integer.parseInt(req.getParameter("id"));
        System.out.println(ID);
        ArrayList<Verktoy> verktoy = VerktoyDAO.getAllVerktoyTypeID(ID);
        req.setAttribute("hentVerktoy", verktoy);

        req.getRequestDispatcher("booking.jsp").forward(req,res);
    }
}





