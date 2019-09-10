<%-- 
    Document   : add_user
    Created on : 2019-09-09, 19:27:22
    Author     : Mateusz
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <script type="text/javascript" language="javascript" charset="utf8" src="https://code.jquery.com/jquery-3.3.1.js"></script>
        
        
     <!--   <script type="text/javascript" language="javascript" charset="utf8" src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.js"></script>-->
        <script type="text/javascript" language="javascript" charset="utf8" src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"></script>
        <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.19/css/jquery.dataTables.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
          <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet">
        <script src="http://ajax.cdnjs.com/ajax/libs/json2/20110223/json2.js"></script>
         
         <script src="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.js"></script>
        <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
        <title>${title}</title>
    </head>
    <body>
         <!--Okienko dodawania-->
         <div class="container">
             <div class="row">
                <div class="col-sm">
                    
                </div>
                <div class="col-sm">
                    <h3>Dodaj użytkownika:</h3>
                </div>
                <div class="col-sm">
                    
                </div>
            </div>
            <div class="row">
                <div class="col-sm">
                    
                </div>
                <div class="col-sm">
                    <form id="addUserForm" method="POST" accept-charset="UTF-8">    
                                <input id="addId" type="hidden" name="id">
                                <div class="md-form mb-4">
                                <label for="addLogin" class="col-form-label">Podaj login:</label>
                                <br>
                                <input id="addLogin" type="text" name="login" class="form-control">
                                </div>
                                <div class="md-form mb-4">
                                <label for="addPassword" class="col-form-label">Podaj haslo</label>
                                <br>
                                <input id="addPassword" type="password" name="password" class="form-control">                                    
                                </div>
                             
                                <div class="md-form mb-4">
                                <label for="pacjent" class="col-form-label">Aktywny:</label>
                                <br>
                                <input id="pacjent" type="checkbox" name="pacjent" class="form-control">
                                </div>
                                <br>
                                <input class="btn btn-default" type="submit" value="Dodaj">
                            </form>
                </div>
                <div class="col-sm">
                    
                </div>
            </div>
        </div>
    </body>
</html>
