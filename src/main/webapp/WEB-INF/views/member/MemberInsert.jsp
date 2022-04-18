<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>Mop - 회원가입</title>
<link rel="shortcut icon" type="image⁄x-icon" href="/resources/image/calendar-icon.png">
<link rel="stylesheet"
   href="https://fonts.googleapis.com/css?family=Montserrat">
<link
   href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css"
   rel="stylesheet" id="bootstrap-css">

<style>
body {
	font-family: 'Hanna';
}
.register {
   background: -webkit-linear-gradient(left, black, gray);
   margin-top: 3%;
   padding: 3%;
}
.register-left {
   text-align: center;
   color: #fff;
   margin-top: 4%;
}
.register-left input {
   border: none;
   border-radius: 1.5rem;
   padding: 2%;
   width: 60%;
   background: #f8f9fa;
   font-weight: bold;
   color: #383d41;
   margin-top: 30%;
   margin-bottom: 3%;
   cursor: pointer;
}
.register-right {
   background: #f8f9fa;
   border-top-left-radius: 10% 50%;
   border-bottom-left-radius: 10% 50%;
}
.register-left img {
   margin-top: 15%;
   margin-bottom: 5%;
   width: 25%;
   -webkit-animation: mover 2s infinite alternate;
   animation: mover 1s infinite alternate;
}
/* The Modal (background) */
.modal {
   display: none; /* Hidden by default */
   position: fixed; /* Stay in place */
   z-index: 1; /* Sit on top */
   left: 0;
   top: 0;
   width: 100%; /* Full width */
   height: 100%; /* Full height */
   background-color: rgb(0, 0, 0); /* Fallback color */
   background-color: rgba(0, 0, 0, 0.4); /* Black w/ opacity */
   padding-top: 60px;
}
/* Modal Content/Box */
.modal-content {
   background-color: #fefefe;
   margin: 5% auto 15% auto;
   /* 5% from the top, 15% from the bottom and centered */
   border: 1px solid #888;
   width: 40%; /* Could be more or less, depending on screen size */
}
@-webkit-keyframes mover {
    0% {
   transform: translateY(0);
}
100%{
    transform: translateY(-20px);
    }
}
@keyframes mover { 
    0% {
   transform: translateY(0);
}
    100%{
        transform: translateY(-20px);
    }
}
.register-left p {
   font-weight: lighter;
   padding: 12%;
   margin-top: -9%;
}
.register .register-form {
   padding: 10%;
   margin-top: 10%;
}
.btnRegister {
   float: right;
   margin-top: 10%;
   border: none;
   border-radius: 1.5rem;
   padding: 2%;
   background: #0062cc;
   color: #fff;
   font-weight: 600;
   width: 50%;
   cursor: pointer;
}
.register .nav-tabs {
   margin-top: 3%;
   border: none;
   background: #0062cc;
   border-radius: 1.5rem;
   width: 28%;
   float: right;
}
.register .nav-tabs .nav-link {
   padding: 2%;
   height: 34px;
   font-weight: 600;
   color: #fff;
   border-top-right-radius: 1.5rem;
   border-bottom-right-radius: 1.5rem;
}
.register-heading {
   text-align: center;
   margin-top: 8%;
   margin-bottom: -15%;
   color: #495057;
}
body {
    margin: 0;
    font-family: -apple-system,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif,"Apple Color Emoji","Segoe UI Emoji","Segoe UI Symbol";
    font-size: 1rem;
    font-weight: 400;
    line-height: 1.5;
    color: #212529;
    text-align: left;
    background-color: #100403;
}
#postcodify_search_button {
	background-color: black;
	color: white;
	font-size : medium;
}
</style>
</head>
<body>
<script
   src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script
   src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript"
    src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<script>
    $("#memberId").on("blur",function(){
      var memberId = $(this).val();
      //아이디가 4글자 미만인경우
      if(memberId.length <4){
         $(".guide").hide();
         $("#idDuplicateCheck").val(0);
         alert("아이디가너무짧습니다.")
      return;
      }
      $.ajax({
         url:"dupId.do",
         data: {"memberId":memberId},
         success: function(result)
      {
         
         if(result=="true"){
               $(".guide.error").hide();
               $(".guide.ok").show();
               $("#idDuplicateCheck".val(1));
         }else if(result="false"){
               $(".guide.ok").hide();
               $(".guide.error").show();
               $("#idDuplicateCheck").val(0);
         }
      }   
   });
});
 </script>
   <form action="insert.do" method="post">
      <div class="container register">
         <div class="row">
            <div class="col-md-3 register-left">
               <img src="/resources/image/calendar-icon.png" alt="" />
               <h3>Welcome</h3>
               <p>MOP 회원가입</p>
               <input type="button" value="Login" onclick="javascript:location.href='/loginView.do';"/><br />
            </div>
            <div class="col-md-9 register-right">
               <div class="tab-content" id="myTabContent">
                  <div class="tab-pane fade show active" id="home" role="tabpanel"
                     aria-labelledby="home-tab">
                     <h3 class="register-heading"><b>MoP 회원 가입 </b></h3>
                     <div class="row register-form">
                        <div class="col-md-6">
                           <div class="form-group">
                              <input type="text" class="form-control" placeholder="아이디 *" name="memberId" id="memberId"/> 
                              <input type="hidden" id="idDuplicateCheck" value="0">
                           </div>
                           <div class="form-group">
                              <input type="password" class="form-control"
                                 placeholder="비밀번호 *" name="memberPwd" id="pwd"/>
                           </div>
                           <div class="form-group">
                              <input type="text" class="form-control" placeholder="이름 *"
                                 name="memberName" id="memberName"/>
                           </div>
                           <div class="form-group">
                              <input type="text" minlength="10" maxlength="11"
                                  class="form-control" id="phone"placeholder="전화번호 *"
                                 name="phone" />
                           </div>
                           <div class="form-group">
                              <input type="email" id="email" class="form-control" placeholder="이메일 *"
                                 name="email" />
                           </div>
                           <div class="form-group">
                              <div class="maxl" >
                                 <label class="radio inline"> <input type="radio"
                                    name="bank" id="bank" value="국민"><img
                                    src="https://ssl.pstatic.net/static.checkout/layout/202012101632/images/customer/bi_kbbank_70_22.png"
                                    width="70" height="22" alt="국민은행">
                                 </label> 
                                 <label class="radio inline"> <input
                                    type="radio" name="bank" id="bank" value="IBK기업"><img
                                    src="https://ssl.pstatic.net/static.checkout/layout/202012101632/images/customer/bi_ibk_70_22.png"
                                    width="70" height="22" alt="기업은행">
                                 </label>  
                                 <label class="radio inline"> <input
                                    type="radio" name="bank" id="bank" value="농협"><img
                                    src="https://ssl.pstatic.net/static.checkout/layout/202012101632/images/customer/bi_nh_70_22.png"
                                    width="70" height="22" alt="농협은행">
                                 </label>
                                 <label class="radio inline"> <input
                                    type="radio" name="bank" id="bank" value="신한"><img
                                    src="https://ssl.pstatic.net/static.checkout/layout/202012101632/images/customer/bi_sinhanbank_70_22.png"
                                    width="70" height="22" alt="신한은행">
                                 </label> 
                                 <label class="radio inline"> <input
                                    type="radio" name="bank" id="bank" value="우리"><img
                                    src="https://ssl.pstatic.net/static.checkout/layout/202012101632/images/customer/bi_woori_70_22.png"
                                    width="70" height="22" alt="우리은행">
                                 </label> 
                                 <label class="radio inline"> <input
                                    type="radio" name="bank" id="bank" value="카카오"><img
                                    src="https://ssl.pstatic.net/static.checkout/layout/202012101632/images/customer/bi_bank_090_70_22.png"
                                    width="70" height="22" alt="카카오">
                                 </label> 
                                 <label class="radio inline"> <input
                                    type="radio" name="bank" id="bank" value="하나"><img
                                    src="https://ssl.pstatic.net/static.checkout/layout/202012101632/images/customer/bi_bank_081_70_22.png"
                                    width="70" height="22" alt="하나은행">
                                 </label> 
                                 <label class="radio inline">
                                 <input
                                    type="radio" name="bank" id="bank" value="새마을금고"><img
                                    src="https://ssl.pstatic.net/static.checkout/layout/202012101632/images/customer/bi_bank_045_70_22.png"
                                    width="70" height="22" alt="새마을금고">
                                 </label>
                                 <label class="radio inline">
                                 <input type="radio" name="bank" id="bank" value="신협"><img
                                    src="https://ssl.pstatic.net/static.checkout/layout/202012101632/images/customer/bi_bank_048_70_22.png"
                                    width="70" height="22" alt="신협">
                                 </label>
                              </div>
                           </div>
                        </div>
                        <div class="col-md-6">
                           <div class="form-group">
                              <input type="text" class="form-control" placeholder="계좌번호 *" id="accountNumber"
                                 name="accountNumber" />
                           </div>
                           <div class="form-group">
                              <input type="text" class="postcodify_postcode5"  size="6"placeholder="  우편번호 *"
                                 name="zipCode" style="width: 200px; float: left;" />
                              <button type="button" id="postcodify_search_button">검색</button>
                              </div>
                              <div>
                              <input type="text" class="postcodify_address" placeholder="  주소 *" name="addr"/>
                           </div>
                              <script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js">
                              </script>
                              <script>
                              $(function(){
                                    $("#postcodify_search_button").postcodifyPopUp();
                                 });
                              </script>
                           <input type="submit" class="btnRegister" value="Register" style="background-color:black;" />
                        </div>
                     </div>
                  </div>
               </div>
            </div>
         </div>

      </div>
   </form>
</body>
</html>