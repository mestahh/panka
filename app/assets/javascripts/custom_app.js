$(document).tooltip();
$(function() {
	$(".submit").button();
	$(".datepicker").datepicker({
		dateFormat : 'yy-mm-dd'
	});
	$("a.tab").click(function() {

		$(".active").removeClass("active");
		$(this).addClass("active");
		var tab = $(this).attr("id");
		var tab_number = tab.substr(tab.length - 1)

		$(".content").hide();
		$("#content_" + tab_number).show();

		return false;

	});

}); 