package controller;

import model.Category;
import model.Product;
import service.category.CategoryDAO;
import service.category.ICategoryDAO;
import service.product.IProductDAO;
import service.product.ProductDAO;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "ProductServlet", value = "/products")
public class ProductServlet extends HttpServlet {
    IProductDAO productDAO = new ProductDAO();
    ICategoryDAO categoryDAO = new CategoryDAO();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("utf-8");

        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "view":
                showDetail(request, response);
                break;
            case "create":
                showCreateProduct(request, response);
                break;
            case "delete":
                deleteProduct(request,response);
                break;
            case "edit":
                showEditProduct(request,response);
                break;
            default:
                showList(request, response);
        }
    }

    private void showEditProduct(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Product product = productDAO.findById(id);
        List<Category> categories = categoryDAO.findAll();
        List<Product> products = productDAO.findAll();
        request.setAttribute("product",products);
        request.setAttribute("category",categories);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("product/edit.jsp");
        request.setAttribute("productedit",product);
        requestDispatcher.forward(request,response);


    }

    private void deleteProduct(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        productDAO.delete(id);
        List<Product> products = productDAO.findAll();
        request.setAttribute("product", products);
        RequestDispatcher dispatcher = request.getRequestDispatcher("product/product.jsp");
        dispatcher.forward(request, response);
    }

    private void showCreateProduct(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        List<Category> categories = categoryDAO.findAll();
        List<Product> products = productDAO.findAll();
        request.setAttribute("product",products);
        request.setAttribute("category",categories);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("product/create.jsp");
        requestDispatcher.forward(request,response);
    }

    private void showDetail(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("product/detail.jsp");
        int id = Integer.parseInt(request.getParameter("id"));
        Product product = productDAO.findById(id);
        List<Product> products = productDAO.findAll();
        List<Category> categories = categoryDAO.findAll();
        request.setAttribute("productdetail",product);
        request.setAttribute("product",products);
        request.setAttribute("category",categories);
        requestDispatcher.forward(request,response);

    }

    private void showList(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        String indexPage = request.getParameter("index");
        if (indexPage==null){
            indexPage = "1";

        }
        int index = Integer.parseInt(indexPage);

        RequestDispatcher requestDispatcher = request.getRequestDispatcher("product/product.jsp");
        List<Product> products;
        if (name != null && name != ""){
            products = productDAO.findByName("%"+name+"%");//không vào đây
        } else {
            products = productDAO.findAll();
        }
        List<Category> categories = categoryDAO.findAll();
        int count = productDAO.getTotalProduct();
        int endPage = count/3;
        if (count%3!=0){
            endPage++;
        }
        List<Product> productList = productDAO.paginProduct(index);
        request.setAttribute("listA",productList);
        request.setAttribute("product",products);
        request.setAttribute("name",name);
        request.setAttribute("endP",endPage);
        request.setAttribute("category",categories);
        requestDispatcher.forward(request,response);
    }

    List<Category> findAllCatagory(List<Product> products){
        List<Category> list = new ArrayList<>();
        for (int i = 0; i < products.size(); i++) {
            Category catagory = categoryDAO.findById(products.get(i).getCateID());
            list.add(catagory);
        } return list;
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("utf-8");

        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                createProduct(request, response);
                break;
            case "edit":
                editProduct(request,response);
                break;
            case "orderby":
                sortPrice(request, response);
                break;
        }
    }

    private void sortPrice(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String key = request.getParameter("select");
        List<Product> products = null;
        if (key.equals("asc")){
            products = productDAO.sortPriceASC();
        } else if (key.equals("desc")){
            products = productDAO.sortPriceDESC();
        }
        request.setAttribute("product",products);
        List<Category> categories = categoryDAO.findAll();
        request.setAttribute("category",categories);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("product/product.jsp");
        requestDispatcher.forward(request,response);
    }

    private void editProduct(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String image = request.getParameter("image");
        int price = Integer.parseInt(request.getParameter("price"));
        String title = request.getParameter("title");
        String discription = request.getParameter("discription");
        int cateID = Integer.parseInt(request.getParameter("cateID"));

        Product book = new Product(id,name, image, price, title,discription,cateID);
//        userDAO.updateUser(book);
        productDAO.update(book);
        List<Category> categories = categoryDAO.findAll();
        List<Product> products = productDAO.findAll();
        request.setAttribute("product",products);

        request.setAttribute("category",categories);
        RequestDispatcher dispatcher = request.getRequestDispatcher("product/edit.jsp");
        dispatcher.forward(request, response);
    }

    private void createProduct(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("utf-8");

        String name = request.getParameter("name");
        String image = request.getParameter("image");
        int price = Integer.parseInt(request.getParameter("price"));
        String title = request.getParameter("title");
        String discription = request.getParameter("discription");
        int cateID = Integer.parseInt(request.getParameter("cateID"));
        productDAO.add(new Product(name,image,price,title,discription,cateID));
        RequestDispatcher dispatcher = request.getRequestDispatcher("product/create.jsp");
        dispatcher.forward(request, response);
    }
}
