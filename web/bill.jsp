<%-- 
    Document   : ticket-booking
    Created on : Nov 6, 2022, 5:20:59 PM
    Author     : LEGION 5
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Ticket Booking</title>
        <link rel="stylesheet" type="text/css" href="assets/css/style-starter.css">
        <link rel="stylesheet" href="https://npmcdn.com/flickity@2/dist/flickity.css">
        <link rel="stylesheet" type="text/css" href="assets/css/progress.css">

        <link rel="stylesheet" type="text/css" href="assets/css/ticket-booking.css">
        <script src="https://code.jquery.com/jquery-latest.js"></script>
        <!-- ..............For progress-bar............... -->
        <link rel="stylesheet" type="text/css" href="assets/css/e-ticket.css">

        <link rel="stylesheet" type="text/css" href="assets/css/payment.css" />
        <link href="https://fonts.googleapis.com/css?family=Yanone+Kaffeesatz:400,700" rel="stylesheet">

           
    </head>

    <body>
        <header id="site-header" class="w3l-header fixed-top">

            <!--/nav-->
            <nav class="navbar navbar-expand-lg navbar-light fill px-lg-0 py-0 px-3">
                <div class="container">
                    <h1><a class="navbar-brand" href="index.html"><span class="fa fa-play icon-log" aria-hidden="true"></span>
                            MyShowz </a></h1>

                    <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    </div>

                    <div class="Login_SignUp" id="login_s">
                        <!-- style="font-size: 2rem ; display: inline-block; position: relative;" -->
                        <!-- <li class="nav-item"> -->
                        <a class="nav-link" href="sign_in.jsp"><i class="fa fa-user-circle-o"></i></a>
                        <!-- </li> -->
                    </div>
<!--                    <div class="Login_SignUp" id="login"
                             style="font-size: 2rem ; display: inline-block; position: relative;">
                             <li class="nav-item"> 
                            <a class="nav-link" <c:if test= "${sessionScope.customer != null}">href="bill.jsp"</c:if> <c:if test= "${sessionScope.customer == null}">href="no_ticket.jsp"</c:if> ><i class="fa fa-ticket"></i></a>
                             </li> 
                        </div>-->
                    <!-- toggle switch for light and dark theme -->
                    <div class="mobile-position">
                        <nav class="navigation">
                            <div class="theme-switch-wrapper">
                                <label class="theme-switch" for="checkbox">
                                    <input type="checkbox" id="checkbox">
                                    <div class="mode-container">
                                        <i class="gg-sun"></i>
                                        <i class="gg-moon"></i>
                                    </div>
                                </label>
                            </div>
                        </nav>
                    </div>
                </div>
            </nav>
        </header>

        <div class="container" id="progress-container-id">
            <div class="row">
                <div class="col">
                    <div class="px-0 pt-4 pb-0 mt-3 mb-3">
                        <form id="form">
                            <ul id="progressbar" class="progressbar-class">
                                <li id="step1" class="not_active">Cinema and city</li>
                                <li id="step2" class="not_active">Show timing selection</li>
                                <li id="step3" class="not_active">Seat Selection</li>
                                <li id="step4" class="not_active">Payment</li>
                            </ul>
                            <br>
                            <fieldset>
                                <h2>E-Ticket</h2>
                                <div class="ticket-body">
                                    <div class="ticket">
                                        <div class="holes-top"></div>
                                        <div class="title">
                                            <p class="cinema">YOUR MOVIE: </p>
                                            <p class="movie-title">${movieName}</p>
                                        </div>
                                        <div class="poster">
                                            <img src="assets/images/${movieImg}"
                                                 alt="Movie: Only God Forgives" />
                                        </div>
                                        <div class="info">
                                            <table class="info-table ticket-table">
                                                <tr>
                                                    <th>CINEMA</th>
                                                    <th>ROOM</th>
                                                    <th>SEAT</th>
                                                </tr>
                                                <tr>
                                                    <td class="bigger">${cinemaName}</td>
                                                    <td class="bigger">${roomName}</td>
                                                    <td class="bigger">${seatName}</td>
                                                </tr>
                                            </table>
                                            <table class="info-table ticket-table">
                                                <tr>
                                                    <th>DATE</th>
                                                    <th>TIME</th>
                                                </tr>
                                                <tr>
                                                    <td>${date}</td>
                                                    <td>${startTime}</td>
                                                </tr>
                                            </table>
                                        </div>
                                        <div class="holes-lower"></div>
                                        <div class="serial">
                                            <table class="barcode ticket-table">
                                                <tr>
                                                    <td style="background-color:black;"></td>
                                                    <td style="background-color:black;"></td>
                                                    <td style="background-color:white;"></td>
                                                    <td style="background-color:black;"></td>
                                                    <td style="background-color:white;"></td>
                                                    <td style="background-color:white;"></td>
                                                    <td style="background-color:black;"></td>
                                                    <td style="background-color:black;"></td>
                                                    <td style="background-color:white;"></td>
                                                    <td style="background-color:black;"></td>
                                                    <td style="background-color:white;"></td>
                                                    <td style="background-color:white;"></td>
                                                    <td style="background-color:black;"></td>
                                                    <td style="background-color:white;"></td>
                                                    <td style="background-color:black;"></td>
                                                    <td style="background-color:white;"></td>
                                                    <td style="background-color:white;"></td>
                                                    <td style="background-color:black;"></td>
                                                    <td style="background-color:black;"></td>
                                                    <td style="background-color:white;"></td>
                                                    <td style="background-color:black;"></td>
                                                    <td style="background-color:black;"></td>
                                                    <td style="background-color:white;"></td>
                                                    <td style="background-color:white;"></td>
                                                    <td style="background-color:black;"></td>
                                                    <td style="background-color:white;"></td>
                                                    <td style="background-color:white;"></td>
                                                    <td style="background-color:black;"></td>
                                                    <td style="background-color:white;"></td>
                                                    <td style="background-color:black;"></td>
                                                    <td style="background-color:white;"></td>
                                                    <td style="background-color:white;"></td>
                                                    <td style="background-color:black;"></td>
                                                    <td style="background-color:white;"></td>
                                                    <td style="background-color:black;"></td>
                                                    <td style="background-color:black;"></td>
                                                    <td style="background-color:white;"></td>
                                                    <td style="background-color:white;"></td>
                                                    <td style="background-color:black;"></td>
                                                    <td style="background-color:white;"></td>
                                                    <td style="background-color:black;"></td>
                                                    <td style="background-color:white;"></td>
                                                    <td style="background-color:white;"></td>
                                                    <td style="background-color:black;"></td>
                                                    <td style="background-color:white;"></td>
                                                    <td style="background-color:black;"></td>
                                                    <td style="background-color:black;"></td>
                                                    <td style="background-color:white;"></td>
                                                    <td style="background-color:white;"></td>
                                                    <td style="background-color:black;"></td>
                                                    <td style="background-color:black;"></td>
                                                    <td style="background-color:black;"></td>
                                                    <td style="background-color:black;"></td>
                                                    <td style="background-color:white;"></td>
                                                    <td style="background-color:black;"></td>
                                                    <td style="background-color:white;"></td>
                                                    <td style="background-color:black;"></td>
                                                    <td style="background-color:black;"></td>
                                                    <td style="background-color:white;"></td>
                                                    <td style="background-color:white;"></td>
                                                    <td style="background-color:black;"></td>
                                                    <td style="background-color:white;"></td>
                                                    <td style="background-color:black;"></td>
                                                    <td style="background-color:white;"></td>
                                                    <td style="background-color:black;"></td>
                                                    <td style="background-color:black;"></td>
                                                    <td style="background-color:white;"></td>
                                                    <td style="background-color:black;"></td>
                                                    <td style="background-color:black;"></td>
                                                    <td style="background-color:white;"></td>
                                                    <td style="background-color:white;"></td>
                                                    <td style="background-color:black;"></td>
                                                    <td style="background-color:white;"></td>
                                                    <td style="background-color:white;"></td>
                                                    <td style="background-color:white;"></td>
                                                    <td style="background-color:black;"></td>
                                                    <td style="background-color:white;"></td>
                                                    <td style="background-color:black;"></td>
                                                    <td style="background-color:black;"></td>
                                                    <td style="background-color:black;"></td>
                                                    <td style="background-color:white;"></td>
                                                    <td style="background-color:black;"></td>
                                                    <td style="background-color:white;"></td>
                                                    <td style="background-color:black;"></td>
                                                    <td style="background-color:white;"></td>
                                                    <td style="background-color:white;"></td>
                                                    <td style="background-color:black;"></td>
                                                    <td style="background-color:black;"></td>
                                                    <td style="background-color:black;"></td>
                                                    <td style="background-color:white;"></td>
                                                    <td style="background-color:black;"></td>
                                                    <td style="background-color:white;"></td>
                                                    <td style="background-color:black;"></td>
                                                    <td style="background-color:white;"></td>
                                                    <td style="background-color:black;"></td>
                                                    <td style="background-color:black;"></td>
                                                    <td style="background-color:white;"></td>
                                                    <td style="background-color:black;"></td>
                                                    <td style="background-color:white;"></td>
                                                    <td style="background-color:black;"></td>
                                                    <td style="background-color:white;"></td>
                                                    <td style="background-color:white;"></td>
                                                    <td style="background-color:white;"></td>
                                                    <td style="background-color:black;"></td>
                                                    <td style="background-color:white;"></td>
                                                    <td style="background-color:black;"></td>
                                                    <td style="background-color:black;"></td>
                                                    <td style="background-color:white;"></td>
                                                    <td style="background-color:black;"></td>
                                                    <td style="background-color:white;"></td>
                                                    <td style="background-color:white;"></td>
                                                    <td style="background-color:white;"></td>
                                                    <td style="background-color:black;"></td>
                                                    <td style="background-color:white;"></td>
                                                    <td style="background-color:black;"></td>
                                                    <td style="background-color:white;"></td>
                                                </tr>
                                            </table>
                                            <table class="numbers ticket-table">
                                                <tr>
                                                    <td>9</td>
                                                    <td>1</td>
                                                    <td>7</td>
                                                    <td>3</td>
                                                    <td>7</td>
                                                    <td>5</td>
                                                    <td>4</td>
                                                    <td>4</td>
                                                    <td>4</td>
                                                    <td>5</td>
                                                    <td>4</td>
                                                    <td>1</td>
                                                    <td>4</td>
                                                    <td>7</td>
                                                    <td>8</td>
                                                    <td>7</td>
                                                    <td>3</td>
                                                    <td>4</td>
                                                    <td>1</td>
                                                    <td>4</td>
                                                    <td>5</td>
                                                    <td>2</td>
                                                </tr>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                                <input type="button" name="previous-step" class="home-page-btn" value="Browse to Home Page"
                                       onclick="location.href = 'home.jsp';" />
                            </fieldset>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </body>
    <script src="https://npmcdn.com/flickity@2/dist/flickity.pkgd.js"></script>
    <script type="text/javascript" src='https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.bundle.min.js'>
    </script>
    <script type="text/javascript" src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>
    <script src="assets/js/theme-change.js"></script>

    <script type="text/javascript" src="assets/js/ticket-booking.js"></script>

</html>
