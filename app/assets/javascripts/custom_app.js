$(document).tooltip();
$(function() {
	$(".submit").button();
	$(".datepicker").datepicker({
		dateFormat : 'yy-mm-dd'
	});
	$("a.tab").click(function() {

		$(".active").removeClass("active");
		$(this).addClass("active");
		return false;

	});
	$("#vip").click(function() {
			$(this).parent().toggleClass('ui-state-highlight');
			$(this).parent().toggleClass('noborder');
	});
	

}); 