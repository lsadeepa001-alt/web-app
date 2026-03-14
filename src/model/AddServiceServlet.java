package model;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet("/AddServiceServlet")
public class AddServiceServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 1. Catch the data typed into the form
        String date = request.getParameter("date");
        String serviceType = request.getParameter("serviceType");
        double cost = Double.parseDouble(request.getParameter("cost"));

        // 2. Box that data up into a new ServiceRecord
        ServiceRecord newRecord = new ServiceRecord(date, serviceType, cost);

        // 3. Open the "Session" (The server's memory for this specific user)
        HttpSession session = request.getSession();

        // Try to find the existing Linked List in the memory
        ServiceHistoryList list = (ServiceHistoryList) session.getAttribute("serviceList");

        // If the list doesn't exist yet, create a brand new one!
        if (list == null) {
            list = new ServiceHistoryList();
        }

        // 4. Attach the new record to the Train (Linked List)
        list.addRecord(newRecord);

        // 5. Save the updated Train back into the server's memory
        session.setAttribute("serviceList", list);

        // 6. Send the user back to the dashboard to see their updated table
        response.sendRedirect("dashboard.jsp");
    }
}