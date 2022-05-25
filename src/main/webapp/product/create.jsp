<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 5/18/2022
  Time: 10:16 PM
  To change this template use File | Settings | File Templates.
--%>
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
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400|Source+Code+Pro:700,900&display=swap" rel="stylesheet">

    <!-- CSS Libraries -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
    <link href="../lib/slick/slick.css" rel="stylesheet">
    <link href="../lib/slick/slick-theme.css" rel="stylesheet">

    <!-- Template Stylesheet -->
    <link href="../css/style2.css" rel="stylesheet">
</head>

<body>
<jsp:include page="navba.jsp"></jsp:include>

<!-- Breadcrumb Start -->
<div class="breadcrumb-wrap">
    <div class="container-fluid">
        <ul class="breadcrumb">
            <li class="breadcrumb-item"><a href="#">Home</a></li>
            <li class="breadcrumb-item"><a href="#">Products</a></li>
            <li class="breadcrumb-item active">Product Detail</li>
        </ul>
    </div>
</div>
<!-- Breadcrumb End -->

<!-- Product Detail Start -->
<div class="product-detail">
    <div class="container-fluid">
        <div class="row">
            <div class="col-lg-8">
                <div class="col-lg-12">
                    <div class="col-lg-4"></div>

                    <div style="left: 100px" class="col-lg-8">
                        <div  class="register-form">
                            <center><b><h3>Thêm sản phẩm mới</h3></b></center>

                            <form method="post">

                                <div class="row">
                                    <div class="col-md-12">
                                        <label>Tên</label>
                                        <input class="form-control" type="text" name="name">
                                    </div>
                                    <div class="col-md-12">
                                        <label>Ảnh</label>
                                        <input class="form-control" type="text" name="image" >
                                    </div>
                                    <div class="col-md-12">
                                        <label>Giá sản phẩm</label>
                                        <input class="form-control" type="text" name="price">
                                    </div>
                                    <p class="text-danger">${mess2}</p>
                                    <div class="col-md-12">
                                        <label>Tiêu để</label>
                                        <input class="form-control" type="text" name="title" >
                                    </div>
                                    <div class="col-md-12">
                                        <label>Mô tả</label>
                                        <input class="form-control" type="text" name="discription">
                                    </div>
                                    <p class="text-danger">${mess}</p>
                                    <div class="col-md-12">
                                        <label>Số danh mục</label>
                                        <input class="form-control" type="text" name="cateID" >
                                    </div>
                                    <div class="col-md-12">
                                        <center><button class="btn">Thêm sản phẩm</button></center>
                                        <br>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>

                </div>
                



                <div class="row product-detail-bottom">
                    <div class="col-lg-12">
                        <ul class="nav nav-pills nav-justified">
                            <li class="nav-item">
                                <a class="nav-link active" data-toggle="pill" href="#description">Description</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" data-toggle="pill" href="#specification">Specification</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" data-toggle="pill" href="#reviews">Reviews (1)</a>
                            </li>
                        </ul>

                        <div class="tab-content">
                            <div id="description" class="container tab-pane active">
                                <h4>Product description</h4>
                                <p>
                                    Lorem ipsum dolor sit amet, consectetur adipiscing elit. In condimentum quam ac mi viverra dictum. In efficitur ipsum diam, at dignissim lorem tempor in. Vivamus tempor hendrerit finibus. Nulla tristique viverra nisl, sit amet bibendum ante suscipit non. Praesent in faucibus tellus, sed gravida lacus. Vivamus eu diam eros. Aliquam et sapien eget arcu rhoncus scelerisque. Suspendisse sit amet neque neque. Praesent suscipit et magna eu iaculis. Donec arcu libero, commodo ac est a, malesuada finibus dolor. Aenean in ex eu velit semper fermentum. In leo dui, aliquet sit amet eleifend sit amet, varius in turpis. Maecenas fermentum ut ligula at consectetur. Nullam et tortor leo.
                                </p>
                            </div>
                            <div id="specification" class="container tab-pane fade">
                                <h4>Product specification</h4>
                                <ul>
                                    <li>Lorem ipsum dolor sit amet</li>
                                    <li>Lorem ipsum dolor sit amet</li>
                                    <li>Lorem ipsum dolor sit amet</li>
                                    <li>Lorem ipsum dolor sit amet</li>
                                    <li>Lorem ipsum dolor sit amet</li>
                                </ul>
                            </div>
                            <div id="reviews" class="container tab-pane fade">
                                <div class="reviews-submitted">
                                    <div class="reviewer">Phasellus Gravida - <span>01 Jan 2020</span></div>
                                    <div class="ratting">
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star"></i>
                                    </div>
                                    <p>
                                        Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam.
                                    </p>
                                </div>
                                <div class="reviews-submit">
                                    <h4>Give your Review:</h4>
                                    <div class="ratting">
                                        <i class="far fa-star"></i>
                                        <i class="far fa-star"></i>
                                        <i class="far fa-star"></i>
                                        <i class="far fa-star"></i>
                                        <i class="far fa-star"></i>
                                    </div>
                                    <div class="row form">
                                        <div class="col-sm-6">
                                            <input type="text" placeholder="Name">
                                        </div>
                                        <div class="col-sm-6">
                                            <input type="email" placeholder="Email">
                                        </div>
                                        <div class="col-sm-12">
                                            <textarea placeholder="Review"></textarea>
                                        </div>
                                        <div class="col-sm-12">
                                            <button>Submit</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="product">
                    <div class="section-header">
                        <h1>Related Products</h1>
                    </div>

                    <div class="row align-items-center product-slider product-slider-3">
                        <div class="col-lg-3">
                            <div class="product-item">
                                <div class="product-title">
                                    <a href="#">Product Name</a>
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
                                        <img src="../img/product-10.jpg" alt="Product Image">
                                    </a>
                                    <div class="product-action">
                                        <a href="#"><i class="fa fa-cart-plus"></i></a>
                                        <a href="#"><i class="fa fa-heart"></i></a>
                                        <a href="#"><i class="fa fa-search"></i></a>
                                    </div>
                                </div>
                                <div class="product-price">
                                    <h3><span>$</span>99</h3>
                                    <a class="btn" href=""><i class="fa fa-shopping-cart"></i>Buy Now</a>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-3">
                            <div class="product-item">
                                <div class="product-title">
                                    <a href="#">Product Name</a>
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
                                        <img src="../img/product-8.jpg" alt="Product Image">
                                    </a>
                                    <div class="product-action">
                                        <a href="#"><i class="fa fa-cart-plus"></i></a>
                                        <a href="#"><i class="fa fa-heart"></i></a>
                                        <a href="#"><i class="fa fa-search"></i></a>
                                    </div>
                                </div>
                                <div class="product-price">
                                    <h3><span>$</span>99</h3>
                                    <a class="btn" href=""><i class="fa fa-shopping-cart"></i>Buy Now</a>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-3">
                            <div class="product-item">
                                <div class="product-title">
                                    <a href="#">Product Name</a>
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
                                        <img src="../img/product-6.jpg" alt="Product Image">
                                    </a>
                                    <div class="product-action">
                                        <a href="#"><i class="fa fa-cart-plus"></i></a>
                                        <a href="#"><i class="fa fa-heart"></i></a>
                                        <a href="#"><i class="fa fa-search"></i></a>
                                    </div>
                                </div>
                                <div class="product-price">
                                    <h3><span>$</span>99</h3>
                                    <a class="btn" href=""><i class="fa fa-shopping-cart"></i>Buy Now</a>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-3">
                            <div class="product-item">
                                <div class="product-title">
                                    <a href="#">Product Name</a>
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
                                        <img src="../img/product-4.jpg" alt="Product Image">
                                    </a>
                                    <div class="product-action">
                                        <a href="#"><i class="fa fa-cart-plus"></i></a>
                                        <a href="#"><i class="fa fa-heart"></i></a>
                                        <a href="#"><i class="fa fa-search"></i></a>
                                    </div>
                                </div>
                                <div class="product-price">
                                    <h3><span>$</span>99</h3>
                                    <a class="btn" href=""><i class="fa fa-shopping-cart"></i>Buy Now</a>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-3">
                            <div class="product-item">
                                <div class="product-title">
                                    <a href="#">Product Name</a>
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
                                        <img src="../img/product-2.jpg" alt="Product Image">
                                    </a>
                                    <div class="product-action">
                                        <a href="#"><i class="fa fa-cart-plus"></i></a>
                                        <a href="#"><i class="fa fa-heart"></i></a>
                                        <a href="#"><i class="fa fa-search"></i></a>
                                    </div>
                                </div>
                                <div class="product-price">
                                    <h3><span>$</span>99</h3>
                                    <a class="btn" href=""><i class="fa fa-shopping-cart"></i>Buy Now</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <jsp:include page="sidebar.jsp"></jsp:include>
        </div>
    </div>
</div>
<!-- Product Detail End -->

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
