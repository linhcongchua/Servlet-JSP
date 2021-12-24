<%-- 
    Document   : About.jsp
    Created on : Oct 30, 2020, 3:58:08 PM
    Author     : DELL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="MyTagFile" uri="/WEB-INF/tlds/MyTagFile"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Liquor Store - Free Bootstrap 4 Template by Colorlib</title>
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

        <MyTagFile:HeaderShooter currentPage="account"/>

        <form action="account" method="POST">
            <section class="ftco-section">
                <form action="register" method="POST">
                    <div class="container">
                        <div class="row justify-content-center">
                            <div class="col-xl-10 ftco-animate">
                                <form action="#" class="billing-form">
                                    <h3 class="mb-4 billing-heading">Thông Tin Tài Khoản</h3>
                                    <div class="row align-items-end">
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label for="firstname">Tên Tài Khoản </label>
                                                <input type="text" name="username" value="${acc.username}" class="form-control" readonly="">
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label for="firstname">Mật Khẩu: </label>
                                                <input type="password" name="password" value="${acc.password}" class="form-control">
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label for="firstname">Họ tên</label>
                                                <input type="text" name="hoten" value="${acc.name}" class="form-control">
                                            </div>
                                        </div>
                                        <div class="w-100"></div>
                                        <div class="col-md-12">
                                            <div class="form-group">
                                                <label for="country">Xã</label>
                                                <div class="select-wrap">
                                                    <div class="icon"><span class="ion-ios-arrow-down"></span></div>
                                                        <MyTagFile:Select name="Xa" class="form-control" optionsList="${listXa}"/>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="w-100"></div>
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label for="streetaddress">Số Đường</label>
                                                <input name="addressNo" type="text" class="form-control" value="${acc.addressNo}"/>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label for="streetaddress">Số Nhà</label>
                                                <input name="homeNo" type="text" class="form-control" value="${acc.homeNo}">
                                            </div>
                                        </div>
                                        <div class="w-100"></div>
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label for="phone">Phone</label>
                                                <input name="phone" type="text" class="form-control" value="${acc.phone}">
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label for="emailaddress">Email</label>
                                                <input name="email" type="text" class="form-control" value="${acc.email}">
                                            </div>
                                        </div>
                                        <div class="w-100"></div>
                                    </div>
                                </form><!-- END -->



                                <div class="row mt-5 pt-3 d-flex">
                                    <!--<p><a href="#"class="btn btn-primary py-3 px-4">Place an order</a></p>-->
                                    <input style="width: auto; height: 50%" type="submit" value="Lưu Thông Tin" class="btn btn-primary py-3 px-4"/>
                                </div>
                            </div> <!-- .col-md-8 -->
                        </div>
                    </div>
                </form>
            </section>
        </form>

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
