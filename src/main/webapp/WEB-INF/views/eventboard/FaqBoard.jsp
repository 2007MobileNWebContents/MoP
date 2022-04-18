<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<link rel="shortcut icon" type="image⁄x-icon" href="/resources/image/calendar-icon.png">
<head>
    <meta charset="UTF-8">
    <title>QnA게시판</title>
<style>
    .col-xs-10{
        overflow: hidden;
        background: url(http://tong.visitkorea.or.kr/kor/menupan/_images/faq_q.gif) 10px 12px no-repeat;
        padding: 12px 0 5px 40px;
        color: black;
        font-weight: bold;
    }
    .col-xs-11{
        overflow: hidden;
        background: url(http://tong.visitkorea.or.kr/kor/menupan/_images/faq_a.gif) 10px 6px no-repeat;
        padding: 5px 0 10px 40px;
        border-bottom: 1px solid #ddd;
        color: black;
        margin-left: -10px;
    }
    p{
        position: relative;
        left: 20px;
    }
    body {
    	background-color : black;
    }
</style>
</head>
<body style="background-color:black; position: relative; top:150px;">
<link href="//netdna.bootstrapcdn.com/bootstrap/3.1.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//netdna.bootstrapcdn.com/bootstrap/3.1.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<jsp:include page="../common/sidenav.jsp"></jsp:include>
<link rel="stylesheet" href="//netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.min.css">
<div class="container" style="background-color:black;">
   <div class="panel panel-default">
        <div class="panel-heading">
            <h3 class="panel-title">자주 묻는 질문</h3>
        </div>   
        <ul class="list-group">
            <li class="list-group-item">
                <div class="row toggle" id="dropdown-detail-1" data-toggle="detail-1">
                    <div class="col-xs-10">
                        &ensp;&ensp;&ensp;회원가입은 어디서 하나요?
                    </div>
                    <div class="col-xs-2"><i class="fa fa-chevron-down pull-right"></i></div>
                </div>
                <div id="detail-1">
                    <hr></hr>
                    <div class="container">
                        <div class="fluid-row">
                            <div class="col-xs-11">
                                <p>잘 보세요</p>
                            </div>
                        </div>
                    </div>
                </div>
            </li>
            <li class="list-group-item">
                <div class="row toggle" id="dropdown-detail-2" data-toggle="detail-2">
                    <div class="col-xs-10">
                        &ensp;&ensp;&ensp;포인트는 어떻게 얻나요?
                    </div>
                    <div class="col-xs-2"><i class="fa fa-chevron-down pull-right"></i></div>
                </div>
                <div id="detail-2">
                    <hr></hr>
                    <div class="container">
                        <div class="fluid-row">
                            <div class="col-xs-11">
                                <p>돈 쓰면요</p>
                            </div>
                        </div>
                    </div>
                </div>
            </li>
            <li class="list-group-item">
                <div class="row toggle" id="dropdown-detail-3" data-toggle="detail-3">
                    <div class="col-xs-10">
                        &ensp;&ensp;&ensp;얻은 포인트로 무엇을 할 수 있나요?
                    </div>
                    <div class="col-xs-2"><i class="fa fa-chevron-down pull-right"></i></div>
                </div>
                <div id="detail-3">
                    <hr></hr>
                    <div class="container">
                        <div class="fluid-row">
                            <div class="col-xs-11">
                                <p>쓰세요</p>
                            </div>
                        </div>
                    </div>
                </div>
            </li>
            <li class="list-group-item">
                <div class="row toggle" id="dropdown-detail-4" data-toggle="detail-4">
                    <div class="col-xs-10">
                        &ensp;&ensp;&ensp;스케쥴은 어디서 잡나요?
                    </div>
                    <div class="col-xs-2"><i class="fa fa-chevron-down pull-right"></i></div>
                </div>
                <div id="detail-4">
                    <hr></hr>
                    <div class="container">
                        <div class="fluid-row">
                            <div class="col-xs-11">
                                <p>잘 찾아보세요</p>
                            </div>
                        </div>
                    </div>
                </div>
            </li>
            <li class="list-group-item">
                <div class="row toggle" id="dropdown-detail-5" data-toggle="detail-5">
                    <div class="col-xs-10">
                        &ensp;&ensp;&ensp;게시판 종류를 알고 싶어요
                    </div>
                    <div class="col-xs-2"><i class="fa fa-chevron-down pull-right"></i></div>
                </div>
                <div id="detail-5">
                    <hr></hr>
                    <div class="container">
                        <div class="fluid-row">
                            <div class="col-xs-11">
                                <p>메인에 있어요</p>
                            </div>
                        </div>
                    </div>
                </div>
            </li> 
        </ul>
   </div>
</div>
<script>
    $(document).ready(function() {
    $('[id^=detail-]').hide();
    $('.toggle').click(function() {
        $input = $( this );
        $target = $('#'+$input.attr('data-toggle'));
        $target.slideToggle();
    });
});
</script>
</body>
</html>