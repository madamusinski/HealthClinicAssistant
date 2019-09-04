<%-- 
    Document   : admin
    Created on : 2019-09-02, 20:34:54
    Author     : Mateusz
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>${title}</title>
    </head>
    <body>
        <c:if test="${pageContext.request.userPrincipal.name != null}">
            <p>Witaj ${pageContext.request.userPrincipal.name}</p><a href="<c:url value='/j_spring_security_logout'>     
        </c:url>">Wyloguj się</a></c:if>
        <h1>Welcome to ${message}</h1>
    </body>
</html>
