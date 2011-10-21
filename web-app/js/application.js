var uts = {};
uts.chargen = {};

var dependentFields = {};
$(document).ready(function(event){
	$("[data-updates]").each(function(index,element){
		var updates = eval(element.dataset.updates);
		$.each(updates, function(index, update){
			var targets = $(update.target);
			targets.each(function(i,t){
				if(!t.id) t.id = "random-id-"+Math.random()*1000000;
				if(!dependentFields[t.id]) dependentFields[t.id] = new Array();
				dependentFields[t.id].push({element: element, message:update.message, value: update.value});
			});
			$(element).timedObserver(0.2, function(el,value){
				var updates = eval(element.dataset.updates);
				$.each(updates, function(index, update){
					var targets =  $(update.target);
					targets.each(function(i,t){
						summe = 0;
						titles = new Array();
						$.each(dependentFields[t.id], function(i, f){
							var increment = (f.value instanceof Function) ? parseInt(f.value(f.element)) : parseInt(f.value);
							summe += increment;
							if(f.message) {
								var incrementMessage = (increment < 0) ? increment : "+"+increment;
								if(increment != 0) {
									if(f.message instanceof Function) titles.push(incrementMessage+": "+f.message(f.element));
									else titles.push(incrementMessage+": "+f.message);
								}
							}
						});
						$(t).attr("title", titles.join("\n"));
						var outputSumme = (summe >= 0 && t.dataset.prefixpositives) ? "+"+summe : summe;
						$(t).val(outputSumme);
					});
				});
			});
		});
	});
});