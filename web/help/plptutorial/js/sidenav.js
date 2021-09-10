/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
function w3_open() {
    // TODO: devo fare in modo che se sono un cellulare il menu deve coprire tutto lo schermo
    $(".w3-sidenav").attr('style', 'width: 0px; display: block !important');
    $(".content").animate({marginLeft: '200px'});
    $(".w3-sidenav").animate({width: '200px'}, 600);
    $(".w3-opennav").attr('style', 'display: none !important');
    //$(".w3-sidenav").show("slow");
}
function w3_close() {
    $(".content").animate({marginLeft: '0px'}, 600);
    $(".w3-sidenav").animate({width: '0px'}, 600);
    $(".w3-sidenav").hide();
    $(".w3-opennav").attr("style","display: block !important");
}

$(function () {
    $("a.sidenav-link").click(loadDiv);

//    $(".content").hide();
//    $("#footer").hide();
//$("#tutorial").show();
    var path = $(location).attr('hash');
    var index = path.indexOf("index.html");
    var remainingURL = path.substr(index);
    if (remainingURL == "index.html" || path.length == 0) {
        $(".sidenav-link[href=''").css("background-color", "#349e9d");
        $("#welcome").show();
    } else {
        index = path.lastIndexOf("#");
        var href = path.substr(index);
        if (href != "#contacts" && href != "#credits" && href != "#tutorial") {
//            href = "#tutorial";
            $("#tutorial").show();
            $(".sidenav-link[href='#tutorial']").css("background-color", "#349e9d");
//            $(document).scrollTop( $(href).offset().top );  
            var ele = $(href);
            $(window).scrollTop(ele.offset().top).scrollLeft(ele.offset().left);
        } else {
//            $(window).scrollTop();
            $('html,body').animate({scrollTop: -$("body").offset().top});
            $(".sidenav-link[href='" + href + "']").css("background-color", "#349e9d");
            $(href).show();
        }
    }
    
//    $("#footer").show();
});

//$(window).load(function(){
//    $('html, body').scrollTop(0);
//});



function loadDiv(event) {
//    event.preventDefault();
    $(".sidenav-link").css("background-color", "");
    var href = $(this).attr("href");
    $(".content").hide();
    if (href.length == 0) {
        $(".sidenav-link[href=''").css("background-color", "#349e9d");
        $("#welcome").show();
    } else {
        $(".sidenav-link[href='" + href + "']").css("background-color", "#349e9d");
        $(href).show();
    }
    $('html,body').animate({scrollTop: -$(this).offset().top});
//    $(window).scrollTop(900);
//    var index = window.location.href.lastIndexOf("#");
//    if (index < 0) {
//        index = window.location.href.length;
//    }
//    var newURL = window.location.href.substring(0,index) + href;
//    window.history.pushState("object or string", "Title", newURL);
    //$("#page-wrapper").scrollTop();
    //window.location = window.location + href;

}