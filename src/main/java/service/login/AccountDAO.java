package service.login;

import model.Account;
import model.Product;
import service.connection.BasicConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

public class AccountDAO implements IAccountDAO{
    BasicConnection basicConnection = new BasicConnection();
    @Override
    public void add(Account account) {
        try (Connection connection = basicConnection.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement("insert into account(firstName,lastName,email,phone,password,retypePassword,isSell,isAdmin) values (?, ?, ?,?,?,?,0,0)")){
            preparedStatement.setString(1,account.getFirstName());
            preparedStatement.setString(2,account.getLastName());
            preparedStatement.setString(3,account.getEmail());
            preparedStatement.setInt(4,account.getPhone());
            preparedStatement.setString(5,account.getPassword());
            preparedStatement.setString(6,account.getRetypePassword());

            System.out.println(preparedStatement);
            preparedStatement.executeUpdate();
        }
        catch (SQLException e) {

        }
    }

    @Override
    public Account findById(int id) {
        return null;
    }

    @Override
    public List<Account> findAll() {
        return null;
    }

    @Override
    public boolean delete(int id) {
        return false;
    }

    @Override
    public boolean update(Account account) {
        return false;
    }

    @Override
    public Account login(String email, String pass) {
        Account account = null;
        try(Connection connection = basicConnection.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement("select * from account where email = ? and password = ?");) {
            preparedStatement.setString(1,email);
            preparedStatement.setString(2,pass);
            System.out.println(preparedStatement);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()){
                int id = rs.getInt("id");
                String firstName = rs.getString("firstName");
                String lastName = rs.getString("lastName");
                int phone = rs.getInt("phone");
                String retypePassword = rs.getString("retypePassword");
                int isSell = rs.getInt("isSell");
                int isAdmin = rs.getInt("isAdmin");

                account = new Account(id,firstName,lastName,email,phone,pass,retypePassword,isSell,isAdmin);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } return account;
    }

    @Override
    public Account checkAccountExist(String email) {
        Account account = null;
        try(Connection connection = basicConnection.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement("select * from account where email = ?");) {
            preparedStatement.setString(1,email);
            System.out.println(preparedStatement);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()){
                int id = rs.getInt("id");
                String firstName = rs.getString("firstName");
                String lastName = rs.getString("lastName");
                int phone = rs.getInt("phone");
                String password = rs.getString("password");
                String retypePassword = rs.getString("retypePassword");
                int isSell = rs.getInt("isSell");
                int isAdmin = rs.getInt("isAdmin");

                account = new Account(id,firstName,lastName,email,phone,password,retypePassword,isSell,isAdmin);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } return account;
    }
}
