package model;

public class Product {
    private int id;
    private String name;
    private String image;
    private int price;
    private String title;
    private String discription;
    private int cateID;

    public Product() {
    }

    public Product(int id, String name, String image, int price, String title, String discription, int cateID) {
        this.id = id;
        this.name = name;
        this.image = image;
        this.price = price;
        this.title = title;
        this.discription = discription;
        this.cateID = cateID;
    }

    public Product(String name, String image, int price, String title, String discription, int cateID) {
        this.name = name;
        this.image = image;
        this.price = price;
        this.title = title;
        this.discription = discription;
        this.cateID = cateID;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getDiscription() {
        return discription;
    }

    public void setDiscription(String discription) {
        this.discription = discription;
    }

    public int getCateID() {
        return cateID;
    }

    public void setCateID(int cateID) {
        this.cateID = cateID;
    }

    @Override
    public String toString() {
        return "Product{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", image='" + image + '\'' +
                ", price=" + price +
                ", title='" + title + '\'' +
                ", discription='" + discription + '\'' +
                ", cateID=" + cateID +
                '}';
    }
}
