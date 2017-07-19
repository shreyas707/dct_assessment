// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
// require turbolinks
//= require selectize
//= require jquery_nested_form
//= require semantic-ui
//= require semantic-ui/modal
//= require semantic-ui/dropdown
//= require_tree .

// AJAX FOR UPDATING ANSWER SCORE
// $(document).ready(function(){
// 	$('.r_button').click(function(){
// 		console.log($(this).closest('form'))
// 		$(this).closest('form').submit();
// 	});
// });
$(document).ready(function(){
	$('.edit_answer input[type=radio]').click(function(){
		$(this).parent('form').submit();
	});
});

//AJAX FOR CREATING SOLUTIONS
$(document).ready(function(){
	$('.new_solution').click(function(){
		$(this).parent('form').submit();
	});
});

$(document).ready(function(){
	 $('.add_comment').css('cursor', 'pointer');
 	 $('.showComment').css('display', 'none');
 	 $('.add_comment').on('click', function(){
 		$('.showComment').toggle();
 	 });
});

// FOR SELECTIZE
$(document).ready(function(){
	$(".selectize").selectize({
		create: function(input, callback){
			$('.ui.modal').modal('show');
			$('#tag_name').val(input);
			
			$('#new_tag').on("submit", function(e){
				e.preventDefault();
				$.ajax({
					method: "POST",
					url: $(this).attr("action"),
					data: $(this).serialize(),
					success: function(response){
						callback({value: response.id, text: response.name});
						$('.ui.modal').modal('hide');
					}
				});
			});
		}
	});
});