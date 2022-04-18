<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
   <meta charset="utf-8">
   <meta http-equiv="X-UA-Compatible" content="IE=edge">
   <meta name="viewport" content="width=device-width, initial-scale=1">
   <script
   src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
   <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
   <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->

   <title>Booking Form HTML Template</title>
<link rel="shortcut icon" type="image⁄x-icon" href="/resources/image/calendar-icon.png">
   <!-- Google font -->
   <link href="http://fonts.googleapis.com/css?family=Playfair+Display:900" rel="stylesheet" type="text/css" />
   <link href="http://fonts.googleapis.com/css?family=Alice:400,700" rel="stylesheet" type="text/css" />

   <!-- Bootstrap -->
   <link type="text/css" rel="stylesheet" href="resources/css/bootstrap.min.css" />

   <!-- Custom stlylesheet -->
   <link type="text/css" rel="stylesheet" href="resources/css/style.css" />
   <link rel="stylesheet"
   href="https://fonts.googleapis.com/css?family=Montserrat">

   <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
   <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
   <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
        <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
      <![endif]-->
</head>
<script>
function getSelectValue(frm)
{
   var price = ${place.price};
   var usePoint =$("#usePoint").val();
   
    frm.rPrice.value = frm.headCount.options[frm.headCount.selectedIndex].text * price - usePoint;
    frm.rPoint.value = frm.rPrice.value * 0.01;
}


$(document).ready(function(){

   var price = ${place.price} * 0.01;
   
   $("#rPoint").val(price);
   
   
   $("#usePoint").on("keyup",function(){
      
       var val = $(this).val();
     /*  $(this).val(val.replace(/\D/g, '')); */
      
       if(this.value > parseInt($("#myPoint").val())) {
          alert("보유한 포인트보다 많습니다.");
              $(this).val("");
          }
   });
   
   
   $("#usePoint").on("blur",function(){
      var price = $("#rPrice").val(); 
      var usePoint = parseInt(this.value);
      var addPoint = $("#rPoint").val();
      
   var sumPrice = price - usePoint;
   var sumPoint = parseInt(sumPrice * 0.01);
   
   $("#rPrice").val(sumPrice);
   $("#rPoint").val(sumPoint);
   
      
   })
   });


</script>
<body>
   <div id="booking" class="section">
      <div class="section-center">
         <div class="container">
            <div class="row">
               <div class="booking-form">
                  <div class="booking-bg">
                     <div class="form-header">
                        <h2>MoP Reservation</h2>
                     </div>
                  </div>
                  <form id="payForm" action="payment.do" method="post">
                     <div class="row">
                        <div class="col-md-6">
                           <div class="form-group">
                              <span class="form-label">예약 날짜</span>
                              <input class="form-control" type="date" name="rDate" required>
                           </div>
                        </div>
                        <div class="col-md-6">
                           <div class="form-group">
                              <span class="form-label">예약 시간</span>
                              <input class="form-control" type="time" name="rDate" required>
                           </div>
                        </div>
                     </div>
                     <div class="row">
                        <div class="col-md-6">
                           <div class="form-group">
                              <span class="form-label">예약자 이름</span>
                              <input class="form-control" type="text" value="${loginMember.memberName }" name="rMemberName" readonly> 
                              <input type="hidden" name="rPlace" value="${place.pName }">
                              <input type="hidden" name="rMemberId" value="${loginMember.memberId }">
                              <!--  고쳐주세요  멤바 로그인 유저 -->
                              <span class="select-arrow"></span>
                           </div>
                        </div>
                        <div class="col-md-6">
                           <div class="form-group">
                              <span class="form-label">인원수</span>
                              <select class="form-control" id="headCount" name="rPeople" onChange="getSelectValue(this.form);">

                              </select>
                              <span class="select-arrow"></span>
                           </div>
                        </div>
                     </div>
                     
                     <div class="row">
                        <div class="col-md-6">
                           <div class="form-group">
                              <span class="form-label">나의 포인트</span>
                              <input class="form-control" type="text" id="myPoint" value="${loginMember.won }" name="won" readonly> 
                              <span class="select-arrow"></span>
                           </div>
                        </div>
                        <div class="col-md-6">
                           <div class="form-group">
                              <span class="form-label">사용할 포인트</span>
                              <input class="form-control" type="number" step="100" max="${loginMember.won }" id="usePoint" name="usePoint" value="0" />

                              </select>
                              <span class="select-arrow"></span>
                           </div>
                        </div>
                     </div>
                     
                     <div class="form-group">
                        <span class="form-label">예약자 전화번호</span>
                        <input class="form-control" name="rPhone" type="text">
                        <span class="select-arrow"></span>
                     </div>
                     
                     <div class="row">
                     <div class="col-md-6">
                     <div class="form-group">
                        <span class="form-label">총 합계</span>
                        <input class="form-control" id="rPrice" name="rPrice" value="${place.price }"readonly>
                        <span class="select-arrow"></span>
                     </div>
                     </div>
                     
                     <div class="col-md-6">
                     <div class="form-group">
                        <span class="form-label">적립 예정 포인트</span>
                        
                        <fmt:parseNumber var="point" integerOnly="true" value="${place.price * 0.01}"/>
                        <input class="form-control" id="rPoint" name=rPoint value="${point}" readonly>
                        <span class="select-arrow"></span>
                     </div>
                     </div>
                     
                     </div>
                     <div class="form-btn">
                        <input type="submit" class="submit-btn" value="결제하기">
                     </div>
                  </form>
               </div>
            </div>
         </div>
      </div>
   </div>
</body><!-- This templates was made by Colorlib (https://colorlib.com) -->
<script>

$(function(){
   
   var point = ${place.price * 0.01}; 
   
   $("#rPoint").append(point);
   var count = ${place.pMax};
   
   for(var i = 0; i<count; i++){
      $("#headCount").append('<option value="' + (i+1) + '">' + (i+1) +'</option>');
}});

</script>



</html>