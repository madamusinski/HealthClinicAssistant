<%-- 
    Document   : dodaj_wizyta
    Created on : 2019-09-09, 19:14:04
    Author     : Mateusz
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script type="text/javascript" language="javascript" charset="utf8" src="https://code.jquery.com/jquery-3.3.1.js"></script>
        
  
        <script type="text/javascript" language="javascript" charset="utf8" src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.js"></script>
        <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.19/css/jquery.dataTables.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet">
        <title>JSP Page</title>
    </head>
    <body>
         <!--Okienko dodawania-->
         <div class="container">
             <div class="row">
                <div class="col-sm">
                    One of three columns
                </div>
                <div class="col-sm">
                    <h1>Dodaj wizytę:</h1>
                </div>
                <div class="col-sm">
                    One of three columns
                </div>
            </div>
            <div class="row">
                <div class="col-sm">
                    One of three columns
                </div>
                <div class="col-sm">
                    <form:form action="" modelAttribute="" method="POST">
                        <input id="addId" type="hidden" path="id" name="id">
                                <div class="md-form mb-4">
                                    <form:hidden path="id" value=""></form:hidden>
                                    <form:label path="dataWizyta">
                                        <spring:message text="Data:"/>
                                    </form:label>
                                    <form:input path="dataWizyta"/>
                                </div>
                                <label for="addData" class="col-form-label">Dodaj datę:</label>
                                <br>
                                <input id="addData" type="text" name="data" class="form-control">
                                </div>
                                <div class="md-form mb-4">
                                <label for="addCzas" class="col-form-label">Dodaj godzinę:</label>
                                <br>
                                <div class="input-group mb-3">
                                <select id="addCzasz" class="custom-select">
                                    <option selected>Wybierz godzinę</option>
                                    <option value="08:00">08:00</option>
                                    <option value="08:00">08:15</option>
                                    <option value="08:00">08:30</option>
                                    <option value="08:00">08:45</option>
                                    <option value="08:00">09:00</option>
                                    <option value="08:00">09:15</option>
                                    <option value="08:00">09:30</option>
                                    <option value="08:00">09:45</option>
                                    <option value="08:00">10:00</option>
                                    <option value="08:00">10:15</option>
                                    <option value="08:00">10:30</option>
                                    <option value="08:00">10:45</option>
                                    <option value="08:00">11:00</option>
                                    <option value="08:00">11:15</option>
                                    <option value="08:00">11:30</option>
                                    <option value="08:00">11:45</option>
                                    <option value="08:00">12:00</option>
                                    <option value="08:00">12:15</option>
                                    <option value="08:00">12:30</option>
                                    <option value="08:00">12:45</option>
                                    
                                </select>
                                </div>
                               </div>
                                <div class="md-form mb-4">
                                <label for="pacjent" class="col-form-label">Podaj nazwisko i imię pacjenta:</label>
                                <br>
                                <input id="pacjent" type="text" name="pacjent" class="form-control">
                                </div>
                                <br>
                                <input class="btn btn-default" type="submit" value="Dodaj">
                    </form:form>
                </div>
                <div class="col-sm">
                    One of three columns
                </div>
            </div>
        </div>
                            <form id="addform"  accept-charset="UTF-8">    
                                
                                
                            </form>
                       
    </body>
</html>
