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
            var d = new Date();
            $(document).ready(function(){
            $("#CT1").click(function(){
            $(".CT1").css("display", "block");
            $("#myDiv_2").css("display", "block");
            $("#myDiv_3").css("display", "none");
            $("#myDiv_4").css("display", "none");
            $("#myDiv_5").css("display", "none");
            $("#CT1").css("background", "#df0e62");
            $("#CT2").css("background", "rgb(243, 235, 235)");
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
            console.log(d.getHours());
            if (d.getHours() > 9){
            $("#time_display").css("display", "none");
            $("#time_display_1").css("display", "none");
            } else {
            $("#time_display").css("display", "block");
            $("#time_display_1").css("display", "block");
            }

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
                    <!--                    <div class="Login_SignUp" id="login"
                                             style="font-size: 2rem ; display: inline-block; position: relative;">
                                             <li class="nav-item"> 
                                            <a class="nav-link" href="bill"><i class="fa fa-ticket"></i></a>
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
                                <li id="step2" class="active">Show timing selection</li>
                                <li id="step3" class="not_active">Seat Selection</li>
                                <li id="step4" class="not_active">Payment</li>
                            </ul>
                            <br>
                            <fieldset>
                                <div id="screen-select-div">
                                    <h2>Show time Selection</h2>
                                    <!--<div class="carousel carousel-nav" data-flickity='{"contain": true, "pageDots": false }'>-->
                                    <div class="carousel carousel-nav" >
                                        <div class="carousel-cell" id="d1" onclick="myFunction('d1')">
                                            <div class="date-numeric" id="current-time"></div>
                                            <a href="book_timing?userId=${userId}&movieId=${movieId}&cityId=${cityId}&cinemaId=${cinemaId}&roomId=Sc1&date=11/11/2022" id="time9" class="date-day">Today</a>
                                        </div>
                                        <div class="carousel-cell" id="d2" onclick="myFunction('d2')">
                                            <div class="date-numeric"id="current-time1"></div>
                                            <a href="book_timing?userId=${userId}&movieId=${movieId}&cityId=${cityId}&cinemaId=${cinemaId}&roomId=Sc1&date=12/11/2022" id="time9" class="date-day">Tomorrow</a>
                                        </div>
                                        <div class="carousel-cell" id="d3" onclick="myFunction('d3')">
                                            <div class="date-numeric" id="current-time2"></div>
                                            <a href="book_timing?userId=${userId}&movieId=${movieId}&cityId=${cityId}&cinemaId=${cinemaId}&roomId=Sc1&date=13/11/2022" id="time9" class="date-day">Sunday</a>
                                        </div>
                                        <div class="carousel-cell" id="d4" onclick="myFunction('d4')">
                                            <div class="date-numeric" id="current-time3"></div>
                                            <a href="book_timing?userId=${userId}&movieId=${movieId}&cityId=${cityId}&cinemaId=${cinemaId}&roomId=Sc1&date=14/11/2022" id="time9" class="date-day">Monday</a>
                                        </div>
                                        <div class="carousel-cell" id="d5" onclick="myFunction('d5')">
                                            <div class="date-numeric" id="current-time4"></div>
                                            <a href="book_timing?userId=${userId}&movieId=${movieId}&cityId=${cityId}&cinemaId=${cinemaId}&roomId=Sc1&date=15/11/2022" id="time9" class="date-day">Tuesday</a>
                                        </div>
                                        <div class="carousel-cell" id="d6" onclick="myFunction('d6')">
                                            <div class="date-numeric" id="current-time5"></div>
                                            <a href="book_timing?userId=${userId}&movieId=${movieId}&cityId=${cityId}&cinemaId=${cinemaId}&roomId=Sc1&date=16/11/2022" id="time9" class="date-day">Wednesday</a>
                                        </div>
                                        <div class="carousel-cell" id="d7" onclick="myFunction('d7')">
                                            <div class="date-numeric" id="current-time6"></div>
                                            <a href="book_timing?userId=${userId}&movieId=${movieId}&cityId=${cityId}&cinemaId=${cinemaId}&roomId=Sc1&date=17/11/2022" id="time9" class="date-day">Thursday</a>
                                        </div>
                                    </div>
                                    <ul class="time-ul">
                                        <li class="time-li">
                                            <div class="screens">
                                                Screen 1
                                            </div>
                                            <div class="time-btn">
                                                <a href="book_seat?userId=${userId}&movieId=${movieId}&cityId=${cityId}&cinemaId=${cinemaId}&roomId=Sc1&date=${date}&startTime=1:05PM" class="screen-time" onclick="timeFunction()"
                                                   <c:if test = "${hour >= 13 == true}">style="display: none"</c:if>>

                                                       1:00 PM
                                                   </a>
                                                   <a href="book_seat?userId=${userId}&movieId=${movieId}&cityId=${cityId}&cinemaId=${cinemaId}&roomId=Sc1&date=${date}&startTime=4:00PM" class="screen-time" onclick="timeFunction()"                                                  
                                                   <c:if test = "${hour >= 16 == true}">style="display: none"</c:if>>

                                                       4:00 PM
                                                   </a>
                                                   <a href="book_seat?userId=${userId}&movieId=${movieId}&cityId=${cityId}&cinemaId=${cinemaId}&roomId=Sc1&date=${date}&startTime=9:00PM" class="screen-time" onclick="timeFunction()"
                                                   <c:if test = "${hour >= 21 == true}">style="display: none"</c:if>>
                                                       
                                                       9:00 PM
                                                   </a>
                                                </div>
                                            </li>
                                            <li class="time-li">
                                                <div class="screens">
                                                    Screen 2
                                                </div>
                                                <div class="time-btn">
                                                    <a id="time_display"  href="book_seat?userId=${userId}&movieId=${movieId}&cityId=${cityId}&cinemaId=${cinemaId}&roomId=Sc2&date=${date}&startTime=9:00AM" class="screen-time" onclick="timeFunction()"
                                                   <c:if test = "${hour > 8 == true}">style="display: none"</c:if>
                                                       >9: 00 AM</a>
                                                   <a href="book_seat?userId=${userId}&movieId=${movieId}&cityId=${cityId}&cinemaId=${cinemaId}&roomId=Sc2&date=${date}&startTime=11:00AM" class="screen-time" onclick="timeFunction()"
                                                   <c:if test = "${hour >= 11 == true}">style="display: none"</c:if>>
                                                       11:00 AM
                                                   </a>
                                                   <a href="book_seat?userId=${userId}&movieId=${movieId}&cityId=${cityId}&cinemaId=${cinemaId}&roomId=Sc2&date=${date}&startTime=3:00PM" class="screen-time" onclick="timeFunction()"
                                                   <c:if test = "${hour >= 15 == true}">style="display: none"</c:if>>

                                                       3:00 PM
                                                   </a>
                                                   <a href="book_seat?userId=${userId}&movieId=${movieId}&cityId=${cityId}&cinemaId=${cinemaId}&roomId=Sc2&date=${date}&startTime=7:00PM" class="screen-time" onclick="timeFunction()"
                                                   <c:if test = "${hour >= 19 == true}">style="display: none"</c:if>>

                                                       7:00 PM
                                                   </a>
                                                   <a href="book_seat?userId=${userId}&movieId=${movieId}&cityId=${cityId}&cinemaId=${cinemaId}&roomId=Sc2&date=${date}&startTime=10:00PM" class="screen-time" onclick="timeFunction()"
                                                   <c:if test = "${hour >= 22 == true}">style="display: none"</c:if>>

                                                       10:00 PM
                                                   </a>
                                                   <a href="book_seat?userId=${userId}&movieId=${movieId}&cityId=${cityId}&cinemaId=${cinemaId}&roomId=Sc2&date=${date}&startTime=11:00PM" class="screen-time" onclick="timeFunction()"
                                                   <c:if test = "${hour >= 23 == true}">style="display: none"</c:if>>

                                                       11:00 PM
                                                   </a>
                                                </div>
                                            </li>
                                            <li class="time-li">
                                                <div class="screens">
                                                    Screen 3
                                                </div>
                                                <div class="time-btn">
                                                    <a id="time_display_1" href="book_seat?userId=${userId}&movieId=${movieId}&cityId=${cityId}&cinemaId=${cinemaId}&roomId=Sc3&date=${date}&startTime=9:05PM" class="screen-time" onclick="timeFunction()"
                                                   <c:if test = "${hour > 8 == true}">style="display: none"</c:if>>
                                                       9:00 AM
                                                   </a>
                                                   <a href="book_seat?userId=${userId}&movieId=${movieId}&cityId=${cityId}&cinemaId=${cinemaId}&roomId=Sc3&date=${date}&startTime=12:00PM" class="screen-time" onclick="timeFunction()"
                                                   <c:if test = "${hour >= 12 == true}">style="display: none"</c:if>>
                                                       
                                                       12:00 PM
                                                   </a>
                                                   <a href="book_seat?userId=${userId}&movieId=${movieId}&cityId=${cityId}&cinemaId=${cinemaId}&roomId=Sc3&date=${date}&startTime=1:00PM" class="screen-time" onclick="timeFunction()"
                                                   <c:if test = "${hour >= 13 == true}">style="display: none"</c:if>>

                                                       1:00 PM
                                                   </a>
                                                   <a href="book_seat?userId=${userId}&movieId=${movieId}&cityId=${cityId}&cinemaId=${cinemaId}&roomId=Sc3&date=${date}&startTime=3:00PM" class="screen-time" onclick="timeFunction()"
                                                   <c:if test = "${hour >= 15 == true}">style="display: none"</c:if>>

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

    <div id="current-time"></div>
    <script>
        var curDate = new Date();
        // Ngày hiện tại
        var curDay = curDate.getDate();
        // Tháng hiện tại
        var curMonth = curDate.getMonth() + 1;
        // Năm hiện tại
        var curYear = curDate.getFullYear();
        // Gán vào thẻ HTML
        document.getElementById('current-time').innerHTML = curDay + 0 + "/" + curMonth + "/" + curYear;
        document.getElementById('current-time1').innerHTML = curDay + 1 + "/" + curMonth + "/" + curYear;
        document.getElementById('current-time2').innerHTML = curDay + 2 + "/" + curMonth + "/" + curYear;
        document.getElementById('current-time3').innerHTML = curDay + 3 + "/" + curMonth + "/" + curYear;
        document.getElementById('current-time4').innerHTML = curDay + 4 + "/" + curMonth + "/" + curYear;
        document.getElementById('current-time5').innerHTML = curDay + 5 + "/" + curMonth + "/" + curYear;
        document.getElementById('current-time6').innerHTML = curDay + 6 + "/" + curMonth + "/" + curYear;
    </script>

    <script src="https://npmcdn.com/flickity@2/dist/flickity.pkgd.js"></script>
    <script type="text/javascript" src='https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.bundle.min.js'>
    </script>
    <script type="text/javascript" src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>
    <script src="assets/js/theme-change.js"></script>

    <script type="text/javascript" src="assets/js/ticket-booking.js"></script>

</html>
