<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%-- Import your custom Java classes from the new package --%>
<%@ page import="model.ServiceHistoryList, model.ServiceRecord, model.Node" %>
<%@ include file="navbar.jsp" %>

<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard - SwiftDrive Services</title>
    <!-- Tailwind CSS + subtle shadow/ring enhancements -->
    <script src="https://cdn.tailwindcss.com"></script>
    <!-- Font Awesome 6 (free) for the delete icon -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <!-- Optional extra custom smoothness -->
    <style>
        body { background: #f9fafc; }
        .card-hover { transition: all 0.2s ease; }
        .table-row-hover:hover { background-color: #f8fafc; }
    </style>
</head>
<body class="bg-gradient-to-br from-slate-50 to-gray-100 antialiased">

    <div class="container mx-auto px-4 py-10 max-w-7xl">
        <!-- main card with softer depth -->
        <div class="bg-white/90 backdrop-blur-sm shadow-2xl shadow-indigo-100/50 rounded-2xl border border-white/30 p-8">
            
            <!-- header area with icon and gradient text -->
            <div class="flex items-center gap-3 border-b border-gray-200/70 pb-5 mb-6">
                <div class="p-3 bg-indigo-50 rounded-xl shadow-sm">
                    <svg xmlns="http://www.w3.org/2000/svg" class="h-7 w-7 text-indigo-600" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
                        <path stroke-linecap="round" stroke-linejoin="round" d="M9 5H7a2 2 0 00-2 2v12a2 2 0 002 2h10a2 2 0 002-2V7a2 2 0 00-2-2h-2M9 5a2 2 0 002 2h2a2 2 0 002-2M9 5a2 2 0 012-2h2a2 2 0 012 2" />
                    </svg>
                </div>
                <div>
                    <h2 class="text-3xl font-light tracking-tight text-gray-800">Service <span class="font-semibold bg-gradient-to-r from-indigo-800 to-blue-700 bg-clip-text text-transparent">History</span></h2>
                    <p class="text-gray-500 text-sm mt-0.5 flex items-center gap-1">
                        <i class="fa-regular fa-calendar-check text-indigo-400"></i>
                        Welcome back! Sorted by date (selection sort)
                    </p>
                </div>
            </div>

            <!-- elegant table with rounded corners and cleaner headers -->
            <div class="overflow-hidden rounded-xl border border-gray-200/70 bg-white shadow-sm">
                <table class="min-w-full divide-y divide-gray-200">
                    <thead class="bg-gradient-to-r from-indigo-700 to-indigo-800 text-white">
                        <tr>
                            <th class="px-5 py-3.5 text-left text-sm font-semibold uppercase tracking-wider"><i class="fa-regular fa-calendar mr-2 opacity-80"></i>Date</th>
                            <th class="px-5 py-3.5 text-left text-sm font-semibold uppercase tracking-wider"><i class="fa-regular fa-clipboard mr-2 opacity-80"></i>Service Type</th>
                            <th class="px-5 py-3.5 text-left text-sm font-semibold uppercase tracking-wider"><i class="fa-regular fa-credit-card mr-2 opacity-80"></i>Cost (LKR)</th>
                            <th class="px-5 py-3.5 text-left text-sm font-semibold uppercase tracking-wider"><i class="fa-regular fa-trash-can mr-2 opacity-80"></i>Action</th>
                        </tr>
                    </thead>
                    <tbody class="divide-y divide-gray-100 bg-white">
                        <%
                            // 1. Ask the server's memory (Session) for the Linked List
                            ServiceHistoryList list = (ServiceHistoryList) session.getAttribute("serviceList");

                            // 2. If memory is empty, create a new list and add some starter data
                            if (list == null) {
                                list = new ServiceHistoryList();
                                list.addRecord(new ServiceRecord("2026-05-20", "Tire Rotation", 80.0));
                                list.addRecord(new ServiceRecord("2026-01-15", "Oil Change", 60.0));
                                list.addRecord(new ServiceRecord("2026-03-10", "Brake Repair", 150.0));

                                // Save this starter list into memory so it doesn't get overwritten!
                                session.setAttribute("serviceList", list);
                            }

                            // 3. Run your Selection Sort
                            list.sortHistoryByDate();

                            // 4. Loop through the Nodes to build the table rows
                            Node current = list.head;
                            while (current != null) {
                        %>
                            <tr class="table-row-hover transition-colors duration-150">
                                <td class="px-5 py-3.5 whitespace-nowrap text-sm text-gray-700 font-medium">
                                    <%= current.data.getDate() %>
                                </td>
                                <td class="px-5 py-3.5 whitespace-nowrap text-sm text-gray-700">
                                    <span class="px-2.5 py-1 bg-indigo-50 text-indigo-800 rounded-full text-xs font-medium mr-2"><%= current.data.getServiceType() %></span>
                                </td>
                                <td class="px-5 py-3.5 whitespace-nowrap text-sm text-gray-700 font-mono">
                                    <span class="bg-gray-100 px-2 py-0.5 rounded-md">LKR <%= String.format("%.2f", current.data.getCost()) %></span>
                                </td>
                                <td class="px-5 py-3.5 whitespace-nowrap text-sm">
                                    <a href="DeleteServiceServlet?date=<%= current.data.getDate() %>&type=<%= current.data.getServiceType() %>" 
                                       class="inline-flex items-center gap-2 bg-white border border-red-200 text-red-600 hover:bg-red-50 hover:border-red-300 hover:text-red-700 px-4 py-1.5 rounded-lg transition-all duration-200 shadow-sm hover:shadow-md active:scale-95">
                                        <i class="fa-regular fa-trash-can"></i>
                                        <span class="text-xs font-medium">Delete</span>
                                    </a>
                                </td>
                            </tr>
                        <%
                                current = current.next; // Move to the next link in the chain
                            } // <-- This curly bracket is now perfectly fine and balanced
                        %>
                    </tbody>
                </table>
            </div>

            <!-- add button with icon + nice hover effect -->
            <div class="mt-8 flex items-center justify-between">
                <a href="addService.jsp" 
                   class="group inline-flex items-center gap-3 bg-gradient-to-r from-emerald-600 to-teal-600 text-white px-6 py-3 rounded-xl shadow-md shadow-emerald-200 hover:shadow-xl hover:shadow-emerald-300 hover:-translate-y-0.5 transition-all duration-200 font-medium">
                    Add New Service Record
                </a>
            </div>
        </div>
    </div>

</body>
</html>