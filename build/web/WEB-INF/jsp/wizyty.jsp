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
        
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet">
        <script src="http://ajax.cdnjs.com/ajax/libs/json2/20110223/json2.js"></script>

   </head>
    <!-- skrytpy -->
    <script>
        $(document).ready(function(){
            var dzien
            var godz;
           $('#table_id').DataTable({
               ajax: {
                   url: "${pageContext.request.contextPath}/user/wizyty/get_wizyty_json",
                   dataSrc: ""
               }, 
               "columns" : [
                  
                   {"data":"dataCzas",
                       "render" : function(data, type, row){
                           //return new Date(data).toISOString().slice(0, 19);
                           
                           godz = new Date(data).toLocaleTimeString();
                           dzien = new Date(data).toLocaleDateString();
                           console.log(dzien);
                           console.log(godz);
                           $('#dzien').text("Wizyty w dniu " + dzien);
                           //return new Date(data).toLocaleString()
                           return godz;
                           
                       }
                           
                    }, 
                    //{"data":"dataCzas"},
                   {"data":"pacjent"},
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
        <c:if test="${pageContext.request.userPrincipal.name != null}">
            <p>Witaj ${pageContext.request.userPrincipal.name}</p></c:if>
            <h1>Welcome to ${message}</h1>
                    <p id="dzien">All users list:</p>
                    <div>
                        <table id="table_id" class="display">
                            <thead>
                                <tr>
                                    <th>Data i Czas</th>
                                    <th>Pacjent</th>
                                    <th>Edytuj</th>
                                    <th>Usuń</th>                                 
                                </tr>
                            </thead>
                        </table>
                    </div>
    </body>
    
</html>
