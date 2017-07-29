
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
		monthsFull:  ["1月", "2月", "3月", "4月", "5月", "6月", "7月", "8月", "9月", "10月", "11月", "12月"],
        monthsShort: ["1月", "2月", "3月", "4月", "5月", "6月", "7月", "8月", "9月", "10月", "11月", "12月"],
        weekdaysFull: ["日曜日", "月曜日", "火曜日", "水曜日", "木曜日", "金曜日", "土曜日"],
        weekdaysShort:  ["日", "月", "火", "水", "木", "金", "土"],
        weekdaysLetter: ["日", "月", "火", "水", "木", "金", "土"],
        labelMonthNext: "翌月",
        labelMonthPrev: "前月",
        labelMonthSelect: "月を選択",
        labelYearSelect: "年を選択",
        today: "今日",
        clear: "クリア",
        close: "閉じる",
        format: "yyyy/mm/dd",
    	
    	selectMonths: true, // Creates a dropdown to control month
    	selectYears: 20 // Creates a dropdown of 20 years to control year
  	});
 })

$(document).on('turbolinks:load', function(){
    // the "href" attribute of .modal-trigger must specify the modal ID that wants to be triggered
    $('.modal').modal();
});

  window.onresize = function(){
    
    drawChart();
    
  }
        