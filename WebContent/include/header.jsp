<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page isELIgnored="false"%>
<!-- css안에 jstl -->

<!DOCTYPE HTML>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>JSP Project</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description"
	content="Free HTML5 Website Template by FreeHTML5.co" />
<meta name="keywords"
	content="free website templates, free html5, free template, free bootstrap, free website template, html5, css3, mobile first, responsive" />
<meta name="author" content="FreeHTML5.co" />

<link rel="stylesheet" href="css/animate.css">
<link rel="stylesheet" href="css/icomoon.css">
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/style.css">

<script src="js/modernizr-2.6.2.min.js"></script>


<style>
span.star-prototype, span.star-prototype > * {
    height: 16px; 
    background: url(http://i.imgur.com/YsyS5y8.png) 0 -16px repeat-x;
    width: 80px;
    display: inline-block;
}
 
span.star-prototype > * {
    background-position: 0 0;
    max-width:80px; 
}
      
.fixed_img_col{background:#fff;padding-bottom:10px}
.fixed_img_col ul{margin:0;padding:0;font-size:12px;font-family:Tahoma, Geneva, sans-serif;list-style:none}
.fixed_img_col li{position:relative;padding:15px 0 15px 160px;vertical-align:top;*zoom:1;height:90px}
.fixed_img_col li:after{display:block;clear:both;content:""}
.fixed_img_col a{text-decoration:none;cursor:pointer}
.fixed_img_col a strong{display:inline-block;margin:0 0 4px 0;color:#333}
.fixed_img_col .thumb{display:inline;overflow:hidden;float:left;position:relative;width:120px;margin:0 15px 0 -135px;background:#eee;color:#666;line-height:90px;text-align:center;;border:1px solid #e7e5e6}
.fixed_img_col .thumb img{display:block;border:0}
.fixed_img_col .thumb img.dno{display:block;}
.fixed_img_col p{margin:0;color:#767676;line-height:1.4}
.fixed_img_col a:hover strong{text-decoration:underline}
.fixed_img_col a:hover .thumb{border:1px solid #999}

      
.filter-list {
	text-align: center;
	padding-bottom: 30px;
}

.filter-list li {
	display: inline-block;
	list-style: none;
	color: #333;
	font: 400 16px/115% 'Open Sans', sans-serif;
	padding: 0 20px;
	cursor: pointer;
}

.filter-list li:hover, #OurWork .filter-list li.active {
	color: #c2bcb6;
}

.filter-list .select-menu {
	color: #c2bcb6;
}

/* kakao map API */
.map_wrap, .map_wrap * {
	margin: 0;
	padding: 0;
	font-family: 'Malgun Gothic', dotum, '돋움', sans-serif;
	font-size: 12px;
}

.map_wrap a, .map_wrap a:hover, .map_wrap a:active {
	color: #000;
	text-decoration: none;
}

.map_wrap {
	position: relative;
	width: 100%;
	height: 500px;
}

#menu_wrap {
	position: absolute;
	top: 0;
	left: 0;
	bottom: 0;
	width: 250px;
	margin: 10px 0 30px 10px;
	padding: 5px;
	overflow-y: auto;
	background: rgba(255, 255, 255, 0.7);
	z-index: 1;
	font-size: 12px;
	border-radius: 10px;
}

.bg_white {
	background: #fff;
}

#menu_wrap hr {
	display: block;
	height: 1px;
	border: 0;
	border-top: 2px solid #5F5F5F;
	margin: 3px 0;
}

#menu_wrap .option {
	text-align: center;
}

#menu_wrap .option p {
	margin: 10px 0;
}

#menu_wrap .option button {
	margin-left: 5px;
}

#placesList li {
	list-style: none;
}

#placesList .item {
	position: relative;
	border-bottom: 1px solid #888;
	overflow: hidden;
	cursor: pointer;
	min-height: 65px;
}

#placesList .item span {
	display: block;
	margin-top: 4px;
}

#placesList .item h5, #placesList .item .info {
	text-overflow: ellipsis;
	overflow: hidden;
	white-space: nowrap;
}

#placesList .item .info {
	padding: 10px 0 10px 55px;
}

#placesList .info .gray {
	color: #8a8a8a;
}

#placesList .info .jibun {
	padding-left: 26px;
	background:
		url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/places_jibun.png)
		no-repeat;
}

#placesList .info .tel {
	color: #009900;
}

#placesList .item .markerbg {
	float: left;
	position: absolute;
	width: 36px;
	height: 37px;
	margin: 10px 0 0 10px;
	background:
		url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png)
		no-repeat;
}

#placesList .item .marker_1 {
	background-position: 0 -10px;
}

#placesList .item .marker_2 {
	background-position: 0 -56px;
}

#placesList .item .marker_3 {
	background-position: 0 -102px
}

#placesList .item .marker_4 {
	background-position: 0 -148px;
}

#placesList .item .marker_5 {
	background-position: 0 -194px;
}

#placesList .item .marker_6 {
	background-position: 0 -240px;
}

#placesList .item .marker_7 {
	background-position: 0 -286px;
}

#placesList .item .marker_8 {
	background-position: 0 -332px;
}

#placesList .item .marker_9 {
	background-position: 0 -378px;
}

#placesList .item .marker_10 {
	background-position: 0 -423px;
}

#placesList .item .marker_11 {
	background-position: 0 -470px;
}

#placesList .item .marker_12 {
	background-position: 0 -516px;
}

#placesList .item .marker_13 {
	background-position: 0 -562px;
}

#placesList .item .marker_14 {
	background-position: 0 -608px;
}

#placesList .item .marker_15 {
	background-position: 0 -654px;
}

#pagination {
	margin: 10px auto;
	text-align: center;
}

#pagination a {
	display: inline-block;
	margin-right: 10px;
}

#pagination .on {
	font-weight: bold;
	cursor: default;
	color: #777;
}
/* kakao map API END */
</style>

<script src="js/jquery-3.5.1.min.js"></script>
<script src="js/bootstrap.js"></script>

</head>
<body>
	<div id="page">
		<nav class="fh5co-nav" role="navigation">
			<div class="container">
				<div class="fh5co-top-logo">
					<div id="fh5co-logo">
						<span class="thumb"><img src="images/icon.png" width="40" height="40"></span>
						<a href="mainForm.do">FOODIGATION</a>
					</div>
				</div>
				<div class="fh5co-top-menu menu-1 text-center">
					<ul>
						<li class="has-dropdown"><a href="#"><strong>View Details</strong></a>
							<ul class="dropdown">
								<li><a href="listForm.do?cat=CAFE">CAFE</a></li>
								<li><a href="listForm.do?cat=DESSERT">DESSERT</a></li>
								<li><a href="listForm.do?cat=RESTAURANT">RESTAURANT</a></li>
								<li><a href="listForm.do?cat=BAR">BAR</a></li>
							</ul></li>
						<li><c:choose>
						
								<c:when test="${empty session_id }">
									<li><a href="loginForm.do" id="login_a"><strong>LOGIN</strong></a></li>
									<li><a href="joinForm.do"><strong>SIGN UP</strong></a></li>
								</c:when>
								<c:otherwise>
									<li><a href="addContentForm.do"><strong>WRITING</strong></a></li>
									<li><a href="mypageForm.do"><strong>MY PAGE</strong></a></li>
									<li><a href="logout.do" id="logout_a"><strong>LOGOUT(${session_nickname })</strong></a></li>
								</c:otherwise>
							</c:choose></li>
						<!-- <li><a href="join.jsp">SIGN UP</a></li> -->
					</ul>
				</div>
				<div class="fh5co-top-social menu-1 text-right">
					<ul class="fh5co-social">
						<li><a href="#"><i class="icon-twitter"></i></a></li>
						<li><a href="#"><i class="icon-dribbble"></i></a></li>
						<li><a href="#"><i class="icon-github"></i></a></li>
					</ul>
				</div>
			</div>
		</nav>