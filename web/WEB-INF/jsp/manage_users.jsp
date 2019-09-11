<%-- 
    Document   : manage_users
    Created on : 2019-09-06, 10:01:04
    Author     : maadamusinski
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>${title}</title>
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

   </head>
    <!-- skrytpy -->
    <script>
        $(document).ready(function(){
           $('#table_id').DataTable({
               ajax: {
                   url: "${pageContext.request.contextPath}/admin/manage_users/get_all_users_new_json",
                   dataSrc: ""
               }, 
               "columns" : [
                   {"data":"id"},
                   {"data":"login"},
                   {"data":"active"},
                   
                   {
                     "data":"edit",
                     "render" : function(data, type, row, meta) {
                         return "Edytuj";
                     } 
                },
                {
                    "data":"delete",
                    "render" : function(data, type, row, meta) {
                        return "Usuń";
                    }
                }
               ], "language": {
                        "processing":     "Przetwarzanie...",
                        "search":         "Szukaj:",
                        "lengthMenu":     "Pokaż _MENU_ pozycji",
                        "info":           "Pozycje od _START_ do _END_ z _TOTAL_ łącznie",
                        "infoEmpty":      "Pozycji 0 z 0 dostępnych",
                        "infoFiltered":   "(filtrowanie spośród _MAX_ dostępnych pozycji)",
                        "infoPostFix":    "",
                        "loadingRecords": "Wczytywanie...",
                        "zeroRecords":    "Nie znaleziono pasujących pozycji",
                        "emptyTable":     "Brak danych",
                        "paginate": {
                            "first":      "Pierwsza",
                            "previous":   "Poprzednia",
                            "next":       "Następna",
                            "last":       "Ostatnia"
                        },
                        "aria": {
                            "sortAscending": ": aktywuj, by posortować kolumnę rosnąco",
                            "sortDescending": ": aktywuj, by posortować kolumnę malejąco"
                        }
             }
           }); 
           $('#addUserBtn').click(function(){
            $('#addUser').modal();
           });
           
           $('#edytujWizyta').click(function(){
              $('#editWizyta').modal();
           });
           
         /**  $('#addCzas').click(function(){
               var test = $('#addCzas option:selected').text();
               console.log(test);
           });*/
          $('#addUserForm').submit(function(event){
              event.preventDefault();
              var dane = {
                  id : 0,
                  login : $("#addLogin").val(),
                  password : $("#addPassword").val()
              };
              console.log(dane);
              $.ajax({
                 type: "POST",
                 contentType:"application/json; charset=utf-8",
                 //dataType: "json",
                 data: JSON.stringify(dane),
                 url: "${pageContext.request.contextPath}/admin/manage_users/add_user",
                 success: function(response) {
                     $('#addUser').modal('hide');
                     $('#table_id').DataTable().ajax.reload();
                     
                 },
                         error: function(err) {
                             console.log("blad "+err);
                         }
              });
              
          });
        });
    </script>
    <body>
            
        <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <a class="navbar-brand" href="../index">Home</a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav">
                <li class="nav-item active">
                    <a class="nav-link" href="user">Strefa pracownika<span class="sr-only">(current)</span></a>
                </li>
                <c:if test="${pageContext.request.isUserInRole('Administrator')}">
                <li class="nav-item">
                    <a class="nav-link" href="${pageContext.request.contextPath}/admin">Panel Administratora</a>
                </li>    
                </c:if>
                <li class="nav-item active">
                    <a class="nav-link" href="admin/manage_users">Zarzadzaj uzytkownikami</a>
                </li>
                 <li class="nav-item">
                    <a class="nav-link" href="user/wizyty">Wizyty</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="patient">Portal pacjenta</a>
                </li>
                
                
                <li class="nav-item">
                    <a class="nav-link" href="<c:url value='/j_spring_security_logout'></c:url>" tabindex="-1">Wyloguj się</a>
                </li>
            </ul>
  </div>
                
</nav>
                 <!--Okienko dodawania-->
        <div class="container">
            <div class="modal fade" id="addUser" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header text-center">
                            <h4 class="modal-title">Dodaj Użytkownika</h4>
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                            
                        </div>
                        <div class="modal-body mx-3">
                            <form id="addUserForm"  accept-charset="UTF-8">    
                                
                                <input id="addId" type="hidden" name="id">
                                <div class="md-form mb-4">
                                <label for="addLogin" class="col-form-label">Podaj Login:</label>
                                <br>
                                <input id="addLogin" type="text" name="login" class="form-control">
                                </div>
                                <div class="md-form mb-4">
                                <label for="addPassword" class="col-form-label">Podaj haslo:</label>
                                <br>
                                
                                <input id="addPassword" type="password" name="password" class="form-control">
                                
                               </div>
                                
                                <br>
                                <input class="btn btn-default" type="submit" value="Dodaj">
                            </form>
                            </div>
                            <div class="modal-footer">
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <c:if test="${pageContext.request.userPrincipal.name != null}">
            <p>Witaj ${pageContext.request.userPrincipal.name}</p></c:if>
            <h1>Welcome to ${message}</h1>
                    <p>All users list:</p>
                    <a class="btn btn-primary" id="addUserBtn" action="" href="#" role="button">Dodaj użytkownika</a>
                    <div>
                        <table id="table_id" class="display">
                            <thead>
                                <tr>
                                    <th>Id</th>
                                    <th>Login</th>
                                    <th>Aktywny</th>
                                    
                                    <th>Edytuj</th>
                                    <th>Usuń</th>                                 
                                </tr>
                            </thead>
                        </table>
                    </div>
    </body>
    
</html>
