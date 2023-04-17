package com.example.studentsinfo.servlets;

import com.example.studentsinfo.db.DBManager;
import com.example.studentsinfo.db.Items;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet(value = "/delete")
public class DeleteServlet extends HttpServlet {

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {




    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Long id = Long.parseLong(request.getParameter("id"));
        Items item = DBManager.getItem(id);

        if(item!=null){

            if(DBManager.deleteItem(item)) {
                response.sendRedirect("/");
            }else{
                response.sendRedirect("/edit?id=" + id + "&error");
            }
        }else {
            response.sendRedirect("/");
        }
    }
}
