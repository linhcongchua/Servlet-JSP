<%-- 
    Document   : Register
    Created on : Nov 7, 2020, 5:10:06 PM
    Author     : DELL
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="MyTagFile" uri="/WEB-INF/tlds/MyTagFile"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

        <link href="https://fonts.googleapis.com/css2?family=Spectral:ital,wght@0,200;0,300;0,400;0,500;0,700;0,800;1,200;1,300;1,400;1,500;1,700&display=swap" rel="stylesheet">

        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

        <link rel="stylesheet" href="css/animate.css">

        <link rel="stylesheet" href="css/owl.carousel.min.css">
        <link rel="stylesheet" href="css/owl.theme.default.min.css">
        <link rel="stylesheet" href="css/magnific-popup.css">

        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.13.1/css/bootstrap-select.min.css">

        <link rel="stylesheet" href="css/flaticon.css">
        <link rel="stylesheet" href="css/style.css">
        <script>
            function readURL(input) {
                if (input.files && input.files[0]) {
                    var reader = new FileReader();

                    reader.onload = function (e) {
                        $('#blah')
                                .attr('src', e.target.result)
                                .width(150)
                                .height(200);
                    };

                    reader.readAsDataURL(input.files[0]);
                }
            }
        </script>
    </head>
    <body>
        <MyTagFile:Header />

        <section class="ftco-section">
            <form action="admin" method="POST">
                <div class="container">
                    <div class="row justify-content-center">
                        <div class="col-xl-10 ftco-animate">
                            <form action="#" class="billing-form">
                                <h3 class="mb-4 billing-heading">Thêm Loại Đồ</h3>
                                <input type="text" name="typeRequest" value="addNewType" hidden/>
                                <div class="row align-items-end">
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="firstname">Tên Loại Đồ: </label>
                                            <input type="text" name="name" value="" class="form-control">
                                        </div>
                                    </div>
                                    <div class="w-100"></div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="phone">Description: </label>
                                            <input name="description" type="text" class="form-control">
                                        </div>
                                    </div>
                                    
                                    <div class="w-100"></div>
                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <label for="country">Ảnh Loại Đồ: </label>
                                            <input type="file" name="imagePath" onchange="readURL(this);" class="form-control" />
                                        </div>
                                    </div>
                                    <img id="blah" src="#" alt="your image" />

                                </div>
                            </form><!-- END -->



                            <div class="row mt-5 pt-3 d-flex">
                                <!--<p><a href="#"class="btn btn-primary py-3 px-4">Place an order</a></p>-->
                                <input style="width: auto; height: 50%" type="submit" value="Thêm Loại Đồ" class="btn btn-primary py-3 px-4"/>
                            </div>
                        </div> <!-- .col-md-8 -->
                    </div>
                </div>
            </form>
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
        <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.13.1/js/bootstrap-select.min.js"></script>
        <script src="js/main.js"></script>
    </body>
</html>
