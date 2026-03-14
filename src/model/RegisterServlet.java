package model;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;

// This "Address" must match the 'action' in your register.jsp!
@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        // 1. Grab the data from the website boxes
        String user = request.getParameter("username");
        String pass = request.getParameter("password");

        // 2. Use your existing model.UserManager logic!
        UserManager manager = new UserManager();
        User newUser = new User(user, pass);
        manager.registerUser(newUser);

        // 3. Send the user back to the login page
        response.sendRedirect("login.jsp");
    }
}