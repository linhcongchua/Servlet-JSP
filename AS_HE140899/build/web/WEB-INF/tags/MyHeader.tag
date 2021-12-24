<%-- 
    Document   : header
    Created on : Oct 30, 2020, 11:42:53 AM
    Author     : DELL
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@tag description="put the tag description here" pageEncoding="UTF-8"%>
<%@tag body-content="empty" dynamic-attributes="tagAttrs"%>
<%-- The list of normal or fragment attributes can be specified here: --%>
<%@attribute name="listOrder" type="java.util.ArrayList<Model.Order>" rtexprvalue="true"%>
<%@attribute name="acc" type="Model.Account" rtexprvalue="true"%>
<%-- any content can be specified here e.g.: --%>

<div class="wrap">
    <div class="container">
        <div class="row">
            <div class="col-md-6 d-flex align-items-center">
                <p class="mb-0 phone pl-md-2">
                    <a href="#" class="mr-2"><span class="fa fa-phone mr-1"></span> +84 971 741 127</a>
                    <a href="#"><span class="fa fa-paper-plane mr-1"></span> hongkong1pubcafe@email.com</a>
                </p>
            </div>
            <div class="col-md-6 d-flex justify-content-md-end">
                <div class="social-media mr-4">
                    <p class="mb-0 d-flex">
                        <a href="#" class="d-flex align-items-center justify-content-center"><span class="fa fa-facebook"><i class="sr-only">Facebook</i></span></a>
                        <a href="#" class="d-flex align-items-center justify-content-center"><span class="fa fa-twitter"><i class="sr-only">Twitter</i></span></a>
                        <a href="#" class="d-flex align-items-center justify-content-center"><span class="fa fa-instagram"><i class="sr-only">Instagram</i></span></a>
                        <a href="#" class="d-flex align-items-center justify-content-center"><span class="fa fa-dribbble"><i class="sr-only">Dribbble</i></span></a>
                    </p>
                </div>
                <div class="reg">
                    <c:choose>
                        <c:when test="${not empty acc}">
                            <p class="mb-0"><a href="logout" class="mr-2">Log out</a> <a href="#">${acc.username}</a></p>
                            </c:when>
                            <c:otherwise>
                            <p class="mb-0"><a href="Register.jsp" class="mr-2">Register</a> <a onclick="confirmIt()" id="myLoginDirect">Log In</a></p>
                            <script type="text/javascript">
                                <c:if test="${not empty cookie.username}">
                                var confirmIt = function (e) {
                                    if (!confirm('Are you want to login as ${cookie.username.value}?')) {
                                        window.location.href = "login?currentPage=${currentPage}";
                                    } else {
                                        window.location.href = "login?currentPage=${currentPage}&useCookie=true";
                                    }
                                };
                                </c:if>
                                <c:if test="${empty cookie.username}">
                                var confirmIt = function (e) {
                                    window.location.href = "login?currentPage=${currentPage}";
                                };
                                </c:if>
                            </script>
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>
        </div>
    </div>
</div>

<nav class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light" id="ftco-navbar">
    <div class="container">
        <a class="navbar-brand" href="home">HongKong1 <span>Pub&Cafe</span></a>
        <div class="order-lg-last btn-group">
            <a href="#" class="btn-cart dropdown-toggle dropdown-toggle-split" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                <c:if test="${not acc.role}">
                    <span class="flaticon-shopping-bag"></span>
                    <div class="d-flex justify-content-center align-items-center">
                        <small>
                            <c:choose>
                                <c:when test="${not empty listBasket}"><c:out value="${fn:length(listBasket)}" /></c:when>
                                <c:otherwise>0</c:otherwise>
                            </c:choose>
                        </small>
                    </div>
                </c:if>
            </a>
            <c:if test="${not acc.role}">
                <div class="dropdown-menu dropdown-menu-right">
                    <c:choose>
                        <c:when test="${not empty listBasket}">
                            <c:forEach var="basket" items="${listBasket}">
                                <div class="dropdown-item d-flex align-items-start" href="#">
                                    <div class="img" style="background-image: url(imageAssign/${orderDetect[basket.productid].pathImage});"></div>
                                    <div class="text pl-3">
                                        <h4>${orderDetect[basket.productid].name}</h4>
                                        <p class="mb-0"><a href="#" class="price">${orderDetect[basket.productid].price}</a><span class="quantity ml-3">Quantity: ${basket.quantity}</span></p>
                                    </div>
                                </div>
                            </c:forEach>
                        </c:when>
                        <c:otherwise>
                            <c:forEach var="order" items="${listBasket}">
                                <div class="dropdown-item d-flex align-items-start" href="#">
                                    <div class="img" style="background-image: url(images/prod-1.jpg);"></div>
                                    <div class="text pl-3">
                                        <p class="mb-0">No Order</p>
                                    </div>
                                </div>
                            </c:forEach>
                        </c:otherwise>
                    </c:choose>
                    <a class="dropdown-item text-center btn-link d-block w-100" href="cart">
                        View All
                        <span class="ion-ios-arrow-round-forward"></span>
                    </a>
                </div>
            </c:if>

        </div>

        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#ftco-nav" aria-controls="ftco-nav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="oi oi-menu"></span> Menu
        </button>

        <div class="collapse navbar-collapse" id="ftco-nav">
            <ul class="navbar-nav ml-auto">
                <li class="nav-item active"><a href="home" class="nav-link">Trang Chủ</a></li>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="dropdown02" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Thông Tin</a>
                    <div class="dropdown-menu" aria-labelledby="dropdown04">
                        <c:if test="${not acc.role}">
                            <a class="dropdown-item" href="account">Tài Khoản</a>
                            <a class="dropdown-item" href="productbuy">Đơn Đã Mua</a>
                        </c:if>
                        <c:if test="${acc.role}">
                            <a class="dropdown-item" href="admin?typeRequest=doanhThu">Doanh Thu Trong Tháng</a>
                            <a class="dropdown-item" href="admin?typeRequest=listTaiKhoan">Danh Sách Tài Khoản</a>
                        </c:if>
                    </div>
                </li>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="dropdown04" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Sản Phẩm</a>
                    <div class="dropdown-menu" aria-labelledby="dropdown04">
                        <a class="dropdown-item" href="product">Sản Phẩm</a>
                        <c:if test="${not acc.role}">
                            <a class="dropdown-item" href="cart">Giỏ Hàng</a>
                        </c:if>
                        <!--<a class="dropdown-item" href="checkout">Checkout</a>-->
                    </div>
                </li>
                <!--                <li class="nav-item"><a href="blog.html" class="nav-link">Blog</a></li>
                                <li class="nav-item"><a href="contact.html" class="nav-link">Liên Hệ</a></li>-->
            </ul>
        </div>
    </div>
</nav>
<!-- END nav anh o duoi-->

<div class="hero-wrap" style="background-image: url('images/hongkong2.png');" data-stellar-background-ratio="0.5">
    <div class="overlay"></div>
    <div class="container">
        <div class="row no-gutters slider-text align-items-center justify-content-center">
            <div class="col-md-8 ftco-animate d-flex align-items-end">
                <div class="text w-100 text-center">
                    <h1 class="mb-4">Good <span>Drink</span> for Good <span>Moments</span>.</h1>
                    <p><a href="product" class="btn btn-primary py-2 px-4">Shop Now</a> <a href="#" class="btn btn-white btn-outline-white py-2 px-4">Read more</a></p>
                </div>
            </div>
        </div>
    </div>
</div>

<section class="ftco-intro">
    <div class="container">
        <div class="row no-gutters">
            <div class="col-md-4 d-flex">
                <div class="intro d-lg-flex w-100 ftco-animate">
                    <div class="icon">
                        <span class="flaticon-support"></span>
                    </div>
                    <div class="text">
                        <h2>Online Support 24/7</h2>
                        <p>HongKong1 hỗ trợ Online 24/7.Với phương châm khách hàng là oki</p>
                    </div>
                </div>
            </div>
            <div class="col-md-4 d-flex">
                <div class="intro color-1 d-lg-flex w-100 ftco-animate">
                    <div class="icon">
                        <span class="flaticon-cashback"></span>
                    </div>
                    <div class="text">
                        <h2>Money Back Guarantee</h2>
                        <p>Kinh doang uy tiến chất lượng đồ uống đảm bảo</p>
                    </div>
                </div>
            </div>
            <div class="col-md-4 d-flex">
                <div class="intro color-2 d-lg-flex w-100 ftco-animate">
                    <div class="icon">
                        <span class="flaticon-free-delivery"></span>
                    </div>
                    <div class="text">
                        <h2>Free Shipping &amp; Return</h2>
                        <p>Free ship trong bán kính 5km từ đơn hàng 50k...Ưu đãi đặc biệt cho anh em xóm cầu,FUer FREE...Hỗ trợ giao hàng mọi lúc mọi nơi</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>