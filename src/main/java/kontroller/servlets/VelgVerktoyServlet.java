package kontroller.servlets;

import DAO.VerktoyDAO;
import modell.loggInn.Verktoy;

import javax.servlet.RequestDispatcher;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet("/VelgVerktoy")
public class VelgVerktoyServlet extends HttpServlet {
    public void doPost(HttpServletRequest req, HttpServletResponse res) throws IOException{
        int ID = Integer.parseInt(req.getParameter("submit"));

        ArrayList<Verktoy> verktoy = VerktoyDAO.getAllVerktoyTypeID(ID);
    }



