package servlets;

import java.io.PrintWriter;
import java.io.Writer;

import javax.servlet.http.HttpServletRequest;

import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;

class GetUserServletTest {
    private final GetUserServlet getUserServletUnderTest = new GetUserServlet();

    @Test
    public void getKdratioTest() {
                //arrange
              float kills = 100.00F;
              float deaths = 10.00F;
              float expected = 10.00F;
              //act
            double result = getUserServletUnderTest.getKDratio(kills,deaths);
        Assertions.assertEquals(expected,result);
    }
}