package controller;

import model.Account;
import model.Category;
import model.Product;
import service.category.CategoryDAO;
import service.category.ICategoryDAO;
import service.login.AccountDAO;
import service.login.IAccountDAO;
import service.product.IProductDAO;
import service.product.ProductDAO;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.InvalidPropertiesFormatException;
import java.util.List;

@WebServlet(name = "LoginServlet", value = "/login")
public class LoginServlet extends HttpServlet {
    IAccountDAO accountDAO = new AccountDAO();
    IProductDAO productDAO = new ProductDAO();
    ICategoryDAO categoryDAO = new CategoryDAO();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            default:
                showFormLogin(request,response);

        }
    }

    private void showFormLogin(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("product/login.jsp").forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "login":
                login(request,response);
                break;
        }
    }

    private void login(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String pass = request.getParameter("pass");
        String indexPage = request.getParameter("index");
        if (indexPage==null){
            indexPage = "1";

        }
        int index = Integer.parseInt(indexPage);
        int count = productDAO.getTotalProduct();
        int endPage = count/3;
        if (count%3!=0){
            endPage++;
        }
        List<Product> productList = productDAO.paginProduct(index);
        request.setAttribute("listA",productList);

        Account account = accountDAO.login(email,pass);
        if (account==null){
            request.setAttribute("mess","Email hoặc mật khẩu bị sai!!!");
            request.getRequestDispatcher("product/login.jsp").forward(request,response);
        } else {
            HttpSession session = request.getSession();
            session.setAttribute("acc",account);
            session.setMaxInactiveInterval(100000);


            List<Category> categories = categoryDAO.findAll();
            List<Product> products = productDAO.findAll();
            request.setAttribute("endP",endPage);
//        List<Category> categories = findAllCatagory(products);
            request.setAttribute("product",products);
            request.setAttribute("category",categories);
            request.getRequestDispatcher("index.jsp").forward(request,response);
        }
    }
}
