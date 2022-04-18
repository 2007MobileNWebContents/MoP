<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />

<meta
	content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0'
	name='viewport' />
<meta name="viewport" content="width=device-width" />

<title>Re:turn - MoP</title>
<link rel="shortcut icon" type="image⁄x-icon"
	href="/resources/image/calendar-icon.png">
<link href="resources/mainPage/css/bootstrap.css" rel="stylesheet" />
<link href="resources/mainPage/css/coming-sssoon.css" rel="stylesheet" />

<!--     Fonts     -->
<link
	href="http://netdna.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link href='http://fonts.googleapis.com/css?family=Grand+Hotel'
	rel='stylesheet' type='text/css'>
<style>
</style>
</head>
<body>
	<nav class="navbar navbar-transparent navbar-fixed-top"
		role="navigation" style="background-color: black;">
		<div class="container">
			<!-- Brand and toggle get grouped for better mobile display -->
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target="#bs-example-navbar-collapse-1">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
			</div>

			<!-- Collect the nav links, forms, and other content for toggling -->
			<div class="collapse navbar-collapse"
				id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav">
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown"> <img src="resources/image/calendar.png" style="width:20px;height:20px;" />
							Scheduler <b class="caret"></b>
					</a>
						<ul class="dropdown-menu" style="text-align:center;">
							<li><i class="fa fa-user-o fa-lg" aria-hidden="true" style="padding-top:15px;text-decoration:none;"><a href="scheduler.do" style="margin-left:5px;">개인</a></i></li>
							<li><i class="fa fa-users fa-lg" aria-hidden="true" style="padding-top:15px;padding-bottom: 15px;text-decoration:none;"><a href="schedulerGroup.do" style="margin-left:5px;">단체</a></i></li>
						</ul></li>
				</ul>
				<ul class="nav navbar-nav navbar-right">
					<li><a href="logout.do"> <i class="fa fa-power-off" aria-hidden="true"></i>
							Log Out
					</a></li>
					<li><a href="myPage.do"> <i class="fa fa-user-circle-o" aria-hidden="true"></i>
							MyPage
					</a></li>	
					<li><a href="placeList.do"> <i class="fa fa-map" aria-hidden="true"></i>
							Partners
					</a></li>
					<li><a href="freeBoardList.do"> <i class="fa fa-columns" aria-hidden="true"></i> Freeboard
					</a></li>
					<li><a href="faqBoardList.do"> <i class="fa fa-question-circle-o" aria-hidden="true"></i> FAQ
					</a></li>
					<li><a href="eventBoardList.do"> <i class="fa fa-question-circle-o" aria-hidden="true"></i> Eventboard
					</a></li>
				</ul>
			</div>
			<!-- /.navbar-collapse -->
		</div>
		<!-- /.container -->
	</nav>
</body>
<script src="resources/mainPage/js/jquery-1.10.2.js"
	type="text/javascript"></script>
<script src="resources/mainPage/js/bootstrap.min.js"
	type="text/javascript"></script>
</html>