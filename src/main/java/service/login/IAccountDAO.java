package service.login;

import model.Account;
import service.IGeneric;

public interface IAccountDAO extends IGeneric<Account> {
    public Account login(String email, String pass);
    public Account checkAccountExist(String email);


}
