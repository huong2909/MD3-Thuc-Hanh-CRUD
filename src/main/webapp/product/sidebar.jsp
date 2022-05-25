<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div class="col-lg-4 sidebar">
    <div class="sidebar-widget category">
        <h2 class="title">Danh mục</h2>
        <nav class="navbar bg-light">
            <ul class="navbar-nav">
                <%--                            ${tag == category.id ? "active":""}--%>
                <c:forEach var="category" items="${category}">
                    <li class="nav-item"}>
                        <a class="nav-link " href="/categorys?id=${category.id}"><i class="fa fa-female"></i>${category.name}</a>
                    </li>
                </c:forEach>

            </ul>
        </nav>
    </div>


    <div class="sidebar-widget widget-slider">

        <div class="sidebar-slider normal-slider">
            <c:forEach var="product" items="${product}">
                <div class="product-item">
                    <div class="product-title">
                        <a href="#">${product.name}</a>
                        <div class="ratting">
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                        </div>
                    </div>
                    <div class="product-image">
                        <a href="product-detail.html">
                            <img src="${product.image}"  alt="Product Image">
                        </a>
                        <div class="product-action">
                            <a href="#"><i class="fa fa-cart-plus"></i></a>
                            <a href="#"><i class="fa fa-heart"></i></a>
                            <a href="#"><i class="fa fa-search"></i></a>
                        </div>
                    </div>
                    <div class="product-price">
                        <h3>${product.price}<span>VND</span></h3>
                        <a class="btn" href=""><i class="fa fa-shopping-cart"></i>Buy Now</a>
                    </div>
                </div>
            </c:forEach>

        </div>
    </div>

    <div class="sidebar-widget brands">
        <h2 class="title">Thương hiệu</h2>
        <ul>
            <li><a href="#">Nulla </a><span>(45)</span></li>
            <li><a href="#">Curabitur </a><span>(34)</span></li>
            <li><a href="#">Nunc </a><span>(67)</span></li>
            <li><a href="#">Ullamcorper</a><span>(74)</span></li>
            <li><a href="#">Fusce </a><span>(89)</span></li>
            <li><a href="#">Sagittis</a><span>(28)</span></li>
        </ul>
    </div>

    <div class="sidebar-widget tag">
        <h2 class="title">Tags Cloud</h2>
        <a href="#">Lorem ipsum</a>
        <a href="#">Vivamus</a>
        <a href="#">Phasellus</a>
        <a href="#">pulvinar</a>
        <a href="#">Curabitur</a>
        <a href="#">Fusce</a>
        <a href="#">Sem quis</a>
        <a href="#">Mollis metus</a>
        <a href="#">Sit amet</a>
        <a href="#">Vel posuere</a>
        <a href="#">orci luctus</a>
        <a href="#">Nam lorem</a>
    </div>
</div>
<!-- Side Bar End -->