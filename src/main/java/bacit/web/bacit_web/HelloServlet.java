package bacit.web.bacit_web;

import java.io.*;

import javax.servlet.http.*;
import javax.servlet.annotation.*;

@WebServlet(name = "helloServlet", value = "/hello-servlet")
public class HelloServlet extends HttpServlet {
    private String message;

    public void init() {
        message = "Hello World!";
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.setContentType("text/html");

        // Hello
        PrintWriter out = response.getWriter();
        out.println("<html><body>");
        out.println("<h1>" + message + "</h1>");
        out.println("<h1>Get someone from the database :-)</h1>");
        out.println("<form action='GetUserServlet' method='GET'>");
        out.println("  <label for='uname'>First name:</label>");
        out.println("  <input type='text' name='uname'/>");
        out.println("  <input type='submit' />");
        out.println("</form>");
        out.println("</body></html>");
    }

    public void destroy() {
    }
}