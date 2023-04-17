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

@WebServlet( value = "/index")
public class IndexServlet extends HttpServlet {

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ArrayList<Items> items = DBManager.getItems();
        PrintWriter out = response.getWriter();

        out.println("<h1></h1>");

        for(Items it : items){
            out.println("<h3>" + it.getId() + " " +it.getName() + " " + it.getPrice() + " " + it.getAmount() + "</h3>");
        }
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {




    }




}