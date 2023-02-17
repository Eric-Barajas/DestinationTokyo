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
    <link rel="stylesheet" href="/css/main.css"> <!-- change to match your file/naming structure -->
    <script src="/webjars/jquery/jquery.min.js"></script>
    <!-- MDB -->
  	<link rel="stylesheet" href="css/mdb.min.css" />
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
              background-image: url('/img/jezael-melgoza-layMbSJ3YOE-unsplash.jpg');
              background-repeat: no-repeat;
              background-size: cover;
              background-position: center center;
          }

          .carousel-item:nth-child(2) {
              background-image: url('/img/morning-in-tokyo-sd.jpg');
              background-repeat: no-repeat;
              background-size: cover;
              background-position: center top;
          }

          .carousel-item:nth-child(3) {
              background-image: url('/img/tori_gates.jpeg');
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
              <a class="navbar-brand nav-link" href="/">
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
                          <a class="nav-link" href="/tester">Shopping</a>
                      </li>
                      <li class="nav-item">
                          <a class="nav-link" href="/anime">Anime</a>
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
                              <h3 class="mb-3">Whether you came to see the gardens, the shrines , 
                                or the endless supply of anime anime wear and anime lovers,we go tyou covered.</h3>
                          </div>
                      </div>
                  </div>
              </div>

              <!-- Single item -->
              <div class="carousel-item">
                  <div class="mask" style="background-color: rgba(0, 0, 0, 0.3);">
                      <div class="d-flex justify-content-center align-items-center h-100">
                          <div class="text-white text-center">
                              <h2></h2>
                          </div>
                      </div>
                  </div>
              </div>

              <!-- Single item -->
              <div class="carousel-item">
                  <div class="mask" >
                      <div class="d-flex justify-content-center align-items-center h-100">
                          <div class="text-white text-center">
                              <h2></h2>
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
          <!--Section: Content-->
          <section>
              <div class="row">
                  <div class="col-md-6 gx-5 mb-4">
                      <div class="bg-image hover-overlay ripple shadow-2-strong rounded-5"
                          data-mdb-ripple-color="light">
                          <img src="/img/unsplash.jpg" class="img-fluid" />
                          <a href="#!">
                              <div class="mask" style="background-color: rgba(251, 251, 251, 0.15);"></div>
                          </a>
                      </div>
                  </div>

                  <div class="col-md-6 gx-5 mb-4">
                      <h4><strong>The capital of Japan</strong></h4>
                      <p class="text-muted">
                          Tokyo, Japan’s busy capital, mixes the ultramodern and the traditional, from neon-lit 
                          skyscrapers to historic temples. The opulent Meiji Shinto Shrine is known for its 
                          towering gate and surrounding woods. The Imperial Palace sits amid large public gardens. 
                          The city's many museums offer exhibits ranging from classical art (in the Tokyo National 
                          Museum) to a reconstructed kabuki theater (in the Edo-Tokyo Museum). ― Google
                      </p>
                      <p><strong>Population</strong></p>
                      <p class="text-muted">
                          Tokyo (/ˈtoʊkioʊ/;[7] Japanese: 東京, Tōkyō, [toːkʲoː] (listen)), officially the Tokyo 
                          Metropolis (東京都, Tōkyō-to), is the capital and most populous city of Japan.[8] Formerly
                           known as Edo, its metropolitan area (13,452 square kilometers or 5,194 square miles) is
                            the most populous in the world, with an estimated 37.468 million residents as of 2018;
                            [9] the city proper has a population of 13.99 million people.[4] Located at the head of
                             Tokyo Bay, the prefecture forms part of the Kantō region on the central coast of Honshu,
                              Japan's largest island. Tokyo serves as Japan's economic center and is the seat of both
                               the Japanese government and the Emperor of Japan. - Wikipedia
                      </p>
                  </div>
              </div>
          </section>
          <!--Section: Content-->

          <hr class="my-5" />

          <!--Section: Content-->
          <section class="text-center">
              <h4 class="mb-5"><strong>TOP 3</strong></h4>

              <div class="row">
                  <div class="col-lg-4 col-md-6 mb-4">
                      <div class="card">
                          <div class="bg-image hover-overlay ripple" data-mdb-ripple-color="light">
                              <img src="/img/studio-ghibli-donguri-kyowakoku-0408235.jpg" class="img-fluid" />
                              <a href="#!">
                                  <div class="mask" style="background-color: rgba(251, 251, 251, 0.15);"></div>
                              </a>
                          </div>
                          <div class="card-body">
                              <h5 class="card-title">Anime</h5>
                              <p class="card-text">
                                  The epicenter of anything and everything anime related. Starting from
                                  anime to video games to collectibles and finally to cosplay.
                              </p>
                              <a href="/anime" class="btn btn-primary">Button</a>
                          </div>
                      </div>
                  </div>

                  <div class="col-lg-4 col-md-6 mb-4">
                      <div class="card">
                          <div class="bg-image hover-overlay ripple" data-mdb-ripple-color="light">
                              <img src="/img/nagashi-somen.jpeg" class="img-fluid" />
                              <a href="#!">
                                  <div class="mask" style="background-color: rgba(251, 251, 251, 0.15);"></div>
                              </a>
                          </div>
                          <div class="card-body">
                              <h5 class="card-title">Food & Drinks</h5>
                              <p class="card-text">
                                  Japan is home to a multitude of delectable cuisines and it is no different
                                  for the capital of Japan. In fact, Tokyo being one of the busiest cities in
                                  the world it may be your best place to see what are the culinary skills that
                                  Japan has to offer.
                              </p>
                              <a href="#!" class="btn btn-primary">Button</a>
                          </div>
                      </div>
                  </div>

                  <div class="col-lg-4 col-md-6 mb-4">
                      <div class="card">
                          <div class="bg-image hover-overlay ripple" data-mdb-ripple-color="light">
                              <img src="/img/Ginza-Six.webp" class="img-fluid" />
                              <a href="#!">
                                  <div class="mask" style="background-color: rgba(251, 251, 251, 0.15);"></div>
                              </a>
                          </div>
                          <div class="card-body">
                              <h5 class="card-title">Shopping</h5>
                              <p class="card-text">
                                  Japan has a very unique style and Tokyo's fashion sense is adorned all around
                                  the world. Here you can check out there traditonal wears such as a yukata and
                                  kimono, vintage clothes, and finally what's new in the Tokyo fashion trend.
                              </p>
                              <a href="#!" class="btn btn-primary">Button</a>
                          </div>
                      </div>
                  </div>
              </div>
          </section>
          <!--Section: Content-->

          <hr class="my-5" />
      </div>
  </main>
  <!--Main layout-->
  <!-- End your project here-->
  <!-- End your project here-->
    <!-- MDB -->
  	<script type="text/javascript" src="js/mdb.min.js"></script>
<!-- JavaScript Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
</body>
</html>