package controller;

import model.Category;
import model.Product;
import service.category.CategoryDAO;
import service.category.ICategoryDAO;
import service.product.IProductDAO;
import service.product.ProductDAO;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "MenuServlet", value = "/menu")
public class MenuServlet extends HttpServlet {
    IProductDAO productDAO = new ProductDAO();
    ICategoryDAO categoryDAO = new CategoryDAO();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        String indexPage = request.getParameter("index");
        if (indexPage==null){
            indexPage = "1";

        }
        int index = Integer.parseInt(indexPage);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("index.jsp");
        List<Product> products;
        if (name != null && name != ""){
            products = productDAO.findByName("%"+name+"%");//không vào đây
        } else {
            products = productDAO.findAll();
        }

        int count = productDAO.getTotalProduct();
        int endPage = count/9;
        if (count%9!=0){
            endPage++;
        }
        List<Product> productList = productDAO.paginProduct(index);
        request.setAttribute("listA",productList);

        List<Category> categories = categoryDAO.findAll();
        request.setAttribute("endP",endPage);
        request.setAttribute("product",products);
        request.setAttribute("name",name);

        request.setAttribute("category",categories);
        requestDispatcher.forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

    }
}
