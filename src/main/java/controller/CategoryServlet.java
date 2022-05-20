package controller;

import model.Category;
import model.Product;
import service.category.CategoryDAO;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "CategoryServlet", value = "/categorys")
public class CategoryServlet extends HttpServlet {
    CategoryDAO categoryDAO = new CategoryDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            default:
                showListCategory(request, response);
        }
    }

    private void showListCategory(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        List<Product> products = categoryDAO.getProductByIdCategory(id);
        List<Category> categories = categoryDAO.findAll();
        request.setAttribute("product",products);
        request.setAttribute("category",categories);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("product/product.jsp");
        requestDispatcher.forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
