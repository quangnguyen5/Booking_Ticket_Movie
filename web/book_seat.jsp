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
        <link href="seat_selection/css/style.css" rel="stylesheet" type="text/css" media="all" />
        <!--<script src="seat_selection/js/jquery-1.11.0.min.js"></script>-->
        <script src="seat_selection/js/jquery.seat-charts.js"></script>
        <link rel="stylesheet" type="text/css" href="assets/css/ticket-booking.css">
        <script src="https://code.jquery.com/jquery-latest.js"></script>
        ..............For progress-bar............... 
        <link rel="stylesheet" type="text/css" href="assets/css/e-ticket.css">

        <link rel="stylesheet" type="text/css" href="assets/css/payment.css" />
        <link href="https://fonts.googleapis.com/css?family=Yanone+Kaffeesatz:400,700" rel="stylesheet">
        <title>Movie Ticket Booking Widget Flat Responsive Widget Template :: w3layouts</title>
        <!-- for-mobile-apps -->
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
        <!--        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />-->
        <meta name="keywords"
              content="Movie Ticket Booking Widget Responsive, Login form web template, Sign up Web Templates, Flat Web Templates, Login signup Responsive web template, Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />
        <link href="seat_selection/css/style.css" rel="stylesheet" type="text/css" media="all" />
        <script src="seat_selection/js/jquery-1.11.0.min.js"></script>
        <script src="seat_selection/js/jquery.seat-charts.js"></script>

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
                            <form id="form" action="book_seat" method="post">
                                <ul id="progressbar" class="progressbar-class">
                                    <li id="step1" class="not_active">Cinema and city</li>
                                    <li id="step2" class="not_active">Show timing selection</li>
                                    <li id="step3" class="active">Seat Selection</li>
                                    <li id="step4" class="not_active">Payment</li>
                                </ul>
                                <br>
                                <div>
                                    <div id="seat-sel-iframe"
                                         style="width: 800px; height: 550px; display: block; margin-left: auto; margin-right: auto;"
                                         >
                                        <div class="content">
                                            <h2>Seat Booking</h2>
                                            <div class="main">
                                                <div class="demo">
                                                    <div id="seat-map">
                                                        <div class="front">SCREEN</div>					
                                                    </div>
                                                    <div class="booking-details">
                                                        <table style="color: #df0e62">
                                                            <tr>
                                                                <td class="book-left">Movie :</td>
                                                                    <td>${movieName}</td>
                                                        </tr>
                                                        <tr>
                                                            <td>Time :</td>
                                                            <td>${startTime}</td>
                                                        </tr>
                                                        <tr>
                                                            <td>Tickets:</td>
                                                            <td><span id="counter">0</span></td>
                                                        </tr>
                                                        <tr>
                                                            <td>Total :</td>
                                                            <td> <b><span id="total">0</span></b></td>
                                                        </tr>
                                                    </table>
                                                    <!--
                                                    <!--                                                    <ul class="book-left" style="">
                                                                                                            <li>Movie</li>
                                                                                                            <li>Time</li>
                                                                                                            <li>Tickets</li>
                                                                                                            <li>Total</li>
                                                                                                            <li>Selected Seats</li>
                                                                                                        </ul>
                                                                                                        <ul class="book-right">
                                                                                                            <li>: ${movieName}</li>
                                                                                                            <li>: ${startTime}</li>
                                                                                                            <li>: <span id="counter">0</span></li>
                                                                                                            <li>: <b><i>RS.</i><span id="total">0</span></b></li>
                                                                                                        </ul>-->

                                                    <div class="clear"></div>
                                                    <select class="form-control" style="display:none;" id="selected-seats" name="seat" multiple="multiple">
                                                    </select>

                                                    <input type="hidden" name="userId" value="${userId}"/>
                                                    <input type="hidden" name="movieId" value="${movieId}"/>
                                                    <input type="hidden" name="cityId" value="${cityId}"/>
                                                    <input type="hidden" name="cinemaId" value="${cinemaId}"/>
                                                    <input type="hidden" name="roomId" value="${roomId}"/>
                                                    <input type="hidden" name="date" value="${date}"/>
                                                    <input type="hidden" name="startTime" value="${startTime}"/>

                                                    <div id="legend"></div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <input type="submit" name="next-step" class="next-step" value="Proceed to Payment" />
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <script type="text/javascript" src="seat_selection/js/theme-change-seat-sel.js"></script>
        <script src="seat_selection/js/jquery.nicescroll.js"></script>
        <script src="seat_selection/js/scripts.js"></script>
        <script type="text/javascript">
            var price = 110000; //price
            var id = '';
            let idSeat = [];
            var list = [
            <c:forEach items="${listSeatId}" var="selected">
                '<c:out value="${selected}" />',
            </c:forEach>
            ];
            console.log(list);
            $(document).ready(function () {
                var $cart = $('#selected-seats'), //Sitting Area
                        $counter = $('#counter'), //Votes
                        $total = $('#total'), //Total money
                        $idSelect = $('#idSeat');
                var sc = $('#seat-map').seatCharts({
                    map: [//Seating chart
                        'aaaaaaaaaa',
                        'aaaaaaaaaa',
                        '__________',
                        'aaaaaaaa__',
                        'aaaaaaaaaa',
                        'aaaaaaaaaa',
                        'aaaaaaaaaa',
                        'aaaaaaaaaa',
                        'aaaaaaaaaa',
                        '__aaaaaa__'
                    ],
                    naming: {
                        top: false,
                        getLabel: function (character, row, column) {
                            return column;
                        }
                    },
                    legend: {//Definition legend
                        node: $('#legend'),
                        items: [
                            ['a', 'available', 'Available'],
                            ['a', 'unavailable', 'Sold'],
                            ['a', 'selected', 'Selected']
                        ]
                    },
                    click: function () { //Click event
                        if (this.status() === 'available') { //optional seat
                            $('<option selected>' + this.settings.id + '</option>')
                                    .attr('id', 'cart-item-' + this.settings.id)
                                    .attr('value', this.settings.id)
                                    .attr('alt', price)
                                    .data('seatId', this.settings.id)
                                    .appendTo($cart);
                            id += this.settings.id + ',';
                            $counter.text(sc.find('selected').length + 1);
                            $total.text(recalculateTotal(sc) + price);
                            //                                        $idSelect.append()(idSelected(sc, this.settings.id));             
                            //                                        $idSelect.text(id);


                            return 'selected';
                        } else if (this.status() === 'selected') { //Checked
                            //Update Number
                            $counter.text(sc.find('selected').length - 1);
                            //update totalnum
                            $total.text(recalculateTotal(sc) - price);
                            //Delete reservation
                            $('#cart-item-' + this.settings.id).remove();
                            //optional
                            //                                        if (id.length < 4 | id.length<3) {
                            //                                            id = '';
                            //                                        } else {
                            //                                            id = id.substring(0, 3);
                            //                                        }
                            //                                        $idSelect.text(id);
                            return 'available';
                        } else if (this.status() === 'unavailable') { //sold
                            return 'unavailable';
                        } else {
                            return this.style();
                        }
                    }
                });
                //sold seat
                for (let i = 0; i < list.length; i++) {
                    sc.get(list[i]).status('unavailable');

                }
//                sc.get(['1_2', '4_4', '4_5', '6_6', '6_7', '8_5', '8_6', '8_7', '8_8', '10_1', '10_2']).status(
//                        'unavailable');
//                $.get("history", function (responseJson) {    // Execute Ajax GET request on URL of "someservlet" and execute the following function with Ajax response JSON...
//                    $.each(responseJson, function (index, item) { // Iterate over the JSON array.
//                        idSeat[i] = item;
//                        i++;
//                    });
//                });
//                $(".book-left").each(function () {
//
//                    alert(list[0]);
//
////                    $idSelect.append(idSeat[i]);
////                    sc.get(idSeat[i]).status.('unavailable');
//                });
            });

            //sum total money
            function recalculateTotal(sc) {
                var total = 0;
                sc.find('selected').each(function () {
                    total += price;
                });

                return total;
            }
            function removeId(idSec) {
                return id.replace(idSec, '');
            }


        </script>
    </body>

    <script src="https://npmcdn.com/flickity@2/dist/flickity.pkgd.js"></script>
    <script type="text/javascript" src='https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.bundle.min.js'></script>
    <!--<script type="text/javascript" src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>-->
    <script src="assets/js/theme-change.js"></script>

    <script type="text/javascript" src="assets/js/ticket-booking.js"></script>

</html>
