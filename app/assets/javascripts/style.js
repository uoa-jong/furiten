
$( document ).on('turbolinks:load', function(){
     $(".button-collapse").sideNav();
});

//$(document).ready(function() {
//    $('select').material_select();
//});

$(document).on('turbolinks:load', function() {
  $('select').material_select();
}) 

$(document).on('turbolinks:load', function(){
	$('.datepicker').pickadate({
    	selectMonths: true, // Creates a dropdown to control month
    	selectYears: 20 // Creates a dropdown of 20 years to control year
  	});
 })

$(document).on('turbolinks:load', function(){
    // the "href" attribute of .modal-trigger must specify the modal ID that wants to be triggered
    $('.modal').modal();
});
