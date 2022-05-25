package service.product;

import model.Product;
import service.product.IProductDAO;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ProductDAO implements IProductDAO {
    protected Connection getConnection() {
        Connection connection = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection(  "jdbc:mysql://localhost:3306/product_case1?useSSL=false", "root", "123456");
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        return connection;
    }

    @Override
    public void add(Product product) {
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement("insert into product(name,price,image,title,discription,cateID) values (?, ?, ?,?,?,?)")){
            preparedStatement.setString(1,product.getName());
            preparedStatement.setInt(2,product.getPrice());
            preparedStatement.setString(3,product.getImage());
            preparedStatement.setString(4,product.getTitle());
            preparedStatement.setString(5,product.getDiscription());
            preparedStatement.setInt(6,product.getCateID());

            System.out.println(preparedStatement);
            preparedStatement.executeUpdate();
        }
        catch (SQLException e) {

        }
    }

    @Override
    public Product findById(int id) {
        Product product = null;
        try(Connection connection = getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement("select * from product where id = ?");) {
            preparedStatement.setInt(1,id);
            System.out.println(preparedStatement);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()){
                String name = rs.getString("name");
                String image = rs.getString("image");
                int price = rs.getInt("price");
                String title = rs.getString("title");
                String discription = rs.getString("discription");
                int cateID = rs.getInt("cateID");

                product = new Product(id,name,image,price,title,discription,cateID);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } return product;
    }

    @Override
    public List<Product> findAll() {
        List<Product> products = new ArrayList<>();
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement("select * from product");) {
            System.out.println(preparedStatement);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                String name = rs.getString("name");
                String image = rs.getString("image");
                int price = rs.getInt("price");
                String title = rs.getString("title");
                String discription = rs.getString("discription");
                int cateID = rs.getInt("cateID");
                products.add(new Product(id,name,image,price,title,discription,cateID));

            }
        } catch (SQLException e) {

        }
        return products;
    }

    @Override
    public boolean delete(int id) {
        boolean rowDeleted = false;
        try (Connection connection = getConnection();
             PreparedStatement statement = connection.prepareStatement("delete from product where id = ?;");) {
            statement.setInt(1, id);
            rowDeleted = statement.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return rowDeleted;
    }

    @Override
    public boolean update(Product product) {
        boolean rowUpdated = false;
        try (Connection connection = getConnection();
             PreparedStatement statement = connection.prepareStatement("update product set name = ?,image= ?, price =?,title = ?, discription=?,cateID=? where id = ?;");) {
            statement.setString(1, product.getName());
            statement.setString(2, product.getImage());
            statement.setInt(3, product.getPrice());
            statement.setString(4, product.getTitle());
            statement.setString(5, product.getDiscription());
            statement.setInt(6, product.getCateID());
            statement.setInt(7, product.getId());

            rowUpdated = statement.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return rowUpdated;
    }

    @Override
    public List<Product> findByName(String nameS) {
        List<Product> products = new ArrayList<>();
        try(Connection connection = getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement("select * from product where name like ?");) {
            preparedStatement.setString(1,"%"+nameS+"%");
            System.out.println(preparedStatement);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()){
                int id = Integer.parseInt(rs.getString("id"));
                String name = rs.getString("name");
                String image = rs.getString("image");
                int price = rs.getInt("price");
                String title = rs.getString("title");
                String discription = rs.getString("discription");
                int cateID = rs.getInt("cateID");
                products.add(new Product(id,name,image,price,title,discription,cateID)) ;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } return products;
    }

    @Override
    public List<Product> sortPriceASC() {
        List<Product> products = new ArrayList<>();
        try (Connection connection = getConnection(); PreparedStatement preparedStatement = connection.prepareStatement("select id,name,image,price,title,discription,cateID from product order by price asc");) {
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                String name = rs.getString("name");
                String image = rs.getString("image");
                int price = Integer.parseInt(rs.getString("price"));
                String title = rs.getString("title");
                String discription = rs.getString("discription");
                int cateID = rs.getInt("cateID");
                products.add(new Product(id, name, image, price,title,discription,cateID));
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return products;
    }

    @Override
    public List<Product> sortPriceDESC() {
        List<Product> products = new ArrayList<>();
        try (Connection connection = getConnection(); PreparedStatement preparedStatement = connection.prepareStatement("select id,name,image,price,title,discription,cateID from product order by price desc ");) {
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                String name = rs.getString("name");
                String image = rs.getString("image");
                int price = Integer.parseInt(rs.getString("price"));
                String title = rs.getString("title");
                String discription = rs.getString("discription");
                int cateID = rs.getInt("cateID");
                products.add(new Product(id, name, image, price,title,discription,cateID));
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return products;
    }

    @Override
    public int getTotalProduct() {
        try (Connection connection = getConnection(); PreparedStatement preparedStatement = connection.prepareStatement("select count(*) from product");) {
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return 0;
    }

    @Override
    public List<Product> paginProduct(int index) {
        List<Product> products = new ArrayList<>();
        try (Connection connection = getConnection(); PreparedStatement preparedStatement = connection.prepareStatement("SELECT * FROM product LIMIT ?, 9");) {
            preparedStatement.setInt(1,(index-1)*3);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                int id = Integer.parseInt(rs.getString("id"));
                String name = rs.getString("name");
                String image = rs.getString("image");
                int price = rs.getInt("price");
                String title = rs.getString("title");
                String discription = rs.getString("discription");
                int cateID = rs.getInt("cateID");
                products.add(new Product(id,name,image,price,title,discription,cateID)) ;
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return products;
    }
}
