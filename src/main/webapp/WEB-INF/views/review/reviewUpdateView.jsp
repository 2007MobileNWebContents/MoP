<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰 게시글 수정</title>
	<style>
		.row{
			background-color: #F2F2F2;
		}
		#resNo{
			text-align: center;
			color: red;
		}
		.card-footer{
			margin-top: 10px;
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
<!------ Include the above in your HEAD tag ---------->

<link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">    
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
<script src="resources/js/star.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
</head>
<body>
    <div class="container-fluid gedf-wrapper">
        <div class="row">
            <div class="col-md-3">

            </div>
            <div class="col-md-6 gedf-main">

                <!--- \\\\\\\Post-->
                <div class="card gedf-card">
                 <c:if test="${loginMember.reservation == 'N' }">
					<p id="resNo">예약 후 이용해라</p>
				</c:if>
				<c:if test="${loginMember.reservation == 'Y' }">
                <form action="reviewUpdate.do" method="post" name="reviewform" enctype="multipart/form-data">
                	<input type="hidden" name="vId" value="${review.vId }">
					<input type="hidden" name="filePath" value="${review.filePath }">
                   	<table>
					<tr>
						<td width="100" rowspan="2"><input type="hidden" name="vWriter" value="${review.vWriter }"></td>
						<td width="500" height="50" colspan="2">
						<div id="rating" align="center">
							<span> <img id="image1" onmouseover="show(1)" onclick="mark(1)" onmouseout="noshow(1)" src="resources/images/starOff.png">
							<img id="image2" onmouseover="show(2)" onclick="mark(2)" onmouseout="noshow(2)" src="resources/images/starOff.png">
							<img id="image3" onmouseover="show(3)" onclick="mark(3)" onmouseout="noshow(3)" src="resources/images/starOff.png">
							<img id="image4" onmouseover="show(4)" onclick="mark(4)" onmouseout="noshow(4)" src="resources/images/starOff.png">
							<img id="image5" onmouseover="show(5)" onclick="mark(5)" onmouseout="noshow(5)" src="resources/images/starOff.png">
							</span>
							<br/> 
							<span id="startext">평가하기</span>
						</div>
						<input type="hidden" name="vStar" value="${review.vStar }"/>
						<input type="hidden" name="vNo" value="${review.vNo }"/>
						</td>
					</tr>
				</table>
                    <div class="card-header">
                        <ul class="nav nav-tabs card-header-tabs" id="myTab" role="tablist">
                            <li class="nav-item">
                                <a class="nav-link active" id="posts-tab" data-toggle="tab" href="#posts" role="tab" aria-controls="posts" aria-selected="true">Content</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" id="images-tab" data-toggle="tab" role="tab" aria-controls="images" aria-selected="false" href="#images">Images</a>
                            </li>
                        </ul>
                    </div>
                    <div class="card-body">
                        <div class="tab-content" id="myTabContent">
                            <div class="tab-pane fade show active" id="posts" role="tabpanel" aria-labelledby="posts-tab">
                                <div class="form-group">
                                    <label class="sr-only" for="message">post</label>
                                    <textarea class="form-control" name="vContent" id="message" rows="3">${review.vContent }</textarea>
                                </div>

                            </div>
                            <div class="tab-pane fade" id="images" role="tabpanel" aria-labelledby="images-tab">
                                <div class="form-group">
                                    <div class="custom-file">
                                        <input type="file" class="custom-file-input" id="customFile" name="reloadFile">
                                        <label class="custom-file-label" for="customFile">Upload image</label>
                                    </div>
                                </div>
                                <div class="py-4"></div>
                            </div>
                        </div>
                        <div class="btn-toolbar justify-content-between">
                            <div class="btn-group">
                                <button type="submit" class="btn btn-primary">수정</button>
                            </div>
                        </div>
                    </div>
                    </form>
                    </c:if>
                </div>
               
                <!-- Post /////-->

                <!--- \\\\\\\Post-->
            </div>
            <div class="col-md-3">
            
            </div>
        </div>
    </div>
    <script>
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
	</script>
</body>
</html>