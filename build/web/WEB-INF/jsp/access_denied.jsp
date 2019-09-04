<%-- 
    Document   : access_denied
    Created on : 2019-09-03, 19:34:09
    Author     : Mateusz
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>${title}</title>
    </head>
    <body>
        <h1>Access Denied! ${sessionScope["SPRING_SECURITY_LAST_EXCEPTION"].message}</h1>
        <h1>${message}</h1>

    </body>
</html>
