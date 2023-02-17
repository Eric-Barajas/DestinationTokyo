<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- c:out ; c:forEach JSP tags etc. --> 
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- Formatting (dates) --> 
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!-- form:form -->
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!-- for rendering errors on PUT routes -->
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Tokyo</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <link rel="stylesheet" href="/css/images.css"> <!-- change to match your file/naming structure -->
    <script src="/webjars/jquery/jquery.min.js"></script>
    <!-- MDB -->
    <link rel="stylesheet" href="css/mdb.min.css" />
    <!-- GOOGLE MAPS API -->
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <script src="https://kit.fontawesome.com/ab2155e76b.js" crossorigin="anonymous"></script>
	<link href="https://fonts.googleapis.com/css2?family=Poppins&display=swap" rel="stylesheet">
	<link href="/css/googlemapsapi.css" rel="stylesheet" />
</head>
<body>
    <!-- Start your project here-->
    <!--Main Navigation-->
    <header>
        <style>
            /* Carousel styling */
            #introCarousel,
            .carousel-inner,
            .carousel-item,
            .carousel-item.active {
                height: 100vh;
            }

            .carousel-item:nth-child(1) {
                background-image: url('/img/pokemon_cafe.webp');
                background-repeat: no-repeat;
                background-size: cover;
                background-position: center center;
            }

            .carousel-item:nth-child(2) {
                background-image: url('/img/akihabara.jpeg');
                background-repeat: no-repeat;
                background-size: cover;
                background-position: center center;
            }

            .carousel-item:nth-child(3) {
                background-image: url('/img/ARTNIA_square_innex.webp');
                background-repeat: no-repeat;
                background-size: cover;
                background-position: center center;
            }

            /* Height for devices larger than 576px */
            @media (min-width: 992px) {
                #introCarousel {
                    margin-top: -58.59px;
                }

                #introCarousel,
                .carousel-inner,
                .carousel-item,
                .carousel-item.active {
                    height: 50vh;
                }
            }

            .navbar .nav-link {
                color: #fff !important;
            }
        </style>

        <!-- Navbar -->
        <nav class="navbar navbar-expand-lg navbar-dark d-none d-lg-block" style="z-index: 2000;">
            <div class="container">
                <!-- Navbar brand -->
                <a class="navbar-brand nav-link" target="_blank" href="/">
                    <strong>Tokyo</strong>
                </a>
                <button class="navbar-toggler" type="button" data-mdb-toggle="collapse"
                    data-mdb-target="#navbarExample01" aria-controls="navbarExample01" aria-expanded="false"
                    aria-label="Toggle navigation">
                    <i class="fas fa-bars"></i>
                </button>
                <div class="collapse navbar-collapse" id="navbarExample01">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                        <li class="nav-item active">
                            <a class="nav-link" aria-current="page" href="#intro">Food & Drinks</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="/" rel="nofollow" target="_blank">Shopping</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="/" target="_blank">Anime</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="/" target="_blank">Things To Do</a>
                        </li>
                    </ul>
                    <ul class="navbar-nav d-flex flex-row gap-2">
                    	<c:choose>
							<c:when test="${user_id != null}"> 
								 <a class="btn btn-primary" href="/logout"> Logout </a>
							</c:when>
							<c:otherwise>
								<a class="btn btn-primary" href="/login"> Login </a>
                  	   			<a class="btn btn-primary" href="/register"> Registration </a>
							</c:otherwise>
						</c:choose>
                    </ul>

<!--                     <ul class="navbar-nav d-flex flex-row gap-2">
                       <a class="btn btn-primary" href="/login"> Login </a>
                  	   <a class="btn btn-primary" href="/register"> Registration </a>
                    </ul> -->
                </div>
            </div>
        </nav>
        <!-- Navbar -->

        <!-- Carousel wrapper -->
        <div id="introCarousel" class="carousel slide carousel-fade shadow-2-strong" data-mdb-ride="carousel">
            <!-- Indicators -->
            <ol class="carousel-indicators">
                <li data-mdb-target="#introCarousel" data-mdb-slide-to="0" class="active"></li>
                <li data-mdb-target="#introCarousel" data-mdb-slide-to="1"></li>
                <li data-mdb-target="#introCarousel" data-mdb-slide-to="2"></li>
            </ol>

            <!-- Inner -->
            <div class="carousel-inner">
                <!-- Single item -->
                <div class="carousel-item active">
                    <div class="mask" style="background-color: rgba(0, 0, 0, 0.6);">
                        <div class="d-flex justify-content-center align-items-center h-100">
                            <div class="text-white text-center">
                                <h1 class="mb-3">Welcome anime lovers!</h1>
                                <h5 class="mb-4">Pokemon Cafe</h5>
                                <a class="btn btn-outline-light btn-lg m-2"
                                    href="/" role="button" rel="nofollow"
                                    target="_blank">Bonus</a>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Single item -->
                <div class="carousel-item">
                    <div class="mask" style="background-color: rgba(0, 0, 0, 0.3);">
                        <div class="d-flex justify-content-center align-items-center h-100">
                            <div class="text-white text-center">
                                <h5 class="mb-4">Akihabara</h5>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Single item -->
                <div class="carousel-item">
                    <div class="mask" >
                        <div class="d-flex justify-content-center align-items-center h-100">
                            <div class="text-white text-center">
                                <h5>ARTINIA Square Inex</h5>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Inner -->

            <!-- Controls -->
            <a class="carousel-control-prev" href="#introCarousel" role="button" data-mdb-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="sr-only">Previous</span>
            </a>
            <a class="carousel-control-next" href="#introCarousel" role="button" data-mdb-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="sr-only">Next</span>
            </a>
        </div>
        <!-- Carousel wrapper -->
    </header>
    <!--Main Navigation-->

    <!--Main layout-->
    <main class="mt-5">
        <div class="container">
            <hr class="my-5" />

            <!--Section: Content-->
            <section class="text-center">

                <div class="row">
                    <div class="col-lg-2 col-md-6 mb-4">
                        <div class="card">
                            <div>
                                <input type="text" placeholder="Search..">
                            </div>
                            <div>
                                <h3>Where</h3>
                                <form>
                                    <input type="checkbox" id="Chuo" name="Chuo" value="District">
                                    <label for="Chuo"> Chuo</label><br>
                                    <input type="checkbox" id="Shinjuku" name="Shinjuku" value="District">
                                    <label for="Shinjuku"> Shinjuku</label><br>
                                    <input type="checkbox" id="Shibuya" name="Shibuya" value="District">
                                    <label for="Shibuya"> Shibuya</label>
                                </form>
                            </div>
                            <div>
                                <h3>Interest</h3>
                                <form>
                                    <input type="checkbox" id="Collectibles" name="Collectibles" value="Interest">
                                    <label for="Collectibles"> Collectibles</label><br>
                                    <input type="checkbox" id="Video Games" name="Video Games" value="Interest">
                                    <label for="Video Games"> Video Games</label><br>
                                    <input type="checkbox" id="Manga" name="Manga" value="Interest">
                                    <label for="Manga"> Manga</label>
                                    <input type="checkbox" id="Cosplays" name="Cosplays" value="Interest">
                                    <label for="Cosplays"> Cosplay</label>
                                    <input type="checkbox" id="Conventions" name="Conventions" value="Interest">
                                    <label for="Conventions"> Convention</label>
                                </form>
                            </div>
                            <div>
                                <h3>Prices</h3>
                                <form>
                                    <input type="checkbox" id="vehicle1" name="vehicle1" value="Bike">
                                    <label for="vehicle1"> I have a bike</label><br>
                                    <input type="checkbox" id="vehicle2" name="vehicle2" value="Car">
                                    <label for="vehicle2"> I have a car</label><br>
                                    <input type="checkbox" id="vehicle3" name="vehicle3" value="Boat">
                                    <label for="vehicle3"> I have a boat</label>
                                </form>
                            </div>
                        </div>
                    </div>

                    <div class="col-lg-5 col-md-6 mb-4">
                        <div class="card">
                            <div class="row d-flex">
                                <div class="card-body">
                                
                                <!-- for loop for the activities name, description, picture -->
                                    <c:forEach var="activity" items="${activities}">
                                    <div>
                                        <img class="activitypics" alt="" src="img/${activity.images}">
                                    </div>
                                    <div>
                                        <h4> <c:out value="${activity.name}" /><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-bookmark" viewBox="0 0 16 16">
                                            <path d="M2 2a2 2 0 0 1 2-2h8a2 2 0 0 1 2 2v13.5a.5.5 0 0 1-.777.416L8 13.101l-5.223 2.815A.5.5 0 0 1 2 15.5V2zm2-1a1 1 0 0 0-1 1v12.566l4.723-2.482a.5.5 0 0 1 .554 0L13 14.566V2a1 1 0 0 0-1-1H4z"/>
                                        </svg> <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-chat" viewBox="0 0 16 16">
                                            <path d="M2.678 11.894a1 1 0 0 1 .287.801 10.97 10.97 0 0 1-.398 2c1.395-.323 2.247-.697 2.634-.893a1 1 0 0 1 .71-.074A8.06 8.06 0 0 0 8 14c3.996 0 7-2.807 7-6 0-3.192-3.004-6-7-6S1 4.808 1 8c0 1.468.617 2.83 1.678 3.894zm-.493 3.905a21.682 21.682 0 0 1-.713.129c-.2.032-.352-.176-.273-.362a9.68 9.68 0 0 0 .244-.637l.003-.01c.248-.72.45-1.548.524-2.319C.743 11.37 0 9.76 0 8c0-3.866 3.582-7 8-7s8 3.134 8 7-3.582 7-8 7a9.06 9.06 0 0 1-2.347-.306c-.52.263-1.639.742-3.468 1.105z"/>
                                        </svg> 
                                        </h4>
                                        <h5>
                                        	<c:out value="${activity.subcategory}" /> Store
                                        </h5>
                                        <h6>
                                        	<c:out value="${activity.location}" />
                                        </h6>
                                        <p>
                                        	<c:out value="${activity.description}" />
                                        </p>
                                        
                                        <a class="btn btn-dark" href="/activity/${activity.id}" >comment</a>
                                        <hr>
                                    </div>
                                    </c:forEach>
                                    
                                <!-- for loop for comments -->
                                        <c:forEach var="useraction" items="${activity.useraction}">
                                    <div>
                                        <p>
                                            <c:out value="${activity.description}" /> Lorem ipsum, dolor sit amet consectetur adipisicing elit. Nesciunt unde eaque, iusto facere corporis cupiditate repellat, molestiae minima aspernatur in ex nostrum necessitatibus quaerat vel optio, quas quisquam similique consequatur.
                                        </p>
                                    </div>
                                    	<a href="#!" class="btn btn-primary">Button</a>
                                    	<a href="/activity/${id}" class="btn btn-primary">Comments</a>
                                		</c:forEach>
                                	</div>
                            </div>

                        </div>
                    </div>
                    
                    <!-- GOOGLE MAPS API -->
                    <div class="col-lg-5 col-md-6 mb-4">
        				<div class="card">
				            <h1>Find The Distance Between Two Places.</h1>
				            <p>This App Will Help You Calculate Your Travelling Distances.</p>
				            <form class="form-horizontal">
				                <div class="form-group">
				                    <label for="from" class="col-xs-2 control-label"><i class="far fa-dot-circle"></i></label>
				                    <div class="col-xs-4">
				                        <input type="text" id="from" placeholder="Origin" class="form-control">
				                    </div>
				               </div>
				               <div class="form-group">
				                
				                    <label for="to" class="col-xs-2 control-label"><i class="fas fa-map-marker-alt"></i></label>
				                    <div class="col-xs-4">
				                        <input type="text" id="to" placeholder="Destination" class="form-control">
				                    </div>
				                  
				                 </div>
				                 
				            </form>

				            <div class="col-xs-offset-2 col-xs-10">
				                <button class="btn btn-info btn-lg " onclick="calcRoute();"><i class="fas fa-map-signs"></i></button>
				            </div>
					        <div class="container-fluid">
					            <div id="googleMap">
					
					            </div>
					            <div id="output">
					
					            </div>
					        </div>
				        </div>
				
				    </div>
                    

<!--                     <div class="col-lg-4 col-md-6 mb-4">
                        <div class="card">
                            <div class="bg-image hover-overlay ripple" data-mdb-ripple-color="light">
                                <img src="/img/map of tokyo anime hot spots.webp" class="img-fluid" />
                                </a>
                            </div>
                        </div>
                    </div> -->
                </div>
            </section>
            <!--Section: Content-->

            <hr class="my-5" />
        </div>
    </main>
    <!--Main layout-->
    <!-- End your project here-->
    
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://maps.googleapis.com/maps/api/js?key=${API_KEY}"></script>
    
    <script src="/js/googlemapsapi.js"></script>
    
    <!-- MDB -->
    <script type="text/javascript" src="js/mdb.min.js"></script>
<!-- JavaScript Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
</body>
</html>