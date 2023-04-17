package com.example.studentsinfo.servlets;

import com.example.studentsinfo.db.DBManager;
import com.example.studentsinfo.db.Items;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

@WebServlet(value = "/search")
public class SearchServlet extends HttpServlet {
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {



    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String str = request.getParameter("listtechs");
        String val = request.getParameter("sname");
        int helpInteger = 1;


        PrintWriter out = response.getWriter();

        try {
            if (!val.isEmpty()) {

                if (str.equals("nameo")) {
                    ArrayList<Items> items = DBManager.searchItemWithName(val);
                    request.setAttribute("tovary", items);
                    request.getRequestDispatcher("/home.jsp").forward(request, response);
                    for (Items it : items) {
                        out.println("<h3>" + it.getId() + " " + it.getName() + " " + it.getPrice() + " " + it.getAmount() + "</h3>");
                    }
                } else if (str.equals("ido")) {
                    ArrayList<Items> items = DBManager.searchItemWithId(Integer.parseInt(val));
                    request.setAttribute("tovary", items);
                    request.getRequestDispatcher("/home.jsp").forward(request, response);
                    for (Items it : items) {
                        out.println("<h3>" + it.getId() + " " + it.getName() + " " + it.getPrice() + " " + it.getAmount() + "</h3>");
                    }
                } else if (str.equals("priceo")) {
                    ArrayList<Items> items = DBManager.searchItemWithPrice(Integer.parseInt(val));
                    request.setAttribute("tovary", items);
                    request.getRequestDispatcher("/home.jsp").forward(request, response);
                    for (Items it : items) {
                        out.println("<h3>" + it.getId() + " " + it.getName() + " " + it.getPrice() + " " + it.getAmount() + "</h3>");
                    }
                } else if (str.equals("amounto")) {
                    ArrayList<Items> items = DBManager.searchItemWithAmount(Integer.parseInt(val));
                    request.setAttribute("tovary", items);
                    request.getRequestDispatcher("/home.jsp").forward(request, response);
                    for (Items it : items) {
                        out.println("<h3>" + it.getId() + " " + it.getName() + " " + it.getPrice() + " " + it.getAmount() + "</h3>");
                    }
                } else if (str.equals("np")) {

                    ArrayList<Items> items = DBManager.getItems();
                    request.setAttribute("tovary", items);
                    request.getRequestDispatcher("/home.jsp").forward(request, response);
                    for (Items it : items) {
                        out.println("<h3>" + it.getId() + " " + it.getName() + " " + it.getPrice() + " " + it.getAmount() + "</h3>");
                    }
                } else {
                    ArrayList<Items> items = DBManager.getItems();
                    request.setAttribute("tovary", items);
                    request.getRequestDispatcher("/home.jsp").forward(request, response);
                    for (Items it : items) {
                        out.println("<h3>" + it.getId() + " " + it.getName() + " " + it.getPrice() + " " + it.getAmount() + "</h3>");
                    }
                }
            } else if (val.isEmpty()) {
                ArrayList<Items> items = DBManager.getItems();
                request.setAttribute("tovary", items);
                request.getRequestDispatcher("/home.jsp").forward(request, response);
                for (Items it : items) {
                    out.println("<h3>" + it.getId() + " " + it.getName() + " " + it.getPrice() + " " + it.getAmount() + "</h3>");
                }
            }
        } catch (Exception e) {
            request.getRequestDispatcher("/404.jsp").forward(request,response);
        }
    }

}
