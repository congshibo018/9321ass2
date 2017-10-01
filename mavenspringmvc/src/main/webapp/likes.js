$(document).ready(function(){

    styleAllThumbs();

    //  Select all html elements with class thumbIcon
    $(".thumbIcon").click(function(){
        //  Determine function using content found in span (Like/Dislike)
        var calltype = $(this).find("span").text();

        //  Take details from the div panel above it
        var parent = $(this).parent();
        var messageId = parent.attr('id');
        var mid = parent.attr('mid');
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
                calltype = "1";
                $(this).toggleClass("green");
            }
            else if (calltype === "Dislike") {
                dislikes = 1;
                calltype = "-1";
                $(this).toggleClass("red");
            }
        }

        else if (state === "1") {
            if (calltype === "Like") {
                likes = -1;
                calltype = "0";
                $(this).toggleClass("green");
            }
            else if (calltype === "Dislike") {
                likes = -1;
                dislikes = 1;
                calltype = "-1";
                $(this).siblings().toggleClass("green");
                $(this).toggleClass("red");
            }
        }

        else if (state === "-1") {
            if (calltype === "Like") {
                dislikes = -1;
                likes = 1;
                calltype = "1";
                $(this).siblings().removeClass("red");
                $(this).addClass("green");
            }
            else if (calltype === "Dislike") {
                dislikes = -1;
                calltype = "0";
                $(this).toggleClass("red");
            }
        }
        var vote=0;
        if (calltype==="1"){
            vote = 1;
        }
        if(calltype==="-1"){
            vote = -1;
        }
        $.ajax({
            type: "POST",
            url: "vote?messageId="+mid+"&like="+vote,
            success: function(msg){
                $.messager.alert("like/unlike");
            }
        });

        parent.attr('data-active-state', calltype);
        updateCounts(messageId, likes, dislikes);
        return false;
    });

    function styleAllThumbs() {
        //  Find all panel footers with the "Like" state
        //  Style the <a> that is the parent element of the like
        var upvote = $('.panel-footer[data-active-state="1"]');
        upvote.find("span.glyphicon-thumbs-up").parent().toggleClass("green");

        //  Find all panel footers with the "Dislike" state
        //  Style the <a> that is the parent element of the dislike
        var downvote = $('.panel-footer[data-active-state="-1"]');
        downvote.find("span.glyphicon-thumbs-down").parent().toggleClass("red");

        //  Find all panel footers with the "Neutral" state
        //  Do nothing
        var neutral = $('.panel-footer[data-active-state="0"]');
    }

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
