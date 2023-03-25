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
        <script>
//                    get.style.background = "rgb(243, 235, 235)";
//        document.getElementById(id).style.background = "#df0e62";
            $(document).ready(function(){
            $("#CT1").click(function(){
            $(".CT1").css("display", "block");
            $("#myDiv_2").css("display", "block");
            $("#myDiv_3").css("display", "none");
            $("#myDiv_4").css("display", "none");
            $("#myDiv_5").css("display", "none");
            $("#CT1").css("background", "#df0e62");
            $("#CT2").css("background", "rgb(243, 235, 235)");
            $()
            });
            $("#CT2").click(function(){
            $("#myDiv").css("display", "none");
            $("#myDiv_2").css("display", "none");
            $("#myDiv_3").css("display", "block");
            $("#myDiv_4").css("display", "none");
            $("#myDiv_5").css("display", "none");
            $("#CT2").css("background", "#df0e62");
            $("#CT1").css("background", "rgb(243, 235, 235)");
            });
            $(".carousel-cell .city_name").on('click', function () {
            var id = $(this).parent().find('#cityId').val();
            $("#get_cityId #id").val(id);
            });
            });
        </script>
    </head>

    <body>
        <header id="site-header" class="w3l-header fixed-top">

            <!--/nav-->
            <nav class="navbar navbar-expand-lg navbar-light fill px-lg-0 py-0 px-3">
                <div class="container">
                    <h1><a class="navbar-brand" href="home.jsp"><span class="fa fa-play icon-log" aria-hidden="true"></span>
                            MyShowz </a></h1>

                    <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    </div>

                    <div class="Login_SignUp" id="login_s">
                        <!-- style="font-size: 2rem ; display: inline-block; position: relative;" -->
                        <!-- <li class="nav-item"> -->
                        <a class="nav-link" href="sign_in.jsp"><i class="fa fa-user-circle-o"></i></a>
                        <!-- </li> -->
                    </div>
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
                                <li id="step1" class="${checkStep1?"active":"not_active"}">Cinema and city ${checkStep1?"active":"not_active"}</li>
                                <li id="step2" class="${checkStep2?"active":"not_active"}">Show timing selection ${checkStep2?"active":"not_active"}</li>
                                <li id="step3" class="not_active">Seat Selection</li>
                                <li id="step4" class="not_active">Payment</li>
                                <!--              <li id="step5" class="not_active">E-Ticket</li>-->
                            </ul>
                            <br>
                            <fieldset>    
                                <div id="screen-select-div">
                                    <h2>City And Cinema Selection</h2>
                                    <!--<div class="carousel carousel-nav" data-flickity='{"contain": true, "pageDots": false }'>-->
                                    <div class="carousel carousel-nav" >
                                        <c:forEach items="${listCity}" var="c">
                                            <div class="carousel-cell" id="${c.getId()}">
                                                <div class="date-numeric" id="get_cityId"></div>
                                                <a href="ticket_booking?userId=${userId}&movieId=${movieId}&cityId=${c.getId()}">${c.getName()}</a>
                                                <input type="hidden" name="" id ="cityId" value="${c.getId()}">
                                            </div>
                                        </c:forEach>
                                    </div>
                                </div>
                                <ul class="time-ul">
                                    <li class="time-li">
                                        <div class="time-btn CT1" id="myDiv" name="myDiv" >
                                            <c:forEach items="${listCinema}" var="m">
                                                <a href="ticket_booking?userId=${userId}&movieId=${movieId}&cityId=${cityId}&cinemaId=${m.getId()}" class="screen-time" name="next-step" onclick="placeFunction()">
                                                    ${m.getName()}
                                                </a>
                                            </c:forEach>
                                        </div>
                                    </li>
                                </ul>

                                <input id="screen-next-btn" type="button" name="next-step" class="next-step" value="Continue"/>
                            </fieldset>
                            <fieldset>
                                <div id="screen-select-div">
                                    <h2>Show time Selection</h2>
                                    <!--<div class="carousel carousel-nav" data-flickity='{"contain": true, "pageDots": false }'>-->
                                    <div class="carousel carousel-nav" >
                                        <div class="carousel-cell" id="d1" onclick="myFunction('d1')">
                                            <div class="date-numeric">13</div>
                                            <div class="date-day">Today</div>
                                        </div>
                                        <div class="carousel-cell" id="d2" onclick="myFunction('d2')">
                                            <div class="date-numeric">14</div>
                                            <div class="date-day">Tomorrow</div>
                                        </div>
                                        <div class="carousel-cell" id="d3" onclick="myFunction('d3')">
                                            <div class="date-numeric">15</div>
                                            <div class="date-day">Monday</div>
                                        </div>
                                        <div class="carousel-cell" id="d4" onclick="myFunction('d4')">
                                            <div class="date-numeric">16</div>
                                            <div class="date-day">Tuesday</div>
                                        </div>
                                        <div class="carousel-cell" id="d5" onclick="myFunction('d5')">
                                            <div class="date-numeric">17</div>
                                            <div class="date-day">Wednesday</div>
                                        </div>
                                        <div class="carousel-cell" id="d6" onclick="myFunction('d6')">
                                            <div class="date-numeric">18</div>
                                            <div class="date-day">Thursday</div>
                                        </div>
                                        <div class="carousel-cell" id="d7" onclick="myFunction('d7')">
                                            <div class="date-numeric">19</div>
                                            <div class="date-day">Friday</div>
                                        </div>
                                    </div>
                                    <ul class="time-ul">
                                        <li class="time-li">
                                            <div class="screens">
                                                Screen 1
                                            </div>
                                            <div class="time-btn">
                                                <a href="ticket_booking?userId=${userId}&movieId=${movieId}&cityId=${cityId}&cinemaId=${cinemaId}&startTime=1:05 PM" class="screen-time" onclick="timeFunction()">
                                                    1:05 PM
                                                </a>
                                                <a href="seat_sel?userId=${userId}&movieId=${movieId}&cityId=${cityId}&cinemaId=${cinemaId}&startTime=4: 00 PM" class="screen-time" onclick="timeFunction()">
                                                    4:00 PM
                                                </a>
                                                <a href="seat_sel?userId=${userId}&movieId=${movieId}&cityId=${cityId}&cinemaId=${cinemaId}&startTime=9: 00 PM" class="screen-time" onclick="timeFunction()">
                                                    9:00 PM
                                                </a>
                                            </div>
                                        </li>
                                        <li class="time-li">
                                            <div class="screens">
                                                Screen 2
                                            </div>
                                            <div class="time-btn">
                                                <a href="seat_sel?userId=${userId}&movieId=${movieId}&cityId=${cityId}&cinemaId=${cinemaId}&startTime=9:00AM" class="screen-time" onclick="timeFunction()">
                                                    9: 00 AM
                                                </a>
                                                <a href="seat_sel?userId=${userId}&movieId=${movieId}&cityId=${cityId}&cinemaId=${cinemaId}&startTime=11:00 AM" class="screen-time" onclick="timeFunction()">
                                                    11:00 AM
                                                </a>
                                                <a href="seat_sel?userId=${userId}&movieId=${movieId}&cityId=${cityId}&cinemaId=${cinemaId}&startTime=3:00 PM" class="screen-time" onclick="timeFunction()">
                                                    3:00 PM
                                                </a>
                                                <a href="seat_sel?userId=${userId}&movieId=${movieId}&cityId=${cityId}&cinemaId=${cinemaId}&startTime=7:00 PM" class="screen-time" onclick="timeFunction()">
                                                    7:00 PM
                                                </a>
                                                <a href="seat_sel?userId=${userId}&movieId=${movieId}&cityId=${cityId}&cinemaId=${cinemaId}&startTime=10:00 PM" class="screen-time" onclick="timeFunction()">
                                                    10:00 PM
                                                </a>
                                                <a href="seat_sel?userId=${userId}&movieId=${movieId}&cityId=${cityId}&cinemaId=${cinemaId}&startTime=11:00 PM" class="screen-time" onclick="timeFunction()">
                                                    11:00 PM
                                                </a>
                                            </div>
                                        </li>
                                        <li class="time-li">
                                            <div class="screens">
                                                Screen 3
                                            </div>
                                            <div class="time-btn">
                                                <a href="ticket_booking?userId=${userId}&movieId=${movieId}&cityId=${cityId}&cinemaId=${cinemaId}&startTime=9:05AM" class="screen-time next-step" name="next-step" onclick="timeFunction()">
                                                    9:05 AM
                                                </a>
                                                <a href="seat_sel?userId=${userId}&movieId=${movieId}&cityId=${cityId}&cinemaId=${cinemaId}&startTime=12:00 PM" class="screen-time" onclick="timeFunction()">
                                                    12:00 PM
                                                </a>
                                                <a href="seat_sel?userId=${userId}&movieId=${movieId}&cityId=${cityId}&cinemaId=${cinemaId}&startTime=1:00 PM" class="screen-time" onclick="timeFunction()">
                                                    1:00 PM
                                                </a>
                                                <a href="seat_sel?userId=${userId}&movieId=${movieId}&cityId=${cityId}&cinemaId=${cinemaId}&startTime=3:00 PM" class="screen-time" onclick="timeFunction()">
                                                    3:00 PM
                                                </a>
                                            </div>
                                        </li>

                                    </ul>
                                </div>
                                <input id="screen-next-btn-1" type="button" name="next-step" class="next-step" value="Continue Booking"
                                        />
                                <input type="button" name="previous-step" class="previous-step" value="Back" />
                            </fieldset>
                            <fieldset>

                                <div>
                                    <iframe id="seat-sel-iframe"
                                            style="  box-shadow: 0 14px 12px 0 var(--theme-border), 0 10px 50px 0 var(--theme-border); width: 800px; height: 550px; display: block; margin-left: auto; margin-right: auto;"
                                            src="seat_selection/seat_sel.html"></iframe>
                                </div>
                                <br>
                                <input type="button" name="next-step" class="next-step" value="Proceed to Payment" />
                                <input type="button" name="previous-step" class="previous-step" value="Back" />
                            </fieldset>
                            <fieldset>
                                <!-- Payment Page -->
                                <div id="payment_div">
                                    <div class="payment-row">
                                        <div class="col-75">
                                            <div class="payment-container">
                                                <div class="payment-row">
                                                    <div class="col-50">
                                                        <h3 id="payment-h3">Payment</h3>
                                                        <div class="payment-row payment">
                                                            <div class="col-50 payment">
                                                                <label for="card" class="method card">
                                                                    <div class="icon-container">
                                                                        <i class="fa fa-cc-visa" style="color: navy"></i>
                                                                        <i class="fa fa-cc-amex" style="color: blue"></i>
                                                                        <i class="fa fa-cc-mastercard" style="color: red"></i>
                                                                        <i class="fa fa-cc-discover" style="color: orange"></i>
                                                                    </div>
                                                                    <div class="radio-input">
                                                                        <input type="radio" id="card" />
                                                                        Pay RS.200.00 with credit card
                                                                    </div>
                                                                </label>
                                                            </div>
                                                            <div class="col-50 payment">
                                                                <label for="paypal" class="method paypal">
                                                                    <div class="icon-container">
                                                                        <i class="fa fa-paypal" style="color: navy"></i>
                                                                    </div>
                                                                    <div class="radio-input">
                                                                        <input id="paypal" type="radio" checked>
                                                                        Pay $30.00 with PayPal
                                                                    </div>
                                                                </label>
                                                            </div>
                                                        </div>

                                                        <div class="payment-row">
                                                            <div class="col-50">
                                                                <label for="cname">Cardholder's Name</label>
                                                                <input type="text" id="cname" name="cardname" placeholder="Firstname Lastname" required />
                                                            </div>
                                                            <div class="col-50">
                                                                <label for="ccnum">Credit card number</label>
                                                                <input type="text" id="ccnum" name="cardnumber" placeholder="xxxx-xxxx-xxxx-xxxx"
                                                                       required />
                                                            </div>
                                                        </div>
                                                        <div class="payment-row">
                                                            <div class="col-50">
                                                                <label for="expmonth">Exp Month</label>
                                                                <input type="text" id="expmonth" name="expmonth" placeholder="September" required />
                                                            </div>
                                                            <div class="col-50">
                                                                <div class="payment-row">
                                                                    <div class="col-50">
                                                                        <label for="expyear">Exp Year</label>
                                                                        <input type="text" id="expyear" name="expyear" placeholder="yyyy" required />
                                                                    </div>
                                                                    <div class="col-50">
                                                                        <label for="cvv">CVV</label>
                                                                        <input type="text" id="cvv" name="cvv" placeholder="xxx" required />
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <input type="button" name="next-step" class="next-step pay-btn" value="Confirm Payment" />
                                <input type="button" name="previous-step" class="cancel-pay-btn" value="Cancel Payment"
                                       onclick="location.href = 'home.jsp';" />
                            </fieldset>
                            <fieldset>
                                <h2>E-Ticket</h2>
                                <div class="ticket-body">
                                    <div class="ticket">
                                        <div class="holes-top"></div>
                                        <div class="title">
                                            <p class="cinema">MyShowz Entertainment</p>
                                            <p class="movie-title">Movie Name</p>
                                        </div>
                                        <div class="poster">
                                            <img src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/25240/only-god-forgives.jpg"
                                                 alt="Movie: Only God Forgives" />
                                        </div>
                                        <div class="info">
                                            <table class="info-table ticket-table">
                                                <tr>
                                                    <th>SCREEN</th>
                                                    <th>ROW</th>
                                                    <th>SEAT</th>
                                                </tr>
                                                <tr>
                                                    <td class="bigger">18</td>
                                                    <td class="bigger">H</td>
                                                    <td class="bigger">24</td>
                                                </tr>
                                            </table>
                                            <table class="info-table ticket-table">
                                                <tr>
                                                    <th>PRICE</th>
                                                    <th>DATE</th>
                                                    <th>TIME</th>
                                                </tr>
                                                <tr>
                                                    <td>RS.12.00</td>
                                                    <td>4/13/21</td>
                                                    <td>19:30</td>
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
    <script>
        let prevId = "CT1";
        window.onload = function () {
        document.getElementById("screen-next-btn").disabled = true;
        document.getElementById("screen-next-btn-1").disabled = true;
        };
        function timeFunction() {
        document.getElementById("screen-next-btn-1").disabled = false;
        }
        function placeFunction() {
        document.getElementById("screen-next-btn").disabled = false;
        }
        function myFunction(id) {
        document.getElementById(prevId).style.background = "rgb(243, 235, 235)";
        document.getElementById(id).style.background = "#df0e62";
        prevId = id;
        }
        function myF(id) {
        alert(id);
        }
        function myDivFunction(get) {
        var x = document.getElementById("myDiv");
        var y = document.getElementById("myDiv_1");
        var z = document.getElementById("myDiv_2");
        var a = document.getElementById("myDiv_3");
        var b = document.getElementById("myDiv_4");
        var c = document.getElementById("myDiv_5");
        var d = document.getElementById("myDiv_6");
        if (id === "CT1") {
        x.style.display = "block";
        z.style.display = "block";
        y.style.display = "none";
        a.style.display = "none";
        b.style.display = "none";
        c.style.display = "none";
        d.style.display = "none";
//                document.getElementById(id).style.background = "#df0e62";
        }
        if (id === "CT2") {
        x.style.display = "none";
        z.style.display = "none";
        y.style.display = "block";
        a.style.display = "none";
        b.style.display = "none";
        c.style.display = "none";
        d.style.display = "none";
        }
        if (id === "CT3") {
        x.style.display = "none";
        z.style.display = "none";
        y.style.display = "none";
        a.style.display = "block";
        b.style.display = "none";
        c.style.display = "none";
        d.style.display = "none";
        }
        if (id === "CT4") {
        x.style.display = "none";
        z.style.display = "none";
        y.style.display = "none";
        a.style.display = "none";
        b.style.display = "block";
        c.style.display = "none";
        d.style.display = "none";
        }
        if (id.equals("CT5") {
        x.style.display = "none";
        z.style.display = "none";
        y.style.display = "none";
        a.style.display = "none";
        b.style.display = "none";
        c.style.display = "block";
        d.style.display = "none";
        }
        if (id.equals("CT6") {
        x.style.display = "none";
        z.style.display = "none";
        y.style.display = "none";
        a.style.display = "none";
        b.style.display = "none";
        c.style.display = "none";
        d.style.display = "block";
        }
        get.style.background = "rgb(243, 235, 235)";
        document.getElementById(id).style.background = "#df0e62";
        prevId = id;
        }

    </script>

    <script src="https://npmcdn.com/flickity@2/dist/flickity.pkgd.js"></script>
    <script type="text/javascript" src='https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.bundle.min.js'>
    </script>
    <script type="text/javascript" src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>
    <script src="assets/js/theme-change.js"></script>

    <script type="text/javascript" src="assets/js/ticket-booking.js"></script>

</html>
