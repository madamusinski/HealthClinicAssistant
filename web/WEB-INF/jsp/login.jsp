<%-- 
    Document   : login
    Created on : 2019-09-02, 20:35:08
    Author     : Mateusz
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Wprowadz dane, aby zalogować się:</h1>
        
        <c:if test="${param.error != null}"> 
	<p>Invalid username / password</p>
        </c:if>
        
<c:url var="loginUrl" value="/login"/> 
<form action="${loginUrl}" method="post">
	<p><label for="username">User:</label></p>
	<input type="text" id="username" name="username"/> 

	<p><label for="password">Password:</label></p>
	<input type="password" id="password" name="password"> 

	<div>
		<input name="submit" type="submit"/>
	</div>
</form>
        <!--
        <form name='loginForm' action="<c:url value='j_spring_security_check' />" method='POST'>
            <table>
                <tr>
                    <td>Login:</td>
                    <td><input type='text' name='username' value="" placeholder="Podaj login..."></td>
                </tr>
                <tr>
                    <td><input type='hidden' name='password' value="Podaj hasło..."/></td>
                </tr>
                <tr>
                    <td ><input name="submit" type="submit"
                                value="submit" /></td>

                    <td>                       
                </td>

                </tr>
            </table>

            <input type="hidden" name="${_csrf.parameterName}"
                   value="${_csrf.token}" />
        </form>-->
    </body>
</html>
