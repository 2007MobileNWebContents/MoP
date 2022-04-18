   var locked = 0;

   function show(star) {
      if (locked)
         return;
      var i;
      var image;
      var el;
      var e = document.getElementById('startext');
      var stateMsg;

      for (i = 1; i <= star; i++) {
         image = 'image' + i;
         el = document.getElementById(image);
         el.src = "resources/images/starOn.png";
      }

      switch (star) {
      case 1:
         stateMsg = "매우 구림";
         break;
      case 2:
         stateMsg = "구림";
         break;
      case 3:
         stateMsg = "보통";
         break;
      case 4:
         stateMsg = "좋음";
         break;
      case 5:
         stateMsg = "매우 좋음";
         break;
      default:
         stateMsg = "";
      }
      e.innerHTML = stateMsg;
   }

   function noshow(star) {
      if (locked)
         return;
      var i;
      var image;
      var el;

      for (i = 1; i <= star; i++) {
         image = 'image' + i;
         el = document.getElementById(image);
         el.src = "resources/images/starOff.png";
      }
   }

   function lock(star) {
      show(star);
      locked = 1;
   }

   function mark(star) {
      lock(star);
      swal({
        title: "별점주기",
        text: "별점" + star + "점을 선택하셨습니다.",
        icon: "success"
    }).then(function() {
        document.reviewform.vStar.value = star;
    });
      
   }