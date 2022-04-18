<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰 게시판</title>
	<style>
		.row {
			background-color: #F2F2F2;
		}
		
		#resNo {
			text-align: center;
			color: red;
		}
		
		#startext{
			color: #007bff;
		}
		
		.card-footer {
			margin-top: 10px;
		}
		
		#header_top {
			width: 100%;
			height: 50px;
			background-color: white;
			text-align: center;
			padding-top: 5px;
		}
		
		#header_top1{
			float: left;
		}
		
		#header_top2{
			float: right;
		}
		
		button{
			background-color: white;
			border: none;
		}
		
		#rvReplyList{
			width: 100%;
			height: 100%;
			border-radius: 8px;
			background-color: #f2f2f2;
			padding: 10px;
			margin: 10px auto;
			padding-left: 30px;
			padding-right: 30px;
		}
		
		#showBtn{
			border: 3px solid #007bff;
			border-radius: 5px;
		}
		
		#reContent{
			padding: .375rem .75rem;
			border: 1px solid #ced4da;
			border-radius: .25rem;
			transition: border-color .15s ease-in-out,box-shadow .15s ease-in-out;
		}
		
		#rev{
			position: relative;
			left: 90%;
		}
		
		#selectCondition{
			padding: 5px;
			position: relative;
		    color: #0152cc;
		    padding-right: 20px;
		    background-color: transparent;
		    background-image: url(https://assets.yanolja.com/50067aa09286b37af1b0f621401811a69cd649d4/202012171358/c36d0e8fe552b4b2e84e680465552fdb.svg);
		    background-position: 100% 8px;
		    background-repeat: no-repeat;
		    appearance: none;
		    border: none;
		}
		
		#select_div{
			background-color: white;
		}
		
		/* 마우스 클릭 이벤트 css */
		@charset 'UTF-8';
		
		.clickEffect{
		    position:fixed;
		    box-sizing:border-box;
		    border-style:solid;
		    border-color:#1b40ba;
		    border-radius:50%;
		    animation:clickEffect 0.4s ease-out;
		    z-index:99999;
		}
		
		@keyframes clickEffect{
		    0%{
		        opacity:1;
		        width:0.5em; height:0.5em;
		        margin:-0.25em;
		        border-width:0.5em;
		    }
		    100%{
		        opacity:0.2;
		        width:15em; height:15em;
		        margin:-7.5em;
		        border-width:0.03em;
		    }
		}
	</style>
<link rel="shortcut icon" type="image⁄x-icon" href="/resources/image/calendar-icon.png">
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
<script src="resources/js/star.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

</head>
<body>
	<div class="container-fluid gedf-wrapper">
		<div class="row">
			<div class="col-md-3"></div>
			<div class="col-md-6 gedf-main">

				<!--- \\\\\\\Post-->
				<div class="card gedf-card">
				<div id="header_top">
					<div id="header_top1">
						<a href="javascript:history.go(-1);">
							<button><img src="//yaimg.yanolja.com/joy/sunny/static/images/btn-back-v7.svg"></button>
						</a>
					</div>
					<div id="header_top2">
						<a href="home.do">
							<button><img src="//yaimg.yanolja.com/joy/sunny/static/images/btn-home-v7.svg"></button>
						</a>
					</div>
				</div>
					<c:if test="${loginMember.reservation == 'N' }">
						<p id="resNo">예약 후 이용해라</p>
					</c:if>
					<c:if test="${loginMember.reservation == 'Y' }">
						<form action="reviewInsert.do" method="post" name="reviewform"
							enctype="multipart/form-data">
							<table align="center">
								<tr>
									<td rowspan="2"><input type="hidden" name="vWriter" value="${loginMember.memberId }"></td>
									<td width="500" height="50" colspan="2">
										<div id="rating" align="center">
											<span> 
												<img id="image1" onmouseover="show(1)" onclick="mark(1)" onmouseout="noshow(1)" src="resources/images/starOff.png">
												<img id="image2" onmouseover="show(2)" onclick="mark(2)" onmouseout="noshow(2)" src="resources/images/starOff.png">
												<img id="image3" onmouseover="show(3)" onclick="mark(3)" onmouseout="noshow(3)" src="resources/images/starOff.png">
												<img id="image4" onmouseover="show(4)" onclick="mark(4)" onmouseout="noshow(4)" src="resources/images/starOff.png">
												<img id="image5" onmouseover="show(5)" onclick="mark(5)" onmouseout="noshow(5)" src="resources/images/starOff.png">
											</span>
											<br/>
											<span id="startext">별점주기</span>
										</div>
										<input type="hidden" name="vStar"/> 
										<input type="hidden" name="vNo" value="${vNo }"/>
									</td>
								</tr>
							</table>
							<div class="card-header">
								<ul class="nav nav-tabs card-header-tabs" id="myTab" role="tablist">
									<li class="nav-item"><a class="nav-link active" id="posts-tab" data-toggle="tab" href="#posts" role="tab" aria-controls="posts" aria-selected="true">Content</a></li>
									<li class="nav-item"><a class="nav-link" id="images-tab" data-toggle="tab" role="tab" aria-controls="images" aria-selected="false" href="#images">Images</a></li>
								</ul>
							</div>
							<div class="card-body">
								<div class="tab-content" id="myTabContent">
									<div class="tab-pane fade show active" id="posts" role="tabpanel" aria-labelledby="posts-tab">
										<div class="form-group">
											<label class="sr-only" for="message">post</label>
											<textarea class="form-control" name="vContent" id="message" rows="3" placeholder="리뷰를 작성해주세요."></textarea>
										</div>
									</div>
									<div class="tab-pane fade" id="images" role="tabpanel"
										aria-labelledby="images-tab">
										<div class="form-group">
											<div class="custom-file">
												<input type="file" class="custom-file-input" id="customFile" name="uploadFile">
												<label class="custom-file-label" for="customFile">Upload image</label>
											</div>
										</div>
										<div class="py-4"></div>
									</div>
								</div>
								<div class="btn-toolbar justify-content-between">
									<div class="btn-group">
										<button type="submit" class="btn btn-primary">글쓰기</button>
									</div>
								</div>
							</div>
						</form>
					</c:if>
				</div>
				<br>
				<!-- Post /////-->
				<div class="card-header" id="select_div">
					<form action="reviewSelect.do" method="get">
						<input type="hidden" name="vNo" value="${vNo }">
						<select id="selectCondition" name="selectCondition" onchange="formChange(this.form)">
							<option value="new" <c:if test="${select.selectCondition == 'new' }">selected</c:if>>전체 글보기</option>
							<option value="starUp" <c:if test="${select.selectCondition == 'starUp' }">selected</c:if>>별점 높은순</option>
							<option value="starDown" <c:if test="${select.selectCondition == 'starDown' }">selected</c:if>>별점 낮은순</option>
						</select>
						
					</form>
					
				</div>
				<!--- \\\\\\\Post-->
				<c:if test="${vStar != 0 }">
					<c:forEach items="${vList }" var="review">
						<div class="card gedf-card">
							<div class="card-header">
								<div class="d-flex justify-content-between align-items-center">
									<div class="d-flex justify-content-between align-items-center">
										<c:if test="${review.vStar == 1 }">
											<div class="mr-2">
												<img class="rounded-circle" width="45" src="resources/images/1.png" alt="">
											</div>
											<div class="ml-2">
												<div class="h5 m-0">${review.vWriter }</div>
												<div class="h7 text-muted">
													<img style="width: 20px; height: 20px;" src="resources/images/starOn.png">
												</div>
											</div>
										</c:if>
										<c:if test="${review.vStar == 2 }">
											<div class="mr-2">
												<img class="rounded-circle" width="45" src="resources/images/2.png" alt="">
											</div>
											<div class="ml-2">
												<div class="h5 m-0">${review.vWriter }</div>
												<div class="h7 text-muted">
													<img style="width: 20px; height: 20px;" src="resources/images/starOn.png">
													<img style="width: 20px; height: 20px;" src="resources/images/starOn.png">
												</div>
											</div>
										</c:if>
										<c:if test="${review.vStar == 3 }">
											<div class="mr-2">
												<img class="rounded-circle" width="45" src="resources/images/3.png" alt="">
											</div>
											<div class="ml-2">
												<div class="h5 m-0">${review.vWriter }</div>
												<div class="h7 text-muted">
													<img style="width: 20px; height: 20px;" src="resources/images/starOn.png">
													<img style="width: 20px; height: 20px;" src="resources/images/starOn.png">
													<img style="width: 20px; height: 20px;" src="resources/images/starOn.png">
												</div>
											</div>
										</c:if>
										<c:if test="${review.vStar == 4 }">
											<div class="mr-2">
												<img class="rounded-circle" width="45" src="resources/images/4.png" alt="">
											</div>
											<div class="ml-2">
												<div class="h5 m-0">${review.vWriter }</div>
												<div class="h7 text-muted">
													<img style="width: 20px; height: 20px;" src="resources/images/starOn.png">
													<img style="width: 20px; height: 20px;" src="resources/images/starOn.png">
													<img style="width: 20px; height: 20px;" src="resources/images/starOn.png">
													<img style="width: 20px; height: 20px;" src="resources/images/starOn.png">
												</div>
											</div>
										</c:if>
										<c:if test="${review.vStar == 5 }">
											<div class="mr-2">
												<img class="rounded-circle" width="45" src="resources/images/5.png" alt="">
											</div>
											<div class="ml-2">
												<div class="h5 m-0">${review.vWriter }</div>
												<div class="h7 text-muted">
													<img style="width: 20px; height: 20px;" src="resources/images/starOn.png">
													<img style="width: 20px; height: 20px;" src="resources/images/starOn.png">
													<img style="width: 20px; height: 20px;" src="resources/images/starOn.png">
													<img style="width: 20px; height: 20px;" src="resources/images/starOn.png">
													<img style="width: 20px; height: 20px;" src="resources/images/starOn.png">
												</div>
											</div>
										</c:if>
									</div>
									<div>
										<div class="dropdown">
											<button class="btn btn-link dropdown-toggle" type="button" id="gedf-drop1" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
												<i class="fa fa-ellipsis-h"></i>
											</button>
											<div class="dropdown-menu dropdown-menu-right" aria-labelledby="gedf-drop1">
												<div class="h6 dropdown-header">설정</div>
												<c:if test="${loginMember.memberId eq review.vWriter}">
													<c:url var="vDelete" value="reviewDelete.do">
														<c:param name="vId" value="${review.vId }"></c:param>
													</c:url>
													<c:url var="vUpdate" value="reviewUpdateView.do">
														<c:param name="vId" value="${review.vId }"></c:param>
														<c:param name="page" value="${currentPage }"></c:param>
													</c:url>
													<a class="dropdown-item" href="${vUpdate }">수정</a>
													<a class="dropdown-item" href="${vDelete }">삭제</a>
												</c:if>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="card-body">
								<div class="text-muted h7 mb-2">
									<i class="fa fa-clock-o"></i>${review.vCreateDate }</div>
								<pre style="font-family : 'Nanum Brush Script', 필기체;">${review.vContent }</pre>
								<c:if test="${ !empty review.filePath }">
									<td>
										<img style="width: 200px; height: 100px; border-radius: 8px;" src="resources/reviewUploadFiles/${review.filePath }">
									</td>
								</c:if>
							</div>
							<c:if test="${loginMember.memberId eq 'admin'}">
							<button id="showBtn" onclick="showReply(this)">댓글달기</button>
							<div class="addRvReply" style="display: none;">
								<div class="card-footer">
									<textarea rows="3" cols="100" id="reContent" style="width: 100%;" placeholder="댓글을 작성해주세요."></textarea>
									<a href="#" id="rev" class="card-link" onclick="reviewReply('${review.vId}', this)"><i class="fa fa-comment"></i>등록</a>
								</div>
							</div>
							</c:if>
								<c:forEach items="${review.rvReplyList }" var="rvReply">
									<div id="rvReplyList">
										<b>${rvReply.reWriter }</b><br>
										<c:url var="reDelete" value="rvReplyDelete.do">
											<c:param name="vId" value="${review.vId }"></c:param>
											<c:param name="reId" value="${rvReply.reId }"></c:param>
										</c:url>
										<c:if test="${loginMember.memberId eq 'admin'}">
											<div style="float:right;">
												<a href="${reDelete }">삭제</a>
											</div>
										</c:if>
										<i class="fa fa-clock-o"></i>${rvReply.reCreateDate }<br><br>
										<pre style="font-family : 'Nanum Brush Script', 필기체;">${rvReply.reContent }</pre>
									</div>
								</c:forEach>
						</div>
					</c:forEach>
				</c:if>
			</div>
			<div class="col-md-3">
			
			</div>
		</div>
	</div>
	
	<script>
		// 댓글창 열기
		function showReply(reply){	
			if($(reply).next().css("display") == "none"){
				$(reply).next().show();
			}else{
				$(reply).next().hide();
			}
		}
		
		// 댓글 등록
    	function reviewReply(vId, obj){
  			var reContent = $(obj).prev().val();
			var refBid = vId;
			$.ajax({
				url : "addRvReply.do",
				type : "post",
				data : { "reContent" : reContent, "refBid" : refBid },
				success : function(data) {
					location.reload();
				}
			});
		};
		
		// 마우스 클릭 이벤트
		function clickEffect(e){
			var d=document.createElement("div");
		    d.className="clickEffect";
		    d.style.top=e.clientY+"px";
		    d.style.left=e.clientX+"px";
		    document.body.appendChild(d);
		    d.addEventListener('animationend',function()
		        {d.parentElement.removeChild(d);}.bind(this)
		    );
		}
		//document에 clickEffect function 등록
		document.addEventListener('click',clickEffect);
		
		// selectBox submit
		function formChange(obj){
			obj.submit();
		}
    </script>
</body>
</html>