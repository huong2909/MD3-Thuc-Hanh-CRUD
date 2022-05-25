package controller;

import model.Account;
import model.Category;
import model.Product;
import service.category.CategoryDAO;
import service.login.AccountDAO;
import service.login.IAccountDAO;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "RegisterServlet", value = "/register")
public class RegisterServlet extends HttpServlet {
    IAccountDAO accountDAO = new AccountDAO();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            default:
                showFormRegister(request,response);

        }
    }

    private void showFormRegister(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("product/register.jsp").forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "register":
                register(request,response);
                break;
        }
    }

    private void register(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String email = request.getParameter("email");
        int phone = Integer.parseInt(request.getParameter("phone"));
        String password = request.getParameter("password");
        String retypePassword = request.getParameter("rePassword");
        if (!password.equals(retypePassword)){
            request.setAttribute("mess","Mật khẩu không trùng nhau!!!");
            request.getRequestDispatcher("product/register.jsp").forward(request,response);
        } else {
            Account account = accountDAO.checkAccountExist(email);
            if (account==null){
                Account account1 = new Account(firstName,lastName,email,phone,password,retypePassword);
                accountDAO.add(account1);
                request.getRequestDispatcher("product/login.jsp").forward(request,response);
            } else {
                request.setAttribute("mess2","Tài khoản đã tồn tại!!!");
                response.sendRedirect("product/register.jsp");
            }
        }



        request.getRequestDispatcher("product/login.jsp");
    }
}
