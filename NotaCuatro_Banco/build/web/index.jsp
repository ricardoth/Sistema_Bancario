<%-- 
    Document   : index.jsp
    Created on : 18-11-2017, 0:38:30
    Author     : ricar
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
    <head>
        <title>Banco Masones - Su Mejor Inversión</title>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css" integrity="sha384-PsH8R72JQ3SOdhVi3uxftmaW6Vc51MKb0q5P2rRUpPvrszuE4W1povHYgTpBfshb" crossorigin="anonymous">
    </head>
    <body>
        <!-- Optional JavaScript -->
        <!-- jQuery first, then Popper.js, then Bootstrap JS -->
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.3/umd/popper.min.js" integrity="sha384-vFJXuSJphROIrBnz7yo7oB41mKfc8JzQZiCq4NCceLEaO4IHwicKwpJf9c9IpFgh" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js" integrity="sha384-alpBpkh1PFOepccYVYDB4do5UnbKysX5WZXm3XxPqe5iKTfUKjNkCk9SaVuEZflJ" crossorigin="anonymous"></script>

        <div class="pos-f-t">
            <div class="collapse" id="navbarToggleExternalContent">
                <div class="bg-dark p-4">
                    <h4 class="text-white">Login</h4>
                    <form action="iniciarSesion.do" method="POST">
                        <div class="form-row align-items-center">
                            <div class="col-sm-3">
                                <label class="sr-only" for="inlineFormInputName">Rut</label>
                                <input type="text" class="form-control mb-2 mb-sm-0" id="inlineFormInputName" name="txtRut" placeholder="Rut:">
                            </div>
                            <div class="col-sm-3">
                                <label class="sr-only" for="inlineFormInputGroupUsername">Username</label>
                                <div class="input-group mb-2 mb-sm-0">
                                    <div class="input-group-addon"></div>
                                    <input type="password" class="form-control" id="inlineFormInputGroupUsername" name="txtPass" placeholder="Pass:">
                                </div>
                            </div>
                            <div class="col-auto">
                                <button type="submit" name="btnIniciar" class="btn btn-primary">Iniciar Sesión</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
            <nav class="navbar navbar-dark bg-dark">
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarToggleExternalContent" aria-controls="navbarToggleExternalContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
            </nav>
        </div>
        <!-- Cuerpo -->
        <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
            <ol class="carousel-indicators">
                <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
                <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
                <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
            </ol>
            <div class="carousel-inner">
                <div class="carousel-item active">
                    <img class="d-block w-100" src="http://blog.gestores.net/wp-content/uploads/2013/09/credit-card-1104961_1280-800x300.jpg" alt="First slide">
                    <div class="jumbotron">
                        <h1 class="display-3">Banco Masones</h1>
                        <p class="lead">Historia</p>
                        <hr class="my-4">
                        <p>En 1938 se funda el Banco Masones por Mauricio Israel y Rafael Garay, 
                            los cuales al tiempo sacaron un Magister y dos Post-Grados en Economía Mundial</p>
                        <br>
                        <p>Al poco tiempo se perdieron los fondos de inversión, para ello tenemos a usted que nos ayudará a salir de DICOM</p>
                        <p class="lead">
                            <a class="btn btn-primary btn-lg" href="https://es.wikipedia.org/wiki/Francmasoner%C3%ADa" role="button">Learn more</a>
                        </p>
                    </div>
                </div>
                <div class="carousel-item">
                    <img class="d-block w-100" src="http://blog.gestores.net/wp-content/uploads/2016/10/partnership-526413_960_720-800x300.jpg" alt="Second slide">
                    <div class="jumbotron">
                        <h1 class="display-3">Sistema de Pagos</h1>
                        <p class="lead">Giros y Depositos</p>
                        <hr class="my-4">
                        <p>Realize sus operaciones fácilmente, Tales como giros y depositos sin salir de su vivienda</p>
                        <p class="lead">
                            <a class="btn btn-primary btn-lg" href="https://es.wikipedia.org/wiki/Francmasoner%C3%ADa" role="button">Learn more</a>
                        </p>
                    </div>
                </div>
                
            </div>
            <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="sr-only">Previous</span>
            </a>
            <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="sr-only">Next</span>
            </a>
        </div>

    </body>
</html>