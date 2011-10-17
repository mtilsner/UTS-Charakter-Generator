var Ajax;
if (Ajax && (Ajax != null)) {
	Ajax.Responders.register({
	  onCreate: function() {
        if($('spinner') && Ajax.activeRequestCount>0)
          Effect.Appear('spinner',{duration:0.5,queue:'end'});
	  },
	  onComplete: function() {
        if($('spinner') && Ajax.activeRequestCount==0)
          Effect.Fade('spinner',{duration:0.5,queue:'end'});
	  }
	});
}

var uts = {
	chargen : {}
}

var dependentFields = {};
Event.observe(window,"load",function(event){
	$$("[data-updates]").each(function(element){
		var targets = $$(element.dataset.updates);
		targets.each(function(t){
			if(!t.id) t.id = "random-id-"+Math.random()*1000000;
			if(!dependentFields[t.id]) dependentFields[t.id] = new Array();
			dependentFields[t.id].push(element);
		});
		new Form.Element.Observer(element, 0.2, function(el,value){
			var targets =  $$(el.dataset.updates);
			targets.each(function(t){
				var summe = 0;
				dependentFields[t.id].each(function(f){
					summe += parseInt(f.value);
				});
				$(t).value = summe;
			});
		});
	});
});