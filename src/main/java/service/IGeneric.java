package service;

import java.sql.SQLException;
import java.util.List;

public interface IGeneric<T> {
    public void add(T t);

    public T findById(int id);

    public List<T> findAll();

    public boolean delete(int id);

    public boolean update(T t);
}
