<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<!-- Theme Made By www.w3schools.com - No Copyright -->
  <title> kitty world</title>
  <meta charset="utf-8">
  
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <link href="https://fonts.googleapis.com/css?family=Lato" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet" type="text/css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <link rel="stylesheet" href="./css/index.css" media="all" />

  
  


</head>
<body id="myPage" data-spy="scroll" data-target=".navbar" data-offset="50">

<%@ include file="./include/header.jsp" %>







	<!-- outermost  -->

	<!-- 
	Carousels require the use of an id (in this case id="myCarousel") for carousel controls to function properly.
	The class="carousel" specifies that this <div> contains a carousel.
	The .slide class adds a CSS transition and animation effect, which makes the items slide when showing a new item. Omit this class if you do not want this effect.
	The data-ride="carousel" attribute tells Bootstrap to begin animating the carousel immediately when the page loads.
	
	-->


<div id="myCarousel" class="carousel slide" data-ride="carousel">
    <!-- Indicators -->
    
  	<!-- 
  	동글뱅이임... The indicators are the little dots at the bottom of each slide (which indicates how many slides there is in the carousel, and which slide the user are currently viewing).
	The indicators are specified in an ordered list with class .carousel-indicators.
	The data-target attribute points to the id of the carousel.
	The data-slide-to attribute specifies which slide to go to, when clicking on the specific dot 
	-->

    <ol class="carousel-indicators">
      <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
      <li data-target="#myCarousel" data-slide-to="1"></li>
      <li data-target="#myCarousel" data-slide-to="2"></li>
      <li data-target="#myCarousel" data-slide-to="3"></li>
    </ol>


    <!-- Wrapper for slides -->
    
    <!-- The slides are specified in a <div> with class .carousel-inner.

	The content of each slide is defined in a <div> with class .item. This can be text or images.
	
	The .active class needs to be added to one of the slides. Otherwise, the carousel will not be visible.
	
	
	 -->
    <div class="carousel-inner" role="listbox">
      <div class="item active">
        <img src="./img/cat0.jpg" alt="cat0" width="1200px" height="700px">
        <div class="carousel-caption">
          <h3>귀여운 아깽이들</h3>
          <p>"넘 귀엽다 냥!!"</p>
        </div>      
      </div>

      <div class="item">
        <img src="./img/cat1.jpg"  alt="cat1" width="1200px" height="700px">
        <div class="carousel-caption">
          <h3>낼름 냥이</h3>
          <p>"내 손에 특식 묻었다 냥~~!"</p>
        </div>      
      </div>
    
      <div class="item">
        <img src="./img/cat2.jpg"  alt="cat2" width="1200px" height="700px">
        <div class="carousel-caption">
          <h3>나른한 냥이</h3>
          <p>"따뜻 하다 냥~~!!</p>
        </div>      
      </div>
      <div class="item">
        <img src="./img/cat3.jpg"  alt="cat3" width="1200px" height="700px">
        <div class="carousel-caption">
          <h3>호기심 냥이</h3>
          <p>궁금하다냥~~!</p>
        </div>      
      </div>
    </div>

    <!-- Left and right controls -->
    
    <!-- This code adds "left" and "right" buttons that allows the user to go back and forth between the slides manually.

	The data-slide attribute accepts the keywords "prev" or "next", which alters the slide position relative to its current position. -->

    <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
      <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
      <span class="sr-only">Previous</span>
    </a>
    <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
      <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
      <span class="sr-only">Next</span>
    </a>
</div>

<!-- Container (The catPic Section) -->
<div id="catPic" class="container text-center">
  <h3>THE Kitty</h3>
  <p><em>We love kitty!</em></p>
  <p>We have created a fictional catPic website. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
  <br>
  <div class="row">
    <div class="col-sm-4">
      <p class="text-center"><strong>Name</strong></p><br>
      <a href="#demo" data-toggle="collapse">
        <img src="./img/cat0.jpg" class="img-circle person" alt="Random Name" width="255" height="255">
      </a>
      <div id="demo" class="collapse">
        <p>Guitarist and Lead Vocalist</p>
        <p>Loves long walks on the beach</p>
        <p>Member since 1988</p>
      </div>
    </div>
    <div class="col-sm-4">
      <p class="text-center"><strong>Name</strong></p><br>
      <a href="#demo2" data-toggle="collapse">
        <img src="./img/cat1.jpg" class="img-circle person" alt="Random Name" width="255" height="255">
      </a>
      <div id="demo2" class="collapse">
        <p>Drummer</p>
        <p>Loves drummin'</p>
        <p>Member since 1988</p>
      </div>
    </div>
    <div class="col-sm-4">
      <p class="text-center"><strong>Name</strong></p><br>
      <a href="#demo3" data-toggle="collapse">
        <img src="./img/cat2.jpg" class="img-circle person" alt="Random Name" width="255" height="255">
      </a>
      <div id="demo3" class="collapse">
        <p>Bass player</p>
        <p>Loves math</p>
        <p>Member since 2005</p>
      </div>
    </div>
  </div>
</div>

<!-- Container () -->
	<div  class="row" id="catMov">
	<div class="col-lg-3"></div>
		<div class="col-lg-6">
			<iframe width="800px" height="430px" class="col-lg-12"
				src="https://www.youtube.com/embed/C6TfyEJ7wHk?autoplay=1&start=32&loop=1&showinfo=0&controls=0"
				frameborder="0" allowfullscreen></iframe>

			<!-- <iframe width="800px" height="480px" src="./img/cat.mp4" frameborder="0" ></iframe> -->
		</div>
		<div class="col-lg-3"></div>
	</div>

	
  
 

<!-- Container (Contact Section) -->
<div id="contact" class="container">
  <h3 class="text-center">Contact</h3>
  <p class="text-center"><em>We love our fans!</em></p>

  <div class="row">
    <div class="col-md-4">
      <p>Fan? Drop a note.</p>
      <p><span class="glyphicon glyphicon-map-marker"></span>seoul ,kangnamgu</p>
      <p><span class="glyphicon glyphicon-phone"></span>Phone: 010-3133-8373</p>
      <p><span class="glyphicon glyphicon-envelope"></span>Email: isp8373@mail.com</p>
    </div>
    <div class="col-md-8">
      <div class="row">
        <div class="col-sm-6 form-group">
          <input class="form-control" id="name" name="name" placeholder="Name" type="text" required>
        </div>
        <div class="col-sm-6 form-group">
          <input class="form-control" id="email" name="email" placeholder="Email" type="email" required>
        </div>
      </div>
      <textarea class="form-control" id="comments" name="comments" placeholder="Comment" rows="5"></textarea>
      <br>
      <div class="row">
        <div class="col-md-12 form-group">
          <button class="btn pull-right" type="submit">Send</button>
        </div>
      </div>
    </div>
  </div>
  <br>
  <h3 class="text-center">From The Blog</h3>  
  
  <ul class="nav nav-tabs">
    <li class="active"><a data-toggle="tab" href="#home">Mike</a></li>
    <li><a data-toggle="tab" href="#menu1">Chandler</a></li>
    <li><a data-toggle="tab" href="#menu2">Peter</a></li>
  </ul>

<!-- 







Toggleable / Dynamic Tabs
To make the tabs toggleable,   add a .tab-pane class with a unique ID for every tab and wrap them inside a <div> element with class .tab-content.

If you want the tabs to fade in and out when clicking on them, add the .fade class to .tab-pane:


Tip: Also mark the current page with <li class="active">.
 
 -->

  <div class="tab-content">
    <div id="home" class="tab-pane fade in active">
      <h2>Mike Ross, Manager</h2>
      <p>Man, we've been on the road for some time now. Looking forward to lorem ipsum.</p>
    </div>
    <div id="menu1" class="tab-pane fade">
      <h2>Chandler Bing, Guitarist</h2>
      <p>Always a pleasure people! Hope you enjoyed it as much as I did. Could I BE.. any more pleased?</p>
    </div>
    <div id="menu2" class="tab-pane fade">
      <h2>Peter Griffin, Bass player</h2>
      <p>I mean, sometimes I enjoy the show, but other times I enjoy other things.</p>
    </div>
  </div>
</div>

<!-- Add Google Maps -->
<div id="googleMap"></div>
<script>
function myMap() {
var myCenter = new google.maps.LatLng(37.370440, 127.120120); //위도,경도
var mapProp = {center:myCenter, zoom:15, scrollwheel:true, draggable:true, mapTypeId:google.maps.MapTypeId.ROADMAP}; //속성
var map = new google.maps.Map(document.getElementById("googleMap"),mapProp); //속성 주입  맵 객체생성
var marker = new google.maps.Marker({position:myCenter,animation: google.maps.Animation.BOUNCE}); //맵에 바운스 효과
marker.setMap(map); //마커에 맵 인자값 넣음.
var infowindow = new google.maps.InfoWindow({content: "Kitty world 위치"}); //말풍선 생성
  infowindow.open(map,marker); //말풍선에 맵객체와 마커객체 주입함
  
}
</script>
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCm_cGH7uitBAigL8yDMEvZIIesGpt5yqY&callback=myMap"></script>  
<!--
To use this code on your website, get a free API key from Google.
Read more at: https://www.w3schools.com/graphics/google_maps_basic.asp
-->

<!-- Footer -->
<%@ include file="./include/footer.jsp" %>


<script>
$(document).ready(function(){
  // Initialize Tooltip
  $('[data-toggle="tooltip"]').tooltip();   //툴팁 사용하기 위해서 제이쿼리 사용
  
  // Add smooth scrolling to all links in navbar + footer link
  $(".navbar a, footer a[href='#myPage']").on('click', function() {

   

      // Store hash
      var hash = this.hash;

     
      $('html, body').animate({
        scrollTop: $(hash).offset().top
      }, 900)
  
  });
})
</script>

</body>
</html>