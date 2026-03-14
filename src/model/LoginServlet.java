package model;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String user = request.getParameter("username");
        String pass = request.getParameter("password");

        UserManager manager = new UserManager();

        // Use your existing login logic
        if (manager.loginUser(user, pass)) {
            // SUCCESS! Send them to the Service History page
            response.sendRedirect("dashboard.jsp");
        } else {
            // FAIL! Send them back to login
            response.sendRedirect("login.jsp?error=invalid");
        }
    }
}