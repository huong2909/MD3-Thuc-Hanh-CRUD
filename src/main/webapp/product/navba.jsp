<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 5/22/2022
  Time: 9:24 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!-- Top bar Start -->
<div class="top-bar">
    <div class="container-fluid">
        <div class="row">
            <div class="col-sm-6">
                <i class="fa fa-envelope"></i>
                Thienhuonghuong95@email.com
            </div>
            <div class="col-sm-6">
                <i class="fa fa-phone-alt"></i>
                +036-910-2758
            </div>
        </div>
    </div>
</div>
<!-- Top bar End -->

<!-- Nav Bar Start -->
<div class="nav">
    <div class="container-fluid">
        <nav class="navbar navbar-expand-md bg-dark navbar-dark">
            <a href="#" class="navbar-brand">MENU</a>
            <button type="button" class="navbar-toggler" data-toggle="collapse" data-target="#navbarCollapse">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse justify-content-between" id="navbarCollapse">
                <div class="navbar-nav mr-auto">
                    <a href="index.html" class="nav-item nav-link">Trang chủ</a>
                    <c:if test = "${sessionScope.acc.isSell == 1}">
                    <a href="/products" class="nav-item nav-link active">Quản lý sản phẩm</a>
                    </c:if>

                    <c:if test = "${sessionScope.acc.isAdmin ==1 }">
                    <a href="/products" class="nav-item nav-link active">Quản lý người dùng</a>
                    </c:if>

                    <a href="cart.html" class="nav-item nav-link">Giỏ hàng</a>

<%--                    <c:if test = "${sessionScope.acc != null}">--%>
<%--                    <a href="checkout.html" class="nav-item nav-link">Xin chào ${sessionScope.acc.firstName}</a>--%>
<%--                    </c:if>--%>
<%--                    <div class="nav-item dropdown">--%>
<%--                        <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown">Xem thêm</a>--%>
<%--                        <div class="dropdown-menu">--%>
<%--                            <a href="wishlist.html" class="dropdown-item">Danh sách</a>--%>
<%--                            <a href="login.html" class="dropdown-item">Đăng nhập và đăng kí</a>--%>
<%--                            <a href="contact.html" class="dropdown-item">Liên hệ</a>--%>
<%--                        </div>--%>
<%--                    </div>--%>
                </div>
                <div class="navbar-nav ml-auto">
                    <div class="nav-item dropdown">
                        <c:if test = "${sessionScope.acc != null}">
                            <a href="checkout.html" class="nav-link dropdown-toggle" data-toggle="dropdown">Xin chào ${sessionScope.acc.firstName}</a>
                        </c:if>
                        <c:if test = "${sessionScope.acc == null}">
                            <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown">Tài khoản</a>
                        </c:if>

                        <div class="dropdown-menu">
                            <c:if test = "${sessionScope.acc != null}">
                                <a href="/logout" class="dropdown-item">Đăng xuất</a>
                            </c:if>

                            <c:if test = "${sessionScope.acc == null}">
                            <a href="/login" class="dropdown-item">Đăng nhập</a>
                            </c:if>

                            <a href="/register" class="dropdown-item">Đăng kí</a>

                        </div>
                    </div>
                </div>
            </div>
        </nav>
    </div>
</div>
<!-- Nav Bar End -->

<!-- Bottom Bar Start -->
<div class="bottom-bar">
    <div class="container-fluid">
        <div class="row align-items-center">
            <div class="col-md-3">
                <div class="logo">
                    <a href="index.html">
                        <img src="../img/logo.png" alt="Logo">
                    </a>
                </div>
            </div>
            <div class="col-md-6">
                <form action="/products" class="search">
                    <input value="${name}"  type="text" placeholder="Tìm kiếm" name="name">
                    <button><i class="fa fa-search"></i></button>
                </form>
            </div>
            <div class="col-md-3">
                <div class="user">
                    <a href="wishlist.html" class="btn wishlist">
                        <i class="fa fa-heart"></i>
                        <span>(0)</span>
                    </a>
                    <a href="cart.html" class="btn cart">
                        <i class="fa fa-shopping-cart"></i>
                        <span>(0)</span>
                    </a>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Bottom Bar End -->