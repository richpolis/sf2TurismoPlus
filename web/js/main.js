/* Scroll to Top */
  $(function(){

    $(".totop").hide();

    $(window).scroll(function(){
      if ($(this).scrollTop()>300)
      {
        $('.totop').slideDown();
      } 
      else
      {
        $('.totop').slideUp();
      }
    });

    $('.totop a').click(function (e) {
      e.preventDefault();
      $('body,html').animate({scrollTop: 0}, 500);
    });

    $("#dropdownMenu1").dropdown();

  });

var selectLanguage = function(){
    var lenguaje = $("#selectLanguage").val();
    if(lenguaje === "es"){
        location.href = window.api.espanol;
    }else if(lenguaje === "en"){
        location.href = window.api.ingles;
    }else{
        location.href = window.api.frances;
    }
}

