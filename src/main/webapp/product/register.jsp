<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 5/22/2022
  Time: 11:23 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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


<!-- Breadcrumb Start -->
<jsp:include page="navba.jsp"></jsp:include>
<div class="breadcrumb-wrap">
    <div class="container-fluid">
        <ul class="breadcrumb">
            <li class="breadcrumb-item"><a href="#">Trang chủ</a></li>
            <li class="breadcrumb-item"><a href="#">Sản phẩm</a></li>
            <li class="breadcrumb-item active">Đăng kí</li>
        </ul>
    </div>
</div>
<!-- Breadcrumb End -->

<!-- Login Start -->

<div class="login">
    <div class="container-fluid">
        <div class="row">


                <div class="col-md-4"></div>
                <div class="col-lg-4">
                <div class="register-form">
                    <center><b><p>Đăng kí tài khoản</p></b></center>

                    <form action="register?action=register" method="post">

                    <div class="row">
                        <div class="col-md-12">
                            <label>Tên</label>
                            <input class="form-control" type="text" name="firstName">
                        </div>
                        <div class="col-md-12">
                            <label>Họ</label>
                            <input class="form-control" type="text" name="lastName">
                        </div>
                        <div class="col-md-12">
                            <label>Email</label>
                            <input class="form-control" type="text" name="email">
                        </div>
                        <p class="text-danger">${mess2}</p>
                        <div class="col-md-12">
                            <label>Số điện thoại</label>
                            <input class="form-control" type="text" name="phone">
                        </div>
                        <div class="col-md-12">
                            <label>Mật khẩu</label>
                            <input class="form-control" type="text" name="password">
                        </div>
                        <p class="text-danger">${mess}</p>
                        <div class="col-md-12">
                            <label>Nhập lại mật khẩu</label>
                            <input class="form-control" type="text" name="rePassword">
                        </div>
                        <div class="col-md-12">
                            <button class="btn">Đăng kí</button>
                        </div>
                    </div>
                    </form>
                </div>

            </div>
                <div class="col-md-4"></div>


        </div>
    </div>
</div>
<!-- Login End -->


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
