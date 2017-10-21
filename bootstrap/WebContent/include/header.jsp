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
  

  
  
 <style>
 
 #myNavbar li a{display:inline; padding-top:30px}
 </style>


</head>

<body id="myPage" data-spy="scroll" data-target=".navbar" data-offset="50">

<!-- 

.navbar	Creates a navigation bar 
.navbar-default	Creates a default navigation bar (light-grey background color)
.navbar-fixed-top	Makes the navbar stay at the top of the screen (sticky/fixed)
.container-fluid 가변컨테이너로 ...반응형으로 만듬...
.navbar-header	로고 또는 헤더 넣는 곳에 넣어줌..    Added to a container element that contains the link/element that represent a logo or a header
.navbar-toggle	작은스크린일때 햄버거 메뉴 스타일생성.. <span class="icon-bar"></span> 가 한줄.... Styles the button that should open the navbar on small screens. Often used together with three .icon-bar classes to indicate a toggleable menu icon (hamburger/bars)
data-toggle="collapse"는  data-target="#myNavbar"와 함꼐 쓰이며  클릭시  id="myNavbar"인 <div> 를 show, hide 효과줌... 

The .collapse class indicates a collapsible element (a <div> in our example); this is the content that will be shown or hidden with a click of a button.
To control (show/hide) the collapsible content, add the data-toggle="collapse" attribute to an <a> or a <button> element. Then add the data-target="#id" attribute to connect the button with the collapsible content (<div id="myNavbar">).
-->
<nav class="navbar navbar-default navbar-fixed-top">
  <div class="container-fluid">
    <div class="navbar-header">
    <a class="navbar-brand" href="index.jsp">Welcome to kitty world</a>
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">  <!-- ."collapse" 클릭시 #myNavbar인 id가 호출되서 그게 토글됨!  -->
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>      
                         
      </button>
      
    </div>
    
    <!-- 
    .navbar-collapse  길었던 네비가  크기를 줄이면 네비가 사라지고 햄버거 메뉴가 생김... data-target="#myNavbar"클릭시  밑에로 떨어짐...  Collapses the navbar (hidden and replaced with a menu/hamburger icon on mobile phones and small tablets)
   
    
    .navbar-nav	 li 담고있는 ul에 사용되어지는것. Used on a <ul> container that contains the list items with links inside a navigation bar 
    .navbar-right	네비 오른쪽 정렬 Aligns nav links, forms, buttons, or text in the navbar to the right.
    The .dropdown class indicates a dropdown menu.
	To open the dropdown menu, use a button or a link with a class of .dropdown-toggle and the data-toggle="dropdown" attribute.

	The .caret class creates a caret arrow icon (), which indicates that the button is a dropdown.
	Add the .dropdown-menu class to a <ul> element to actually build the dropdown menu.


     -->
     
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav navbar-right">
        <li><a href="index.jsp">HOME</a></li>
        <li><a href="#catPic">냥이사진</a></li>
        <li><a href="#catMov">냥이동영상</a></li>
        <li><a href="#contact">자유게시판</a></li>
        <li>
    <%  
   
    String name =(String)session.getAttribute("name");
    if(name !=null) {%> 
    <b Style="color:white">  <%= name+"님 환영합니다" %> </b>
     <a href="logout">로그아웃</a>
      <%
    }else{ %> 
    	<a href="login.jsp"><%= "로그인" %></a>
    	
   <%  } %> 
    
       
        
        </li>
        <li><a href="register.jsp">회원가입</a></li>
        
        <!-- <li class="dropdown">
          <a class="dropdown-toggle" data-toggle="dropdown" href="#">MORE
          <span class="caret"></span></a>
          <ul class="dropdown-menu">
            <li><a href="#">냥이음식</a></li>
            <li><a href="#">냥이용품</a></li>
            
          </ul>
        </li> -->
        <!-- Glyphicon search 검색아이콘    https://www.w3schools.com/bootstrap/bootstrap_ref_comp_glyphs.asp -->
        <li><a href="FindAllMemberServlet"><span class="glyphicon glyphicon-search"></span></a></li>
      </ul>
    </div>
  </div>
</nav>

</body>
</html>


