document.addEventListener("DOMContentLoaded", function(event) {



    var xhttp = new XMLHttpRequest();

    //go to edit specific trip page
    $('.edittrip.btn.btn-primary').on('click', function() {
        var trip_div = $(this).parents('.edittripparent');
        var trip_id = trip_div.attr('id');
        var x = "../trips/" + trip_id + "/edit";
        $(location).attr('href', x);
    });


	// delete the trip you choose

    $('.removetrip.btn.btn-primary').on('click', function() {
        var trip_div = $(this).parents('.removetripparent');
        var trip_id = trip_div.attr('id');
        var x = "../deletetrip?id=" + trip_id;
        $.ajax({
            type: "POST",
            url: x,
            success: function(data) {
                var success = data.success_message;
                $(".successr"+ trip_id).text(success).show(0).delay(1000).hide(0);   
                setTimeout(function () {
                    location.reload();
                }, 1000);
            },

            error: function (xhr, ajaxOptions, thrownError){
                if(xhr.status==404) {
                    $(".errorl"+ trip_id).text("Fail!, Trip Is Already Deleted Before").show(0).delay(1000).hide(0);
                    setTimeout(function () {
                         location.reload();
                    }, 2000);
                }
            }

        });
    });



    // when pressing on this button, it redirects you to create trip page

    $('.addtrip.btn.btn-primary').on('click', function() {
        var success = "Redirecting to add Trip Page"
        $(".successp").text(success).show(0).delay(2000).hide(0);
        setTimeout(function () {
        $(location).attr('href', '../createtrip');
        }, 2000);
        
    });


});