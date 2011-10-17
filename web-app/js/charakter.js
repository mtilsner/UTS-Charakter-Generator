$(window).bind('scroll', function(event){
	var seitennummer = -1;
	$('.page').each(function(i){
		if($(document).scrollTop() < ($(this).offset().top + $(this).height() - ($(window).height()/2))) {
			seitennummer = (seitennummer == -1) ? i : Math.min(seitennummer, i);
		}
	});
	$('#seitennummer_wert').text(seitennummer+1);
});