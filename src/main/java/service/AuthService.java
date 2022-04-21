package service;

import model.Todo;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

public class AuthService {

    public void authentication(HttpServletRequest request, HttpServletResponse response)
            throws IOException, ServletException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        if (username.equals("marshall") && password.equals("secret")) {
            request.getSession().setAttribute("username", username);
            response.sendRedirect("/welcome.do");
        }else {
            request.setAttribute("errorMessage", "Invalid Credentials");
            request.setAttribute("message", "Your credentials are incorrect. Try again");
            request.getRequestDispatcher("/WEB-INF/views/login.jsp")
                    .forward(request, response);
        }
    }

}
