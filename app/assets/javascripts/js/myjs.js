$(document).ready(function() {
           // Prepare layout options.
        	$('.dropdown-toggle').dropdown();
        //sign in button
            $(".dropdown-signin").click(function(e) {          
				e.preventDefault();
                $("#signin_menu").toggle();
				
            });
			
			$("#signin_menu").mouseup(function() {
				return false
			});
			$(document).mouseup(function(e) {
				if($(e.target).parent("a.dropdown-signin").length==0) {
					
					$("#signin_menu").hide();
				}
			});




});

