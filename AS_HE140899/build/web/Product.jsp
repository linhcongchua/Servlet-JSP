<%-- 
    Document   : Product
    Created on : Oct 31, 2020, 9:18:10 AM
    Author     : DELL
--%>

<%@page import="Model.TypeProduct"%>
<%@page import="java.util.ArrayList"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="MyTagFile" uri="/WEB-INF/tlds/MyTagFile"%>
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
    </head>
    <body>
        <MyTagFile:HeaderShooter listOrder="${listOrder}" currentPage="product"/>

        <section class="ftco-section">
            <div class="container">
                <div class="row">
                    <div class="col-md-9">
                        <div class="row mb-4">
                            <div class="col-md-12 d-flex justify-content-between align-items-center">
                                <h4 class="product-select">Select Types of Products</h4>
                            </div>
                        </div>
                        <div class="row">
                            <c:forEach var="product" items="${productList}">
                                <div class="col-md-4 d-flex">
                                    <div class="product ftco-animate">
                                        <div class="img d-flex align-items-center justify-content-center" style="background-image: url(imageAssign/${product.pathImage});">
                                            <div class="desc">
                                                <p class="meta-prod d-flex">
                                                    <c:if test="${not acc.role}">
                                                        <a href="product?productID=${product.productID}&typeID=${product.typeID}&isBuy=true" class="d-flex align-items-center justify-content-center"><span class="flaticon-shopping-bag"></span></a>
                                                        <a href="productSingle?productID=${product.productID}" class="d-flex align-items-center justify-content-center"><span class="flaticon-visibility"></span></a>
                                                        </c:if>
                                                        <c:if test="${acc.role}">
                                                        <a href="admin?productID=${product.productID}&typeRequest=editProduct" class="d-flex align-items-center justify-content-center"><span class="flaticon-edit"></span></a>
                                                        <a href="admin?productID=${product.productID}&typeRequest=deleteProduct" class="d-flex align-items-center justify-content-center"><span class="flaticon-delete"></span></a>
                                                        <a href="admin?productID=${product.productID}&typeRequest=addNewMainProduct" class="d-flex align-items-center justify-content-center"><span class="flaticon-add"></span></a>
                                                        </c:if>
                                                </p>
                                            </div>
                                        </div>
                                        <div class="text text-center">
                                            <span class="${product.status} ${product.status=="Có Cồn"?"sale":""}">${product.status}</span>
                                            <span class="category">${typeDetect[product.typeID]}</span>
                                            <h2>${product.name}</h2>
                                            <p class="mb-0"><span class="price price-sale">${product.salePrice}</span> <span class="price">${product.price}</span></p>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>

                            <c:if test="${acc.role}">
                                <div class="col-md-4 d-flex">
                                    <div class="product ftco-animate">
                                        <div class="img d-flex align-items-center justify-content-center" style="background-image: url(imageAssign/hongkong5.jpg);">
                                            <div class="desc">
                                                <p class="meta-prod d-flex">
                                                    <a href="admin?typeRequest=addNewProduct" class="d-flex align-items-center justify-content-center"><span class="flaticon-add"></span></a>
                                                </p>
                                            </div>
                                        </div>
                                        <div class="text text-center">
                                            <h2>Thêm Sản Phẩm</h2>

                                        </div>
                                    </div>
                                </div>
                            </c:if>

                        </div>
                    </div>

                    <div class="col-md-3">
                        <div class="sidebar-box ftco-animate">
                            <div class="categories">
                                <h3>Product Types</h3>
                                <ul class="p-0">
                                    <c:forEach var="type" items="${typeList}">
                                        <li><a href="product?typeID=${type.id}">${type.name} <span class="fa fa-chevron-right"></span></a></li>
                                            </c:forEach>
                                </ul>
                            </div>
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
