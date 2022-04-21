package servlets;

import service.ServletService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(urlPatterns = "/markasdone.do")
public class ChangeStatusServlet extends HttpServlet {

    ServletService service = new ServletService();
    @Override
    protected void doGet(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse) throws ServletException, IOException {
        service.markAsDone(httpServletRequest, httpServletResponse);
    }
}
