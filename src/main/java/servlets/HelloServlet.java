package servlets;

import html.Html;
import java.io.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;

@WebServlet(name = "helloServlet", value = "/hello-servlet")
public class HelloServlet extends HttpServlet {

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.setContentType("text/html");

        // Hello
        PrintWriter out = response.getWriter();
        Html.Start(out, "Hello World! Servlet");
        out.println("<h2>Search for a player's name in the database :-)</h2>");
        out.println("<form action='GetUserServlet' method='GET'>");
        out.println("  <label for='uname'>Nickname:</label>");
        out.println("  <input type='text' name='uname'/>");
        out.println("  <input type='submit' />");
        out.println("</form>");
        out.println("<p>This query finds a player in your private Battlefield 2 statistics database and lists up some of the player's stats (I have not included every player column in the model.)</p>");
        Html.MiniTutorial(out);
        Html.EndBasic(out);
    }

    public void destroy() {
    }
}