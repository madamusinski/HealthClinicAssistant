<%-- 
    Document   : email_to_patient
    Created on : 2019-09-11, 11:32:14
    Author     : maadamusinski
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>${title}</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
 
    </head>
    <body>
        <h1>${message}</h1>
         <!--Formularz wysylania maila do pacjenta-->
         <div class="container">
             <div class="row">
                <div class="col-sm">
                    
                </div>
                <div class="col-sm">${messageForm}</h3>
                </div>
                <div class="col-sm">
                    
                </div>
            </div>
            <div class="row">
                <div class="col-sm">
                    
                </div>
                <div class="col-sm">
                    <form id="sendMail" method="POST" action="send_email" accept-charset="UTF-8">                                   
                                <div class="md-form mb-4">
                                <label for="mailTo" class="col-form-label">Email do:</label>
                                <br>
                                <input id="mailTo" type="text" name="mailTo" size="65" class="form-control">
                                </div>
                                <div class="md-form mb-4">
                                <label for="mailSubject" class="col-form-label">Temat:</label>
                                <br>
                                <input id="mailSubject" type="text" name="mailSubject" size="65" class="form-control">                                    
                                </div>
                             
                                <div class="md-form mb-4">
                                <label for="mailMessage" class="col-form-label">Wiadomość:</label>
                                <br>
                                <textarea id="mailMessage" cols="50" rows="10" name="mailMessage"></textarea>
                                </div>
                                <input class="btn btn-primary" type="submit" value="Send">
                            </form>
                </div>
                <div class="col-sm">
                    
                </div>
            </div>
        </div>
    </body>
</html>
