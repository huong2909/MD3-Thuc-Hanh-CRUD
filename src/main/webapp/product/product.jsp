
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>E Store - eCommerce HTML Template</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="eCommerce HTML Template Free Download" name="keywords">
    <meta content="eCommerce HTML Template Free Download" name="description">

    <!-- Favicon -->
    <link href="img/favicon.ico" rel="icon">

    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400|Source+Code+Pro:700,900&display=swap"
          rel="stylesheet">

    <!-- CSS Libraries -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
    <link href="../lib/slick/slick.css" rel="stylesheet">
    <link href="../lib/slick/slick-theme.css" rel="stylesheet">

    <!-- Template Stylesheet -->
    <link href="../css/style2.css" rel="stylesheet">
</head>

<body>


<!-- Breadcrumb Start -->

<jsp:include page="navba.jsp"></jsp:include>
<div class="breadcrumb-wrap">
    <div class="container-fluid">
        <ul class="breadcrumb">
            <li class="breadcrumb-item"><a href="#">Trang chủ</a></li>
            <li class="breadcrumb-item"><a href="#">Sản phẩm</a></li>
            <li class="breadcrumb-item active">Danh sách sản phẩm</li>

            <a href="/products?action=create">/ Tạo mới sản phẩm</a><br>
        </ul>
    </div>
</div>
<!-- Breadcrumb End -->

<!-- Product List Start -->
<div class="product-view">
    <div class="container-fluid">
        <div class="row">
            <div class="col-lg-8">
                <div class="row">
                    <div class="col-md-12">
                        <div class="product-view-top">
                            <div class="row">
                                <div class="col-md-6">
                                    <form class="product-search" action="/products">
                                        <input type="text" placeholder="Tìm kiếm" name="name">
                                        <button><i class="fa fa-search"></i></button>
                                    </form>
                                </div>
                                <div class="col-md-6">
                                    <div class="product-short">
                                        <form action="/products?action=orderby" method="post">
                                            <select style="width: 360px;height: 35px; border:solid black 1px;border-radius: 5px " name="select" onchange="this.form.submit()">
                                                <option value="">Tìm kiếm theo giá</option>
                                                <option value="asc">Tăng dần</option>
                                                <option value="desc">Giảm dần</option>
                                            </select>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>


                    <c:forEach var="product" items="${listA}">
                        <div class="col-md-4">
                            <div class="product-item">
                                <div class="product-title">
                                    <a  href="/products?action=view&id=${product.id}" >${product.name}</a>
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
                                        <img style="width: 250px;height: 250px" src="${product.image}" alt="Product Image">
                                    </a>
                                    <div class="product-action">
                                        <a href="/products?action=view&id=${product.id}" >Xem</a>
                                        <a href="/products?action=edit&id=${product.id}"><i class="fa fa-trash-fill">Sửa</i></a>
                                        <a href="/products?action=delete&id=${product.id}"><i class="fa fa-trash-fill">Xóa</i></a>
                                    </div>
                                </div>
                                <div class="product-price">
                                    <h3 >${product.price}<span>VND</span></h3>
                                    <a  class="btn" href=""><i class="fa fa-shopping-cart"></i>Mua ngay</a>
                                </div>
                            </div>
                        </div>
                    </c:forEach>


                </div>

                <!-- Pagination Start -->
                <div class="col-md-12">
                    <nav aria-label="Page navigation example">
                        <ul class="pagination justify-content-center">

                            <li class="page-item disabled">
                                <a class="page-link" href="#" tabindex="-1">Trước</a>
                            </li>

                            <c:forEach begin="1" end="${endP}" var="i">
                            <li class="page-item active"><a class="page-link" href="products?index=${i}">${i}</a></li>
                            </c:forEach>


                            <li class="page-item">
                                <a class="page-link" href="#">Tiếp</a>
                            </li>

<%--                            <li class="page-item disabled">--%>
<%--                                <a class="page-link" href="#" tabindex="-1">Trước</a>--%>
<%--                            </li>--%>
<%--                            <li class="page-item active"><a class="page-link" href="#">1</a></li>--%>
<%--                            <li class="page-item"><a class="page-link" href="#">2</a></li>--%>
<%--                            <li class="page-item"><a class="page-link" href="#">3</a></li>--%>
<%--                            <li class="page-item">--%>
<%--                                <a class="page-link" href="#">Tiếp</a>--%>
<%--                            </li>--%>

                        </ul>
                    </nav>
                </div>
                <!-- Pagination Start -->
            </div>

          <jsp:include page="sidebar.jsp"></jsp:include>

        </div>
    </div>
</div>
<!-- Product List End -->

<!-- Brand Start -->
<div class="brand">
    <div class="container-fluid">
        <div class="brand-slider">
            <div class="brand-item"><img src="../img/brand-1.png" alt=""></div>
            <div class="brand-item"><img src="../img/brand-2.png" alt=""></div>
            <div class="brand-item"><img src="../img/brand-3.png" alt=""></div>
            <div class="brand-item"><img src="../img/brand-4.png" alt=""></div>
            <div class="brand-item"><img src="../img/brand-5.png" alt=""></div>
            <div class="brand-item"><img src="../img/brand-6.png" alt=""></div>
        </div>
    </div>
</div>
<!-- Brand End -->
<!-- Back to Top -->

<jsp:include page="footer.jsp"></jsp:include>
<a href="#" class="back-to-top"><i class="fa fa-chevron-up"></i></a>

<!-- JavaScript Libraries -->
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js"></script>
<script src="../lib/easing/easing.min.js"></script>
<script src="../lib/slick/slick.min.js"></script>

<!-- Template Javascript -->
<script src="../js/main.js"></script>
</body>
</html>
