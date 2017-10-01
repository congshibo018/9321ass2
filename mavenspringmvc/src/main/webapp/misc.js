$(document).ready(function(){

    $("#postForm").toggle();

    $("#postTogg").click(function(){
        $("#postForm").fadeToggle();
        return false;
    });

    $("#postCancel").click(function(){
        $("#postForm").fadeToggle();
        return false;
    });

});