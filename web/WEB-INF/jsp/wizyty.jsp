<%-- 
    Document   : wizyty
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
            var dzien
            var godz;
          var table = $('#table_id').DataTable({
               ajax: {
                   url: "${pageContext.request.contextPath}/user/wizyty/get_wizyty_json",
                   dataSrc: ""
               }, 
               "columns" : [
                  
                  /** {"data":"dataWizyta",
                       "render" : function(data, type, full){
                           //return new Date(data).toISOString().slice(0, 19);
                           
                           godz = new Date(data).toLocaleTimeString();
                           dzien = new Date(data).toLocaleDateString();
                           console.log(dzien);
                           console.log(godz);
                           $('#dzien').text("Wizyty w dniu " + dzien);
                           //return new Date(data).toLocaleString()
                           return godz;
                           
                       }
                           
                    },*/
                    {"data":"dataWizyta"},
                    {"data":"czasWizyta"},
                    //{"data":"dataCzas"},
                   {"data":"pacjent"},
                   {
                     "data":"edit",
                     "render" : function(data, type, full, meta) {
                         return full.id;
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
           
           $('#dodajWizyta').click(function(){
            $('#addWizyta').modal();
           });
           
           $('#edytujWizyta').click(function(){
              $('#editWizyta').modal();
           });
           $(function(){
               $('#addData').datepicker({
                   dateFormat: 'yy-mm-dd',
                   beforeShowDay: function(date){ 
                       if(date.getDay() == 6 || date.getDay() == 0){
                           return [false, ""];
                       } else {
                           return [true, ""];
                       }
                           
                   }
                   
               });
              
           });
           $('#addCzas').click(function(){
               var test = $('#addCzas option:selected').text();
               console.log(test);
           });
          $("addform").submit(function(event){
              event.preventDefault();
              var test = $('#addCzas').val();
              alert(test);
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
                <li class="nav-item active">
                    <a class="nav-link" href="admin/manage_users">Zarzadzaj uzytkownikami</a>
                </li>
                </c:if>
                
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
            <div class="modal fade" id="addWizyta" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header text-center">
                            <h4 class="modal-title">Dodaj Wizytę</h4>
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                            
                        </div>
                        <div class="modal-body mx-3">
                            <form id="addform" method="POST" accept-charset="UTF-8">    
                                
                                <input id="addId" type="hidden" path="id" name="id">
                                <div class="md-form mb-4">
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
                            </form>
                            </div>
                            <div class="modal-footer">
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!--Okienko edytowania-->
        <div class="container">
            <div class="modal fade" id="editWizyta" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header text-center">
                            <h4 class="modal-title">Edytowanie Wizyty</h4>
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                            
                        </div>
                        <div class="modal-body mx-3">
                            <form id="editform" method="POST" accept-charset="UTF-8">    
                                
                                <input id="editId" type="hidden" path="id" name="id">
                                <div class="md-form mb-4">
                                <label for="editDataCzas" class="col-form-label">Czas wizyty:</label>
                                <br>
                                <input id="editDataCzas" type="text" name="dataCzas">
                                </div>
                                <div class="md-form mb-4">
                                <label for="pacjent" class="col-form-label">Pacjent:</label>
                                <br>
                                <input id="pacjent" type="text" name="pacjent">
                                </div>
                                <br>
                                <input class="btn btn-default" type="submit" value="addWizyta">
                            </form>
                            </div>
                            <div class="modal-footer">
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!--Okienko usuwania-->
        <div class="container">
            <div class="modal fade" id="addWizyta" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header text-center">
                            <h4 class="modal-title">Dodaj Wizytę</h4>
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                            
                        </div>
                        <div class="modal-body mx-3">
                            <form id="addform" method="POST" accept-charset="UTF-8">    
                                
                                <input id="addId" type="hidden" path="id" name="id">
                                <div class="md-form mb-4">
                                <label for="addDataCzas" class="col-form-label">Dodaj godzinę:</label>
                                <br>
                                <input id="addDataCzas" type="text" name="dataCzas">
                                </div>
                                <div class="md-form mb-4">
                                <label for="pacjent" class="col-form-label">Podaj nazwisko i imię pacjenta:</label>
                                <br>
                                <input id="pacjent" type="text" name="pacjent">
                                </div>
                                <br>
                                <input class="btn btn-default" type="submit" value="addWizyta">
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
                   
                    <p id="dzien">All users list:</p>
                    <a class="btn btn-primary" id="dodajWizyta" action="" href="#" role="button">Dodaj wizytę</a>
                    <div>
                        <table id="table_id" class="display">
                            <thead>
                                <tr>
                                    <th>Data</th>
                                    <th>Czas</th>
                                    <th>Pacjent</th>
                                    <th>Edytuj</th>
                                    <th>Usuń</th>                                 
                                </tr>
                            </thead>
                        </table>
                    </div>
    </body>
    
</html>
