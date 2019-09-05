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
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
 
    </head>
    <body>
        <h1>Wprowadz dane, aby zalogować się:</h1>
        
        <c:if test="${param.error != null}"> 
	<p>Invalid username / password</p>
        </c:if>
        
<c:url var="loginUrl" value="/j_spring_security_check"/> 
<form action="${loginUrl}" method="post">
	<p><label for="username">Login:</label></p>
	<input type="text" id="username" name="j_username"/> 

	<p><label for="password">Password:</label></p>
	<input type="password" id="password" name="j_password"> 

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
