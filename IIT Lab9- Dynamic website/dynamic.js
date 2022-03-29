$(document).ready(function() {
    $.ajax({
            type: "GET",
            headers: { "Accept": "application/json"},
            url: "jsonData.js",
            dataType: "json",
            success: function(responseData, status){ 
                var output="";
            $.each(responseData.menuItems, function(i, menu) {
                output += `<div class="projects">`; 
                output += '<p>'+menu.menuName+'</p>';
                $.each(menu.menuURL, function(j, urlItem){
                    output += '<button> <a href="'+urlItem.url+'">'+urlItem.name+'</a></button>';
                });
                output += '<p>'+menu.menuDesc+'</p>';
                output += '</div>';
        });
        $('#menuContainer').html(output);
        }, error: function(msg) {
                    // there was a problem
            alert("There was a problem: " + msg.status + " " + msg.statusText);
        }
    });
});