<%-- 
    Document   : Home.jsp
    Created on : Oct 23, 2020, 12:11:55 PM
    Author     : DELL
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="MyTagFile" uri="/WEB-INF/tlds/MyTagFile" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Liquor Store - Free Bootstrap 4 Template by Colorlib</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

        <link href="https://fonts.googleapis.com/css2?family=Spectral:ital,wght@0,200;0,300;0,400;0,500;0,700;0,800;1,200;1,300;1,400;1,500;1,700&display=swap" rel="stylesheet">

        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

        <link rel="stylesheet" href="css/animate.css">

        <link rel="stylesheet" href="css/owl.carousel.min.css">
        <link rel="stylesheet" href="css/owl.theme.default.min.css">
        <link rel="stylesheet" href="css/magnific-popup.css">

        <link rel="stylesheet" href="css/flaticon.css">
        <link rel="stylesheet" href="css/style.css">
        <style>
            <c:if test="${acc.role}">
                body{
                    background-color: #b3b7bb;
                }
            </c:if>
        </style>
    </head>
    <body>
        <MyTagFile:Header acc="${acc}"/>
        <section class="ftco-section ftco-no-pb">
            <div class="container">
                <div class="row">
                    <div class="col-md-6 img img-3 d-flex justify-content-center align-items-center" style="background-image: url(imageAssign/hongkong3.jpg);">
                    </div>
                    <div class="col-md-6 wrap-about pl-md-5 ftco-animate py-5">
                        <div class="heading-section">
                            <span class="subheading">Open 7:00 - 23:30</span>
                            <h2 class="mb-4">Hãy đến HongKong1 để yêu hơn 70% cơ thể của bạn.</h2>

                            <p>Cái thời tiết mưa lăn phăn se lạnh của đầu mùa làm ta cảm giác như cuộc sống chậm lại, ký ức ùa về kèm nỗi nhớ gia diết</p>
                            <p>Đi đâu nữa #HongKong1 làm cái chân gà nhâm nhi ly rượu sochul cho ấm cái bụng và nghe bản nhạc du dương bạn ề.</p>
                            <p class="year">
                                <strong class="number" data-number="148">0</strong>
                                <span>Người đã CheckIn ở đây.</span>
                            </p>
                        </div>

                    </div>
                </div>
            </div>
        </section>

        <section class="ftco-section ftco-no-pb">
            <div class="container">
                <div class="row">
                    <c:forEach var="type" items="${typeList}">
                        <div class="col-lg-2 col-md-4 ">
                            <div class="sort w-100 text-center ftco-animate">
                                <div onclick="location.href = 'product?typeID=${type.id}'" class="img" style="background-image: url(imageAssign/${type.pathImage});"></div>
                                <h3>${type.name}</h3>
                            </div>
                        </div>
                    </c:forEach>
                    <c:if test="${acc.role}">
                        <div class="col-lg-2 col-md-4 ">
                            <div class="sort w-100 text-center ftco-animate">
                                <div onclick="location.href = 'admin?typeRequest=addNewType'" class="img" style="background-image: url(imageAssign/plus.png);"></div>
                                <h3>Thêm Loại Đồ</h3>
                            </div>
                        </div>
                    </c:if>
                </div>
            </div>
        </section>

        <section class="ftco-section">
            <div class="container">
                <div class="row justify-content-center pb-5">
                    <div class="col-md-7 heading-section text-center ftco-animate">
                        <span class="subheading">Our Delightful offerings</span>
                        <h2>Tastefully Yours</h2>
                    </div>
                </div>
                <div class="row">
                    <c:forEach var="product" items="${productList}">
                        <div class="col-md-3 d-flex">
                            <div class="product ftco-animate">
                                <div class="img d-flex align-items-center justify-content-center" style="background-image: url(imageAssign/${product.pathImage});">
                                    <div class="desc">
                                        <p class="meta-prod d-flex">
                                            <c:if test="${not acc.role}">
                                                <a href="product?productID=${product.productID}&typeID=${product.typeID}&isBuy=true" class="d-flex align-items-center justify-content-center"><span class="flaticon-shopping-bag"></span></a>
                                                <a href="productSingle?productID=${product.productID}" class="d-flex align-items-center justify-content-center"><span class="flaticon-visibility"></span></a>
                                                </c:if>
                                                <c:if test="${acc.role}">
                                                <a href="admin?typeRequest=deleteMainProduct&productID=${product.productID}" class="d-flex align-items-center justify-content-center"><span class="flaticon-delete"></span></a>
                                                </c:if>
                                        </p>
                                    </div>
                                </div>
                                <div class="text text-center">
                                    <span class="${product.status}">${product.status}</span>
                                    <span class="category">${typeDetect[product.typeID]}</span>
                                    <h2>${product.name}</h2>
                                    <p class="mb-0"><span class="price price-sale">${product.salePrice}</span> <span class="price">${product.price}</span></p>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                    <c:if test="${acc.role}">
                        <div class="col-md-3 d-flex">
                            <div class="product ftco-animate">
                                <div class="img d-flex align-items-center justify-content-center" style="background-image: url(imageAssign/hongkong5.jpg);">
                                    <div class="desc">
                                        <p class="meta-prod d-flex">
                                            <a href="product" class="d-flex align-items-center justify-content-center"><span class="flaticon-add"></span></a>
                                        </p>
                                    </div>
                                </div>
                                <div class="text text-center">
                                    <h2>Thêm Main Sản Phẩm</h2>

                                </div>
                            </div>
                        </div>
                    </c:if>
                </div>
                <div class="row justify-content-center">
                    <div class="col-md-4">
                        <a href="product" class="btn btn-primary d-block">View All Products <span class="fa fa-long-arrow-right"></span></a>
                    </div>
                </div>
            </div>
        </section>

        <section class="ftco-section testimony-section img" style="background-image: url(imageAssign/hongkong3.jpg);">
            <div class="overlay"></div>
            <div class="container">
                <div class="row justify-content-center mb-5">
                    <div class="col-md-7 text-center heading-section heading-section-white ftco-animate">
                        <span class="subheading">Mách nhỏ</span>
                        <h2 class="mb-3">RepLy Người Dùng</h2>
                    </div>
                </div>
                <div class="row ftco-animate">
                    <div class="col-md-12">
                        <div class="carousel-testimony owl-carousel ftco-owl">
                            <c:forEach var="c" items="${listComment}" >
                                <div class="item">
                                    <div class="testimony-wrap py-4">
                                        <div class="icon d-flex align-items-center justify-content-center"><span class="fa fa-quote-left"></div>
                                        <div class="text">
                                            <p class="mb-4">${c.content}</p>
                                            <div class="d-flex align-items-center">
                                                <div class="user-img" style="background-image: url(images/person_1.jpg)"></div>
                                                <div class="pl-3">
                                                    <p class="name">${c.author}</p>
                                                    <span class="position">${c.date}</span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <MyTagFile:Footer/>
        <script src="js/jquery.min.js"></script>
        <script src="js/jquery-migrate-3.0.1.min.js"></script>
        <script src="js/popper.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/jquery.easing.1.3.js"></script>
        <script src="js/jquery.waypoints.min.js"></script>
        <script src="js/jquery.stellar.min.js"></script>
        <script src="js/owl.carousel.min.js"></script>
        <script src="js/jquery.magnific-popup.min.js"></script>
        <script src="js/jquery.animateNumber.min.js"></script>
        <script src="js/scrollax.min.js"></script>
        <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
        <script src="js/google-map.js"></script>
        <script src="js/main.js"></script>

    </body>
</html>
