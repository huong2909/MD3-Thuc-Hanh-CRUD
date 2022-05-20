package service.product;

import model.Product;
import service.IGeneric;

import java.util.List;

public interface IProductDAO extends IGeneric<Product> {
    List<Product> findByName(String name);

    public List<Product> sortPriceASC();

    public List<Product> sortPriceDESC();
}
