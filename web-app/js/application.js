var dependentFields = {};
$(document).ready(function(event){
	$("[data-updates]").each(function(index,element){
		var targets = $(element.dataset.updates);
		targets.each(function(i,t){
			if(!t.id) t.id = "random-id-"+Math.random()*1000000;
			if(!dependentFields[t.id]) dependentFields[t.id] = new Array();
			dependentFields[t.id].push(element);
		});
		$(element).timedObserver(0.2, function(el,value){
			var targets =  $(el.dataset.updates);
			targets.each(function(i,t){
				summe = 0;
				$.each(dependentFields[t.id], function(i, f){
					//alert('#'+f+' => '+$(f).val());
					summe += parseInt($(f).val());
				});
				$(t).val(summe);
			});
		});
	});
});