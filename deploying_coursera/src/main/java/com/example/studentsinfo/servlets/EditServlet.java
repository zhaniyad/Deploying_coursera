package com.example.studentsinfo.servlets;

import com.example.studentsinfo.db.DBManager;
import com.example.studentsinfo.db.Items;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.ArrayList;


@WebServlet(value = "/edit")
public class EditServlet extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        Long id = 0L;
        try {
            id = Long.parseLong(request.getParameter("id"));
        }catch (Exception e){

        }
        Items item = DBManager.getItem(id);

        if(item!=null){
            request.setAttribute("item", item);
            request.getRequestDispatcher("/edit.jsp").forward(request,response);
        }else{
            request.getRequestDispatcher("/404.jsp").forward(request,response);
        }

    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Long id = Long.parseLong(request.getParameter("id"));
        String name = request.getParameter("name");
        int amount = Integer.parseInt(request.getParameter("amount"));
        int price = Integer.parseInt(request.getParameter("price"));

        Items item = DBManager.getItem(id);

        if(item!=null){
            item.setName(name);
            item.setAmount(amount);
            item.setPrice(price);

            if(DBManager.saveItem(item)) {
                response.sendRedirect("/edit?id=" + id + "&success");
            }else{
                response.sendRedirect("/edit?id=" + id + "&error");
            }
        }else {
            response.sendRedirect("/");
        }
    }
}
