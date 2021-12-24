<%-- 
    Document   : Cart
    Created on : Nov 3, 2020, 10:40:04 PM
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
        <meta charset="utf-8">
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

        </script>
    </head>
    <body>
        <MyTagFile:HeaderShooter currentPage="cart" listBasket="${sessionScope.listBasket}"/>

        <section class="ftco-section">
            <form action="checkout" method="GET">
                <div class="container">
                    <div class="row">
                        <div class="table-wrap">
                            <table class="table">
                                <thead class="thead-primary">
                                    <tr>
                                        <th>Ngày</th>
                                        <th>&nbsp;</th>
                                        <th>Tên Sản Phẩm</th>
                                        <th>Doanh Thu</th>
                                        <th>Tài Khoản</th>
                                        <th>&nbsp;</th>
                                        <th>&nbsp;</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach var="order" items="${listOrder}">
                                        <tr class="alert" role="alert">
                                            <td>
                                                <label class="checkbox-wrap checkbox-primary">
                                                    <!--check box buy or not-->
                                                    <span class="checkmark">${order.dateBuy}</span>
                                                </label>
                                            </td>
                                            <td>
                                                <div class="img" style="background-image: url(imageAssign/${orderDetect[order.productID].pathImage});"></div>
                                            </td>
                                            <td>
                                                <div class="email">
                                                    <span>${orderDetect[order.productID].name}</span>
                                                    <span></span>
                                                </div>
                                            </td>
                                            <td class="MyPrice">${orderDetect[order.productID].price * order.quantity}</td>
                                            <td class="quantity">
                                                <span>${mapAcc[order.accountID].name}</span>
                                            </td>
                                            
                                            <td>
                                                
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>
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
