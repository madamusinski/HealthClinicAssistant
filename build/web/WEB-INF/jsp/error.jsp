<%-- 
    Document   : error
    Created on : 2019-09-03, 19:34:09
    Author     : Mateusz
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Access Denied</title>
    </head>
    <body>
        <h1>Access Denied!</h1>
        <p><a href="<c:url value='/login'></c:url>>Try logging in again...</a></p>
    </body>
</html>
