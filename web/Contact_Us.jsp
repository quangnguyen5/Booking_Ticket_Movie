<%-- 
    Document   : Contact_Us.jsp
    Created on : Nov 7, 2022, 7:05:19 PM
    Author     : minhd
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Contact Us page</title>
        <link rel="stylesheet" type="text/css" href="assets/css/as-alert-message.min.css">
        <link rel="stylesheet" type="text/css" href="assets/css/contact_us.css">
        <link rel="stylesheet" type="text/css" href="assets/css/style-starter.css">
        <link rel="stylesheet" href="assets/css/style-starter.css">
        <link href="//fonts.googleapis.com/css2?family=Open+Sans:ital,wght@0,300;0,400;0,600;0,700;1,600&display=swap"
              rel="stylesheet">

    </head>

    <body>
        <!-- Header -->
        <header id="site-header" class="w3l-header fixed-top">
            <!--/nav-->
            <nav class="navbar navbar-expand-lg navbar-light fill px-lg-0 py-0 px-3">
                <div class="container">
                    <h1><a class="navbar-brand" href="home.jsp"><span class="fa fa-play icon-log"
                                                                      aria-hidden="true"></span>
                            MyShowz</a></h1>
                    <!-- if logo is image enable this   
                                    <a class="navbar-brand" href="#home.jsp">
                                            <img src="image-path" alt="Your logo" title="Your logo" style="height:35px;" />
                                    </a> -->
                    <button class="navbar-toggler collapsed" type="button" data-toggle="collapse"
                            data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false"
                            aria-label="Toggle navigation">
                        <!-- <span class="navbar-toggler-icon"></span> -->
                        <span class="fa icon-expand fa-bars"></span>
                        <span class="fa icon-close fa-times"></span>
                    </button>

                    <div class="collapse navbar-collapse" id="navbarSupportedContent">
                        <ul class="navbar-nav ml-auto">
                            <li class="nav-item active">
                                <a class="nav-link" href="home.jsp">Home</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="movies">Movies</a>
                            </li>
                            <c:if test= "${sessionScope.admin != null}">
                                <li class="nav-item">
                                    <a class="nav-link" href="edit_movies">Edit Movie</a>
                                </li>
                            </c:if>
                            <li class="nav-item">
                                <a class="nav-link" href="Contact_Us.jsp">Contact</a>
                            </li>
                        </ul>

                        <!--/search-right-->
                        <!--/search-right-->
                        <div class="search-right">
                            <a href="#search" class="btn search-hny mr-lg-3 mt-lg-0 mt-4" title="search">Search <span
                                    class="fa fa-search ml-3" aria-hidden="true"></span></a>
                            <!-- search popup -->
                            <div id="search" class="pop-overlay">
                                <div class="popup">
                                    <form action="search" method="post" class="search-box">
                                        <input type="search" placeholder="Search your Keyword" name="search"
                                               required="required" autofocus="">
                                        <button type="submit" class="btn"><span class="fa fa-search"
                                                                                aria-hidden="true"></span></button>
                                    </form>
                                    <div class="browse-items">
                                        <h3 class="hny-title two mt-md-5 mt-4">Browse all:</h3>
                                        <ul class="search-items">
                                            <li><a href="movies">Action</a></li>
                                            <li><a href="movies">Drama</a></li>
                                            <li><a href="movies">Family</a></li>
                                            <li><a href="movies">Thriller</a></li>
                                            <li><a href="movies">Commedy</a></li>
                                            <li><a href="movies">Romantic</a></li>
                                            <li><a href="movies">Tv-Series</a></li>
                                            <li><a href="movies">Horror</a></li>
                                            <li><a href="movies">Action</a></li>
                                            <li><a href="movies">Drama</a></li>
                                            <li><a href="movies">Family</a></li>
                                            <li><a href="movies">Thriller</a></li>
                                            <li><a href="movies">Commedy</a></li>
                                            <li><a href="movies">Romantic</a></li>
                                            <li><a href="movies">Tv-Series</a></li>
                                            <li><a href="movies">Horror</a></li>
                                        </ul>
                                    </div>
                                </div>
                                <a class="close" href="#close">×</a>
                            </div>
                            <!-- /search popup -->
                            <!--/search-right-->

                        </div>
                        <div class="Login_SignUp" id="login"
                             style="font-size: 2rem ; display: inline-block; position: relative;">
                            <!-- <li class="nav-item"> -->
                            <a class="nav-link" href="sign_in.jsp"><i class="fa fa-user-circle-o"></i></a>
                            <!-- </li> -->
                        </div>
                        <c:if test ="${sessionScope.userLogged != null || sessionScope.admin != null}">
                            <div style="height: 25px;">
                                <p>Welcome ${userName}<a href="logout">(Logout)</a></p>
                            </div>
                        </c:if>
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
        <!-- Contact Us Form -->
        <div class="container">
            <h4>Contact Us</h4>
            <h3>Leave a Message</h3>
            <p>If you have a question regarding our services,
                feel free to contact us using the form below.</p>

            <form name="contact-us-form" action="#" onsubmit="return validateForm()">
                <div class="row100" id="fname-row100">
                    <div class="col">
                        <div class="inputBox" id="fname-inputBox">
                            <input type="text" name="fname" onclick="triggerAnim('fname')"/>
                            <span class="text">First Name</span>
                            <span class="line" id="fname-line"></span>
                        </div>
                    </div>
                    <div class="col">
                        <div class="inputBox" id="lname-inputBox">
                            <input type="text" name="lname" onclick="triggerAnim('lname')"/>
                            <span class="text">Last Name</span>
                            <span class="line" id="lname-line"></span>
                        </div>
                    </div>
                </div>
                <div class="row100" id="email-row100">
                    <div class="col">
                        <div class="inputBox" id="email-inputBox">
                            <input type="email" name="email" pattern="[^ @]*@[^ @]*" onclick="triggerAnim('email')"/>
                            <span class="text">Email ID</span>
                            <span class="line" id="email-line"></span>
                        </div>
                    </div>
                    <div class="col">
                        <div class="inputBox" id="tel-inputBox">
                            <input type="tel" name="m-num" onclick="triggerAnim('tel')" />
                            <span class="text">Mobile Number</span>
                            <span class="line" id="tel-line"></span>
                        </div>
                    </div>
                </div>
                <div class="row100">
                    <div class="col">
                        <div class="inputBox textarea">
                            <textarea name="msg"></textarea>
                            <span class="text">Type your message Here...</span>
                            <span class="line"></span>
                        </div>
                    </div>
                </div>
                <div class="row100">
                    <div class="col">
                        <div class="submitbutton">
                            <button class="btn submitbtn" type="submit">Submit</button>
                        </div>
                    </div>
                </div>
            </form>
        </div>
        <script type="text/javascript" src="assets/js/contact-us.js"></script>
        <script type="text/javascript" src="assets/js/as-alert-message.min.js"></script>
        <script src="assets/js/jquery-3.3.1.min.js"></script>
        <!--/theme-change-->
        <script src="assets/js/theme-change.js"></script>
        <!-- disable body scroll which navbar is in active -->
        <script>
                                $(function () {
                                    $('.navbar-toggler').click(function () {
                                        $('body').toggleClass('noscroll');
                                    })
                                });
        </script>
        <!-- disable body scroll which navbar is in active -->
        <!--/MENU-JS-->
        <script>
            $(window).on("scroll", function () {
                var scroll = $(window).scrollTop();

                if (scroll >= 80) {
                    $("#site-header").addClass("nav-fixed");
                } else {
                    $("#site-header").removeClass("nav-fixed");
                }
            });

            //Main navigation Active Class Add Remove
            $(".navbar-toggler").on("click", function () {
                $("header").toggleClass("active");
            });
            $(document).on("ready", function () {
                if ($(window).width() > 991) {
                    $("header").removeClass("active");
                }
                $(window).on("resize", function () {
                    if ($(window).width() > 991) {
                        $("header").removeClass("active");
                    }
                });
            });
        </script>
        <script src="assets/js/bootstrap.min.js"></script>
    </body>

</html>
