<%-- 
    Document   : MySelect
    Created on : Oct 30, 2020, 4:27:14 PM
    Author     : DELL
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@tag description="put the tag description here" pageEncoding="UTF-8"%>
<%@tag body-content="empty" dynamic-attributes="tagAttrs"%>

<%-- The list of normal or fragment attributes can be specified here: --%>
<%@attribute name="name" required="true"%>
<%@attribute name="optionsList" type="java.util.List" required="true" rtexprvalue="true"%>

<%-- any content can be specified here e.g.: --%>
<select name="${name}"
    <c:forEach var="attrEntry" items="${tagAttrs}">
         ${attrEntry.key}="${attrEntry.value}"
    </c:forEach>
    >
    <c:forEach var="option" items="${optionsList}">
        <option value="${option}">${option}</option>
    </c:forEach>
</select>
