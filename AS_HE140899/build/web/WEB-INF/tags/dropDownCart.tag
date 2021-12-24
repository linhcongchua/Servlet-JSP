<%-- 
    Document   : dropDownCart
    Created on : Oct 30, 2020, 8:52:16 PM
    Author     : DELL
cai nay ko dung nua
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@tag description="put the tag description here" pageEncoding="UTF-8"%>
<%@tag body-content="empty" dynamic-attributes="tagAttrs"%>
<%-- The list of normal or fragment attributes can be specified here: --%>
<%@attribute name="listOrder" type="java.util.ArrayList<Model.Order>"  rtexprvalue="true"%>

<%-- any content can be specified here e.g.: --%>
<a href="#" class="btn-cart dropdown-toggle dropdown-toggle-split" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
    <span class="flaticon-shopping-bag"></span>
    <div class="d-flex justify-content-center align-items-center"><small>3</small></div>
</a>
<div class="dropdown-menu dropdown-menu-right">
    <c:choose>
        <c:when test="${not empty listOrder}">
            <c:forEach var="order" items="${listOrder}">
                <div class="dropdown-item d-flex align-items-start" href="#">
                    <div class="img" style="background-image: url(images/prod-1.jpg);"></div>
                    <div class="text pl-3">
                        <h4>${order.name}</h4>
                        <p class="mb-0"><a href="#" class="price">${order.price}</a><span class="quantity ml-3">Quantity: ${order.quantity}</span></p>
                    </div>
                </div>
            </c:forEach>
        </c:when>
        <c:otherwise>
            <div class="dropdown-item d-flex align-items-start" href="#">
                NO ORDER
            </div>
        </c:otherwise>
    </c:choose>
    <a class="dropdown-item text-center btn-link d-block w-100" href="cart.html">
        View All
        <span class="ion-ios-arrow-round-forward"></span>
    </a>
</div>