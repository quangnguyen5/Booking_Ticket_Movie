<%-- 
    Document   : edit_movies
    Created on : Nov 7, 2022, 1:11:52 AM
    Author     : LEGION 5
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zxx">

    <head>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>Edit Movies</title>
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="assets/css/erud_form.css"/>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
        <script src="https://code.jquery.com/jquery-latest.js"></script>
        <link rel="stylesheet" type="text/css" href="assets/css/swiper.min.css">

        <link rel="stylesheet" type="text/css" href="assets/css/style-starter.css">
        <link href="//fonts.googleapis.com/css2?family=Open+Sans:ital,wght@0,300;0,400;0,600;0,700;1,600&display=swap"
              rel="stylesheet">
        <script>
            $(document).ready(function () {
                // Activate tooltip
                $('[data-toggle="tooltip"]').tooltip();
                // Select/Deselect checkboxes
                var checkbox = $('table tbody input[type="checkbox"]');
                $("#selectAll").click(function () {
                    if (this.checked) {
                        checkbox.each(function () {
                            this.checked = true;
                        });
                    } else {
                        checkbox.each(function () {
                            this.checked = false;
                        });
                    }
                });
                checkbox.click(function () {
                    if (!this.checked) {
                        $("#selectAll").prop("checked", false);
                    }
                });
                $("table .delete").on('click', function () {
                    var id = $(this).parent().find('#id').val();
                    $("#deleteEmployeeModal #id").val(id);
                });


                $("table .delete").on('click', function () {
                    var id = $(this).parent().find('#id').val();
                    $("#deleteEmployeeModal #id").val(id);
                });

                $("table .edit").on('click', function () {
                    var id = $(this).parent().find('#id').val();
                    var title = $(this).parent().find('#title').val();
                    var description = $(this).parent().find('#description').val();
                    var star = $(this).parent().find('#star').val();
                    var dura = $(this).parent().find('#dura').val();
                    var language = $(this).parent().find('#language').val();
                    var releaseDate = $(this).parent().find('#releaseDate').val();
                    var genre = $(this).parent().find('#genre').val();
                    var image = $(this).parent().find('#image').val();
                    var country = $(this).parent().find('#country').val();

                    $("#editEmployeeModal #id").val(id);
                    $("#editEmployeeModal #title").val(title);
                    $("#editEmployeeModal #description").val(description);
                    $("#editEmployeeModal #star").val(star);
                    $("#editEmployeeModal #dura").val(dura);
                    $("#editEmployeeModal #language").val(language);
                    $("#editEmployeeModal #releaseDate").val(releaseDate);
                    $("#editEmployeeModal #genre").val(genre);
                    $("#editEmployeeModal #image").val(image);
                    $("#editEmployeeModal #country").val(country);



                });
//                $("table .edit").on('click', function () {
//                    var id = $(this).parent().find('#id').val();
//                    //                    $("#editEmployeeModal #id").val(id);
//                    //                    alert(id);
//                    $.ajax({
//                        type: 'GET',
//                        url: '${pageContext.request.contextPath}/update',
//                        data: {action: 'find', id: id},
//                        success: function (result) {
//                            $("#editEmployeeModal #title").val(result.title);
//                        }
//                    });
//                });
            });
//            $(document).ready(function () {
//                console.log($.ajax);
//            });

        </script>
    </head>

    <body>
        <!-- header -->
        <header id="site-header" class="w3l-header fixed-top">
            <!--/nav-->
            <nav class="navbar navbar-expand-lg navbar-light fill px-lg-0 py-0 px-3">
                <div class="container">
                    <h1><a class="navbar-brand" href="home.jsp"><span class="fa fa-play icon-log"
                                                                      aria-hidden="true"></span>
                            MyShowz </a></h1>
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
                            <li class="nav-item">
                                <a class="nav-link" href="home.jsp">Home</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="movies">movies</a>
                            </li>

                            <li class="nav-item active">
                                <a class="nav-link" href="edit_movies">Edit Movies</a>
                            </li>

                            <li class="nav-item">
                                <a class="nav-link" href="Contact_Us.jsp">Contact</a>
                            </li>
                        </ul>

                        <!--/search-right-->
                        <!--/search-right-->

                        <div class="Login_SignUp" id="login"
                             style="font-size: 2rem ; display: inline-block; position: relative;">
                            <!-- <li class="nav-item"> -->
                            <a class="nav-link" href="sign_in"><i class="fa fa-user-circle-o"></i></a>
                            <!-- </li> -->
                        </div>
                        <!--                        <div class="Login_SignUp" id="login"
                                                     style="font-size: 2rem ; display: inline-block; position: relative;">
                                                     <li class="nav-item"> 
                                                    <a class="nav-link" href="bill"><i class="fa fa-ticket"></i></a>
                                                     </li> 
                                                </div>-->
                        <c:if test ="${sessionScope.userLogged != null || sessionScope.admin != null}">
                            <div>
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
        <!--/breadcrumbs -->
        <div class="w3l-breadcrumbs">
            <nav id="breadcrumbs" class="breadcrumbs">
                <div class="container page-wrapper">
                    <a href="home.jsp">Home</a> » <span class="breadcrumb_last" aria-current="page">Edit Movies</span>
                </div>
            </nav>
        </div>
        <!-- /about-->
        <div class="container-xl">
            <div class="table-responsive">
                <div class="table-wrapper">
                    <div class="table-title">
                        <div class="row">
                            <div class="col-sm-6">
                                <h2>Manage <b>Movies</b></h2>
                            </div>
                            <div class="col-sm-6">
                                <a href="#addEmployeeModal" class="btn btn-success" data-toggle="modal"><i class="material-icons">&#xE147;</i> <span>Add New Movie</span></a>
                                <a href="#deleteEmployeeModal" class="btn btn-danger" data-toggle="modal"><i class="material-icons">&#xE15C;</i> <span>Delete</span></a>						
                            </div>
                        </div>
                    </div>
                    <label>
                        Show
                        <select class="custom-select custom-select-sm form-control form-control-sm" name="dtBasicExample_length" id="maxRows" aria-controls="dtBasicExample" style="width:32%">
                            <option value="5">5</option>
                            <option value="10">10</option>
                            <option value="15">15</option>
                        </select>
                        entries
                    </label>
                    <table class="table table-striped table-hover table-responsive">
                        <thead>
                            <tr>
                                <th>
                                    <span class="custom-checkbox">
                                        <input type="checkbox" id="selectAll">
                                        <label for="selectAll"></label>
                                    </span>
                                </th>
                                <th>Title</th>
                                <th>Language</th>
                                <th>Duration</th>
                                <th>Release Date</th>
                                <th>Country</th>
                                <th>Genre</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${listMovie}" var="m">
                                <tr>
                                    <td>
                                        <span class="custom-checkbox">
                                            <input type="checkbox" id="checkbox1" name="options[]" value="1">
                                            <label for="checkbox1"></label>
                                        </span>
                                    </td>
                                    <td>${m.getTitle()}</td>
                                    <td>${m.getLanguage()}</td>
                                    <td>${m.getDuration()}</td>
                                    <td>${m.getReleaseDate()}</td>
                                    <td>${m.getCountry()}</td>
                                    <td>${m.getGenre()}</td>
                                    <td>
                                        <a href="#editEmployeeModal"  class="edit" data-toggle="modal"><i class="material-icons" data-toggle="tooltip" title="Edit">&#xE254;</i></a>
                                        <input type="hidden" name="id" id="id" value="${m.getId()}">
                                        <input type="hidden" name="title" id="title" value="${m.getTitle()}">
                                        <input type="hidden" name="description" id="description" value="${m.getDescript()}">
                                        <input type="hidden" name="star" id="star" value="${m.getStarCast()}">
                                        <input type="hidden" name="dura" id="dura" value="${m.getDuration()}">
                                        <input type="hidden" name="language" id="language" value="${m.getLanguage()}">
                                        <input type="hidden" name="releaseDate" id="releaseDate" value="${m.getReleaseDate()}">
                                        <input type="hidden" name="genre" id="genre" value="${m.getGenre()}">
                                        <input type="hidden" name="img" id="image" value="${m.getImage()}">
                                        <input type="hidden" name="country_1" id="country" value="${m. getCountry()}">
                                        <a href="#deleteEmployeeModal" class="delete" data-toggle="modal"><i class="material-icons" data-toggle="tooltip" title="Delete">&#xE872;</i></a>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                    <div class="clearfix">
                        <div class="hint-text">Showing <b>${endPage}</b> out of <b>${totalMovies}</b> entries</div>
<!--                        <ul class="pagination">
                            <li class="page-item"><a href="#">Previous</a></li>
                            <li class="page-item active"><a href="#" class="page-link">1</a></li>
                            <li class="page-item"><a href="#" clas  s="page-link">2</a></li>
                            <li class="page-item disabled"><a href="#" class="page-link">3</a></li>
                            <li class="page-item"><a href="#" class="page-link">4</a></li>
                            <li class="page-item"><a href="#" class="page-link">5</a></li>
                            <li class="page-item"><a href="#" class="page-link">Next</a></li>
                        </ul>-->
                        <ul class="pagination">
                            <li class="page-item"><a href="#">Previous</a></li>
                                <c:forEach begin="1" end="${endPage}" var="i">
                                <li class="page-item"><a href="edit_movies?index=${i}" class="page-link" active>${i}</a></li>
                                </c:forEach>
                            <li class="page-item"><a href="#" class="page-link">Next</a></li>
                        </ul>
                    </div>
                </div>
            </div>        
        </div>
        <!-- Add Modal HTML -->
        <div id="addEmployeeModal" class="modal fade">
            <div class="modal-dialog">
                <div class="modal-content">
                    <form action="add" method="post">
                        <div class="modal-header">						
                            <h4 class="modal-title">Add Movies</h4>
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        </div>
                        <div class="modal-body">					
                            <div class="form-group">
                                <label>Title</label>
                                <input type="text" name="title" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label>Star-cast</label>
                                <input type="text" name="starCast" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label>Description</label>
                                <textarea class="form-control" name="descript" required></textarea>
                            </div>
                            <div class="form-group">
                                <label>Duration</label>
                                <input type="text" name="duration" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label>Language</label>
                                <input type="text" name="language" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label>Release-Date</label>
                                <input type="date" name="releaseDate" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label>Country</label>
                                <input type="text" name="country" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label>Genre</label>
                                <input type="text" name="genre" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label>Image</label>
                                <input type="file" id="avatar" name="avatar" accept="image/png, image/jpeg, image/jpg" class="form-control" required>
                            </div>			
                        </div>
                        <div class="modal-footer">
                            <input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
                            <input type="submit" class="btn btn-success" value="Add">
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <!-- Edit Modal HTML -->
        <div id="editEmployeeModal" class="modal fade">
            <div class="modal-dialog">
                <div class="modal-content">
                    <form action="update" method="post">
                        <div class="modal-header">						
                            <h4 class="modal-title">Edit Movie</h4>
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        </div>

                        <div class="modal-body">					
                            <div class="form-group">
                                <label>Title</label>
                                <input type="text" class="form-control" name="title" id="title">
                            </div>
                            <div class="form-group">
                                <label>Star-cast</label>
                                <input type="text" class="form-control" name="star_cast" id="star">
                            </div>
                            <div class="form-group">
                                <label>Description</label>
                                <textarea class="form-control" name="description" id="description"></textarea>
                            </div>
                            <div class="form-group">
                                <label>Duration</label>
                                <input type="text" class="form-control" name="duration" id="dura">
                            </div>
                            <div class="form-group">
                                <label>Language</label>
                                <input type="text" class="form-control" name="language" id="language">
                            </div>
                            <div class="form-group">
                                <label>Release-Date</label>
                                <input type="date" class="form-control" name="release_date" id="releaseDate"> 
                            </div>
                            <div class="form-group">
                                <label>Country</label>
                                <input type="text" class="form-control" name="country" id="country">
                            </div>
                            <div class="form-group">
                                <label>Genre</label>
                                <input type="text" class="form-control" name="genre" id="genre">
                            </div>
                            <div class="form-group">
                                <label>Image</label>
                                <input type="file" id="avatar" name="image" accept="image/png, image/jpeg, image/jpg" class="form-control" id="image">
                            </div>
                        </div>

                        <div class="modal-footer">
                            <input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
                            <input type="submit" class="btn btn-info" value="Save">
                            <input type="hidden" name="id" id="id">
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <!-- Delete Modal HTML -->
        <div id="deleteEmployeeModal" class="modal fade">
            <div class="modal-dialog">
                <div class="modal-content">
                    <form action="delete" method="post">
                        <div class="modal-header">						
                            <h4 class="modal-title">Delete Employee</h4>
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        </div>
                        <div class="modal-body">					
                            <p>Are you sure you want to delete these Records?</p>
                            <p class="text-warning"><small>This action cannot be undone.</small></p>
                        </div>
                        <div class="modal-footer">
                            <input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
                            <input type="submit" class="btn btn-danger" name="delete" value="Delete">
                            <input type="hidden" name="id" id="id">
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <footer class="w3l-footer">
            <section class="footer-inner-main">
                <div class="footer-hny-grids py-5">
                    <div class="container py-lg-4">
                        <div class="text-txt">
                            <div class="right-side">
                                <div class="row footer-about">
                                    <div class="col-md-3 col-6 footer-img mb-lg-0 mb-4">
                                        <a href="movies"><img class="img-fluid" src="assets/images/banner1.jpg"
                                                              alt=""></a>
                                    </div>
                                    <div class="col-md-3 col-6 footer-img mb-lg-0 mb-4">
                                        <a href="movies"><img class="img-fluid" src="assets/images/banner2.jpg"
                                                              alt=""></a>
                                    </div>
                                    <div class="col-md-3 col-6 footer-img mb-lg-0 mb-4">
                                        <a href="movies"><img class="img-fluid" src="assets/images/banner3.jpg"
                                                              alt=""></a>
                                    </div>
                                    <div class="col-md-3 col-6 footer-img mb-lg-0 mb-4">
                                        <a href="movies"><img class="img-fluid" src="assets/images/banner4.jpg"
                                                              alt=""></a>
                                    </div>
                                </div>
                                <div class="row footer-links">


                                    <div class="col-md-3 col-sm-6 sub-two-right mt-5">
                                        <h6>Movies</h6>
                                        <ul>
                                            <li><a href="#">Movies</a></li>
                                            <li><a href="#">Videos</a></li>
                                            <li><a href="#">English Movies</a></li>
                                            <li><a href="#">Tailor</a></li>
                                            <li><a href="#">Upcoming Movies</a></li>
                                            <li><a href="Contact_Us.jsp">Contact Us</a></li>
                                        </ul>
                                    </div>
                                    <div class="col-md-3 col-sm-6 sub-two-right mt-5">
                                        <h6>Information</h6>
                                        <ul>
                                            <li><a href="home.jsp">Home</a> </li>
                                            <li><a href="about.html">About</a> </li>
                                            <li><a href="#">Tv Series</a> </li>
                                            <li><a href="#">Blogs</a> </li>
                                            <li><a href="sign_in.html">Login</a></li>
                                            <li><a href="Contact_Us.jsp">Contact</a></li>
                                        </ul>
                                    </div>
                                    <div class="col-md-3 col-sm-6 sub-two-right mt-5">
                                        <h6>Locations</h6>
                                        <ul>
                                            <li><a href="movies">Asia</a></li>
                                            <li><a href="movies">France</a></li>
                                            <li><a href="movies">Taiwan</a></li>
                                            <li><a href="movies">United States</a></li>
                                            <li><a href="movies">Korea</a></li>
                                            <li><a href="movies">United Kingdom</a></li>
                                        </ul>
                                    </div>
                                    <div class="col-md-3 col-sm-6 sub-two-right mt-5">
                                        <h6>Newsletter</h6>
                                        <form action="#" class="subscribe mb-3" method="post">
                                            <input type="email" name="email" placeholder="Your Email Address" required="">
                                            <button><span class="fa fa-envelope-o"></span></button>
                                        </form>
                                        <p>Enter your email and receive the latest news, updates and special offers from us.
                                        </p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                </div>
                <div class="below-section">
                    <div class="container">
                        <div class="copyright-footer">
                            <div class="columns text-lg-left">
                                <p>&copy; 2021 MyShowz. All rights reserved</p>
                            </div>

                            <ul class="social text-lg-right">
                                <li><a href="#facebook"><span class="fa fa-facebook" aria-hidden="true"></span></a>
                                </li>
                                <li><a href="#linkedin"><span class="fa fa-linkedin" aria-hidden="true"></span></a>
                                </li>
                                <li><a href="#twitter"><span class="fa fa-twitter" aria-hidden="true"></span></a>
                                </li>
                                <li><a href="#google"><span class="fa fa-google-plus" aria-hidden="true"></span></a>
                                </li>

                            </ul>
                        </div>
                    </div>
                </div>
                <!-- copyright -->
                <!-- move top -->
                <button onclick="topFunction()" id="movetop" title="Go to top">
                    <span class="fa fa-arrow-up" aria-hidden="true"></span>
                </button>
                <script>
                    // When the user scrolls down 20px from the top of the document, show the button
                    window.onscroll = function () {
                        scrollFunction()
                    };

                    function scrollFunction() {
                        if (document.body.scrollTop > 20 || document.documentElement.scrollTop > 20) {
                            document.getElementById("movetop").style.display = "block";
                        } else {
                            document.getElementById("movetop").style.display = "none";
                        }
                    }

                    // When the user clicks on the button, scroll to the top of the document
                    function topFunction() {
                        document.body.scrollTop = 0;
                        document.documentElement.scrollTop = 0;
                    }
                </script>
                <!-- /move top -->

            </section>
        </footer>
        <script>
            $(document).ready(function () {
                $('#dtBasicExample').DataTable();
                $('.dataTables_length').addClass('bs-select');
            });
        </script>
    </body>

</html>
<script src="assets/js/jquery-3.3.1.min.js"></script>
<!-- stats -->
<script src="assets/js/jquery.waypoints.min.js"></script>
<script src="assets/js/jquery.countup.js"></script>
<script type="text/javascript" src='assets/js/swiper.min.js'></script>
<                        script>
$('.counter').cou                ntUp();
</script>
<!--/them                e-change-->
<script src="assets/js/theme-change.js"></script>
<script>
            const toggleSwitch = document.querySelector('.theme-switch input[type="checkbox"]');
            const currentTheme = localStorage.getItem('theme');

            if (currentTheme) {
                document.documentElement.setAttribute('data-theme', currentTheme);
                switchTextColor(currentTheme);
                if (currentTheme === 'dark') {
                    toggleSwitch.checked = true;
                }
            }

            function switchTextColor(currTheme) {

                if (currTheme === 'light') {
                    document.getElementById("swiper-container-h1").style.color = 'black';
                    document.getElementById("details-h3-1").sty
                    le.color = 'black';
                    document.getElementById("details-h3-2").style.color = 'black';
                    document.getElementById("details-h3-3").style.color = 'black';
                    document.getElementById("details-h3-4").style.color = 'black';
                    document.getElementById("details-h3-5").style.color = 'black';
                    document.getElementById("details-h3-6").style.color = 'black';
                } else {
                    document.getElementById("swiper-container-h1").style.color = 'white';
                    document.getElementById("details-h3-1").style.color = 'white';
                    document.getElementById("details-h3-2").style.color = 'white';
                    document.getElementById("details-h3-3").style.color = 'white';
                    document.getElementById("details-h3-4").style.color = 'white';
                    document.getElementById("details-h3-5").style.color = 'white';
                    document.getElementById("details-h3-6").style.color = 'white';
                }
            }
            toggleSwitch.addEventListener('change', switchTheme, false);
</script>
<script src="assets/js/owl.carousel.js"></script>
<!-- script for banner slider-->
<script>
            $(document).ready(function () {
                $('.owl-team').owlCarousel({
                    loop: true,
                    margin: 20,
                    nav: false,
                    responsiveClass: true,
                    autoplay: false,
                    autoplayTimeout: 5000,
                    autoplaySpeed: 1000,
                    autoplayHoverPause: false,
                    responsive: {
                        0: {
                            items: 2,
                            nav: false
                        },
                        480: {
                            items: 2,
                            nav: true
                        },
                        667: {
                            items: 3,
                            nav: true
                        },
                        1000: {
                            items: 4,
                            nav: true
                        }
                    }
                })
            })
</script>


<script>
    var swiper = new Swiper('.swiper-container', {
        effect: 'coverflow',
        grabCursor: true,
        centeredSlides: true,
        slidesPerView: 'auto',
        coverflowEffect: {
            rotate: 50,
            stretch: 0,
            depth: 100,
            modifier: 1,
            slideShadows: true,
        },
        pagination: {
            el: '.swiper-pagination',
        },
    });
</script>
<script>
    $(document).ready(function () {
        $('.owl-three').owlCarousel({
            loop: true,
            margin: 20,
            nav: false,
            responsiveClass: true,
            autoplay: true,
            autoplayTimeout: 5000,
            autoplaySpeed: 1000,
            autoplayHoverPause: false,
            responsive: {
                0: {
                    items: 2,
                    nav: false
                },
                480: {
                    items: 2,
                    nav: true
                },
                667: {
                    items: 3,
                    nav: true
                },
                1000: {
                    items: 6,
                    nav: true
                }
            }
        })
    })
</script>
<!-- for tesimonials carousel slider -->
<script>
    $(document).ready(function () {
        $(".owl-clients").owlCarousel({
            loop: true,
            margin: 40,
            responsiveClass: true,
            responsive: {
                0: {
                    items: 1,
                    nav: true
                },
                736: {
                    items: 2,
                    nav: false
                },
                1000: {
                    items: 3,
                    nav: true,
                    loop: false
                }
            }
        })
    })
</script>
<!-- script for owlcarousel -->
<!-- disable body scroll which navbar is in active -->
<script>
    $(function () {
        $('.navbar-toggler').click(function () {
            $('body').toggleClass('noscroll');
        })
    });
</script>
<!-- disable body scroll which navbar is inactive -->

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