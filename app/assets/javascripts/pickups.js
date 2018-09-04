document.addEventListener("DOMContentLoaded", function(event) {



    var xhttp = new XMLHttpRequest();

    //go to edit specific pickup page
    $('.editpickup.btn.btn-primary').on('click', function() {
        var pickup_div = $(this).parents('.editpickupparent');
        var pickup_id = pickup_div.attr('id');
        var x = "../pickups/" + pickup_id + "/edit";
        $(location).attr('href', x);
    });


	// delete the pickup you choose

    $('.removepickup.btn.btn-primary').on('click', function() {
        var pickup_div = $(this).parents('.removepickupparent');
        var pickup_id = pickup_div.attr('id');
        var x = "../deletepickup?id=" + pickup_id;
        $.ajax({
            type: "POST",
            url: x,
            success: function(data) {
                var success = data.success_message;
                $(".successr"+ pickup_id).text(success).show(0).delay(1000).hide(0);   
                setTimeout(function () {
                    location.reload();
                }, 1000);
            },

            error: function (xhr, ajaxOptions, thrownError){
                if(xhr.status==404) {
                    $(".errorl"+ pickup_id).text("Fail!, pickup Is Already Deleted Before").show(0).delay(1000).hide(0);
                    setTimeout(function () {
                         location.reload();
                    }, 2000);
                }
            }

        });
    });



    // when pressing on this button, it redirects you to create pickup page

    $('.addpickup.btn.btn-primary').on('click', function() {
        var success = "Redirecting to add pickup Page"
        $(".successp").text(success).show(0).delay(2000).hide(0);
        setTimeout(function () {
        $(location).attr('href', '../createpickup');
        }, 2000);
        
    });


});