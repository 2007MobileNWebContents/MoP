<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<style>
.modal-content {
	width: 770px;
	color: black;
}

label {
	width: 600px;
}

#calendar {
	position: relative;
	top: -30px;
}

#list {
	color: white;
	float: right;
	margin-top: -600px;
}
</style>

<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>단체 스케줄러</title>
<link rel=" shortcut icon" href="image/favicon.ico">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet"
	href="resources/vendorGroup/css/fullcalendar.min.css" />
<link rel="stylesheet"
	href="resources/vendorGroup/css/bootstrap.min.css" />
<link rel="stylesheet" href='resources/vendorGroup/css/select2.min.css' />
<link rel="stylesheet"
	href='resources/vendorGroup/css/bootstrap-datetimepicker.min.css' />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Open+Sans:400,500,600">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/icon?family=Material+Icons">

<link rel="stylesheet" href="resources/cssGroup/main2.css">

</head>

<body style="background-color: black;">
	<div class="container">
		<!-- 일자 클릭시 메뉴오픈 -->
		<div id="contextMenu" class="dropdown clearfix">
			<ul class="dropdown-menu dropNewEvent" role="menu"
				aria-labelledby="dropdownMenu"
				style="display: block; position: static; margin-bottom: 5px;">
				<li><a tabindex="-1" href="#">Meal</a></li>
				<li><a tabindex="-1" href="#">Meeting</a></li>
				<li><a tabindex="-1" href="#">Business</a></li>
				<li><a tabindex="-1" href="#">Travel</a></li>
				<li class="divider"></li>
				<li><a tabindex="-1" href="#" data-role="close">Close</a></li>
			</ul>
		</div>

		<div id="wrapper">
			<div id="loading"></div>
			<div id="calendar" style="width: 750px; margin-top: 120px;"></div>
			<div id="list">
				<div class="w3-half" id="move"
					style="width: 300px; float: right; top: -30px;">
					<ul
						class="w3-ul w3-white w3-center w3-opacity w3-hover-opacity-off">
						<!--  cif 추가  -->

						<li class="w3-dark-grey w3-xlarge w3-padding-32">${loginMember.memberId }님
							환영합니다<a href="home.do" style="color: black;"><i
								class="fa fa-home fa-lg" aria-hidden="true"></i></a>
						</li>
						<c:set var="List" value="${requestScope['json'].List}" />

						<c:forEach items="${gList }" var="schedulerGroup"
							varStatus="status">

							<li class="w3-padding-16"><c:out
									value="${schedulerGroup.title }" /><br>
									인원수 : <c:out
									value="${schedulerGroup.schedulerGroup }" />
									
									</li>


						</c:forEach>

					</ul>
				</div>
			</div>


		</div>


		<!-- 일정 추가 MODAL -->
		<div class="modal fade" tabindex="-1" role="dialog" id="eventModal">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
						<h4 class="modal-title"></h4>
					</div>
					<div class="modal-body">
						<input class='allDayNewEvent' id="edit-id" type="hidden"
							name="edit-id">
						<div class="row">
							<div class="col-xs-12">
								<label class="col-xs-4" for="edit-allDay">하루종일</label> <input
									class='allDayNewEvent' id="edit-allDay" type="checkbox"
									name="edit-allDay"></label>
							</div>
						</div>

						<div class="row">
							<div class="col-xs-12">
								<label class="col-xs-4" for="edit-title">일정명</label> <input
									class="inputModal" type="text" name="edit-title"
									id="edit-title" required="required" />
							</div>
						</div>
						<div class="row">
							<div class="col-xs-12">
								<label class="col-xs-4" for="edit-start">시작</label> <input
									class="inputModal" type="text" name="edit-start"
									id="edit-start" />
							</div>
						</div>
						<div class="row">
							<div class="col-xs-12">
								<label class="col-xs-4" for="edit-end">끝</label> <input
									class="inputModal" type="text" name="edit-end" id="edit-end" />
							</div>
						</div>
						<div class="row">
							<div class="col-xs-12">
								<label class="col-xs-4" for="edit-schedulergroup">인원수</label> <input
									class="inputModal" type="text" name="edit-schedulergroup"
									id="edit-schedulergroup"
									value="${schedulergroup.schedulerGroup }" />
							</div>
						</div>
						<div class="row">
							<div class="col-xs-12">
								<label class="col-xs-4" for="edit-type">구분</label> <select
									class="inputModal" type="text" name="edit-type" id="edit-type">
									<option value="Meeting">Meeting</option>
									<option value="Meal">Meal</option>
									<option value="Business">Business</option>
									<option value="Travel">Travel</option>
								</select>
							</div>
						</div>
						<div class="row">
							<div class="col-xs-12">
								<label class="col-xs-4" for="edit-color">색상</label> <select
									class="inputModal" name="textColor" id="edit-color">
									<option value="#D25565" style="color: #D25565;">빨간색</option>
									<option value="#9775fa" style="color: #9775fa;">보라색</option>
									<option value="#ffa94d" style="color: #ffa94d;">주황색</option>
									<option value="#74c0fc" style="color: #74c0fc;">파란색</option>
									<option value="#f06595" style="color: #f06595;">핑크색</option>
									<option value="#63e6be" style="color: #63e6be;">연두색</option>
									<option value="#a9e34b" style="color: #a9e34b;">초록색</option>
									<option value="#4d638c" style="color: #4d638c;">남색</option>
									<option value="#495057" style="color: #495057;">검정색</option>
								</select>
							</div>
						</div>
						<div class="row">
							<div class="col-xs-12">
								<label class="col-xs-4" for="edit-desc">설명</label>
								<textarea rows="4" cols="50" class="inputModal" name="edit-desc"
									id="edit-desc"></textarea>
							</div>
						</div>
					</div>
					<div class="modal-footer modalBtnContainer-addEvent">
						<button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
						<button type="button" class="btn btn-primary" id="save-event">저장</button>
					</div>
					<div class="modal-footer modalBtnContainer-modifyEvent">
						<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
						<button type="button" class="btn btn-danger" id="deleteEvent">삭제</button>
						<button type="button" class="btn btn-primary" id="updateEvent">저장</button>
					</div>
				</div>
				<!-- /.modal-content -->
			</div>
			<!-- /.modal-dialog -->
		</div>
		<!-- /.modal -->

		<div class="col-lg-6" style="display: none;">
			<label for="calendar_view">구분별</label>
			<div class="input-group">
				<select class="filter" id="type_filter" multiple="multiple">
					<option value="Meeting">Meeting</option>
					<option value="Meal">Meal</option>
					<option value="Business">Business</option>
					<option value="Travel">Travel</option>
				</select>
			</div>
		</div>

		<div class="col-lg-6" style="display: none;">
			<label for="calendar_view">등록자별</label>
			<div class="input-group">

				<label class="checkbox-inline"><input class='filter'
					type="checkbox" id="edit-username" value="${loginMember.memberId }"
					checked>${loginMember.memberId }</label>


			</div>
		</div>



		<!-- /.filter panel -->
	</div>
	<!-- /.container -->
	<script type="text/javascript"
		src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
	<script src="resources/vendorGroup/js/jquery.min.js"></script>
	<script src="resources/vendorGroup/js/bootstrap.min.js"></script>
	<script src="resources/vendorGroup/js/moment.min.js"></script>
	<script src="resources/vendorGroup/js/fullcalendar.min.js"></script>
	<script src="resources/vendorGroup/js/ko.js"></script>
	<script src="resources/vendorGroup/js/select2.min.js"></script>
	<script src="resources/vendorGroup/js/bootstrap-datetimepicker.min.js"></script>
	<script src="resources/jsGroup/main.js?after"></script>
	<script src="resources/jsGroup/addEvent.js"></script>
	<script src="resources/jsGroup/editEvent.js"></script>
	<script src="resources/jsGroup/etcSetting.js"></script>

</body>
<script>
   // 플로팅
   $(function() {
      var offset = $("#move").offset();
      var topPadding = 100;
      $(window).scroll(
            function() {
               if ($(window).scrollTop() > offset.top) {
                  $("#move").stop().animate(
                        {
                           marginTop : $(window).scrollTop()
                                 - offset.top + topPadding
                        });
               } else {
                  $("#move").stop().animate({
                     marginTop : 0
                  });
               }
               ;
            });
   });
   
   </script>
</html>
