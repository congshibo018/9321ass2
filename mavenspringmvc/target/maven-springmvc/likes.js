$(document).ready(function(){

    //  Select all html elements with class thumbIcon
    $(".thumbIcon").click(function(){
        //  Determine function using content found in span (Like/Dislike)
        var calltype = $(this).find("span").text();

        //  Take details from the div panel above it
        var parent = $(this).parent();
        var messageId = parent.attr('id');
        var state = parent.attr('data-active-state');

        var likes = 0;
        var dislikes = 0;

        //  Decide what to increase/decrease.
        //  Depends on if you have liked/disliked something
        //  Update state (Like/Dislike/None)
        //  As an added bonus, change colors of the thumb icons
        if (state === "0") {
            if (calltype === "Like") {
                likes = 1;
                $(this).toggleClass("green");
            }
            else if (calltype === "Dislike") {
                dislikes = 1;
                calltype = "Dislike";
                $(this).toggleClass("red");
            }
        }

        else if (state === "1") {
            if (calltype === "Like") {
                likes = -1;
                calltype = "None";
                $(this).toggleClass("green");
            }
            else if (calltype === "Dislike") {
                likes = -1;
                dislikes = 1;
                calltype = "Dislike";
                $(this).siblings().toggleClass("green");
                $(this).toggleClass("red");
            }
        }

        else if (state === "-1") {
            if (calltype === "Like") {
                dislikes = -1;
                likes = 1;
                calltype = "Like";
                $(this).siblings().removeClass("red");
                $(this).addClass("green");
            }
            else if (calltype === "Dislike") {
                dislikes = -1;
                calltype = "None";
                $(this).toggleClass("red");
            }
        }
        parent.attr('data-active-state', calltype);
        updateCounts(messageId, likes, dislikes);
        return false;
    });

    //  Find and update small with stuff.
    function updateCounts(messageId, likes, dislikes) {
        var target = "#cnt" + messageId.replace(/[A-Za-z]+/g, '');
        console.log(target);
        var str = $(target).text();
        var reg = /(\d+)/g;
        var res = str.match(reg);
        var resA = parseInt(res[0]) + likes;
        var resB = parseInt(res[1]) + dislikes;
        $(target).text(resA + " Likes, " + resB + " Dislikes");
    }


});
