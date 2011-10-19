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
							var incrementMessage = (increment < 0) ? increment : "+"+increment;
							if(f.message instanceof Function)
								titles.push(incrementMessage+": "+f.message(f));
							else
								titles.push(incrementMessage+": "+f.message);
						});
						$(t).attr("title", titles.join("\n"));
						$(t).val(summe);
					});
				});
			});
		});
	});
});