

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%

    Integer requests = (Integer) application.getAttribute("requests");
    if (requests == null) {
        requests = 1;
    } else {
        requests++;
    }

    application.setAttribute("requests", requests);

    session.setAttribute("isSessionCount", false);
    Boolean isCountSession = (Boolean) session.getAttribute("isSessionCount");

    Integer sessions = (Integer) application.getAttribute("sessions");
    if (sessions == null) {
        sessions = 1;
    } else if (!isCountSession) {
        sessions++;
        session.setAttribute("isSessionCount", true);
    }

    Integer users = (Integer) application.getAttribute("users");
    if (session.isNew()) {
        if (users == null) {
            users = 1;
        } else {
            users++;
        }
        application.setAttribute("users", users);
    }

%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <title>Admin | Dashboard</title>
    </head>
    <body class="bg-light">
        <div class="container text-center mt-5">
            <div class="row justify-content-center">
                <div class="col-md-6">

                    <div class="card shadow-lg p-3 bg-white rounded mb-5">
                        <div class="card-body">
                            <h3 class="card-title text-sucess">Users:</h3>
                            <h1 class="display-4"> <%= users %></h1>
                        </div>
                    </div>

                    <div class="card shadow-lg p-3 bg-white rounded">
                        <div class="card-body">
                            <h3 class="card-title text-sucess">Requests:</h3>
                            <h1 class="display-4"> <%= requests%></h1>
                        </div>
                    </div>
                </div>
            </div>            
        </div>       
    </body>
</html>
