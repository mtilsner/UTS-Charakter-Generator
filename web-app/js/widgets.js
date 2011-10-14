var widgets = {
	getCaret: function(target){
		var left = 0;
		var right = 0;
		if (Prototype.Browser.IE) {
			var oSel = document.selection.createRange();
			var length = oSel.length;
			oSel.moveStart ('character', -target.value.length);
			right = oSel.text.length;
			left = right-length;
		} else {
			left = target.selectionStart;
			right = target.selectionEnd;
		}
		return {left: left,right: right};
	},
	SpinBox : function(target, args){
		target = $(target);
		target.observe('keypress',(function(element,values,event){
			var found = false;
			var key = String.fromCharCode(event.keyCode);
			var caret = widgets.getCaret(target);
			var newValue = element.value.substring(0,caret.left)+key+element.value.substring(caret.right,element.value.length);
		//	alert(caret.left+":"+caret.right+"="+newValue);
			values.each(function(value){
				if(value.startsWith(newValue)) {
					found = true;
					throw $break;
				}
			});
			if(!found) { event.preventDefault(); event.stop(); return false; }
		}).curry(target, args.values));
		target.observe('blur',(function(element,values){
			if(element.value == '' || values.indexOf(element.value) == -1) {
				var bestMatch = "";
				values.each(function(value){
					var match = "";
					for(i=0;i<Math.min(element.value.length,value.length);i++){
						if(element.value.charAt(i) == value.charAt(i))
							match += value.charAt(i);
						else
							break;
					}
					if(match.length > bestMatch.length) bestMatch = match;
				});
				if(bestMatch.length > 0 && bestMatch.length < element.value.length)
					element.value = bestMatch;
				else if(bestMatch.length == 0)
					element.value = values[0];
			}
		}).curry(target, args.values));
		var buttonUpdater = (function(element,values){
			var current = values.indexOf(element.value);
			if(current == 0)
				$(target.id+"_down").disable();
			else
				$(target.id+"_down").enable();
			if(current == values.length-1)
				$(target.id+"_up").disable();
			else
				$(target.id+"_up").enable();
		}).curry(target, args.values);
		var down = new Element('input', {id:target.id+"_down", type: 'button', value: '<', class: 'widgets spinBox button down'});
		target.parentNode.insertBefore(down, target);
		down.observe('click',(function(element,values,buttonUpdater){
			var current = values.indexOf(element.value);
			element.value = values[current-1];
			buttonUpdater()
		}).curry(target, args.values, buttonUpdater));
		var up   = new Element('input', {id:target.id+"_up", type: 'button', value: '>', class: 'widgets spinBox button up'});
		target.parentNode.appendChild(up);
		up.observe('click',(function(element,values,buttonUpdater){
			var current = values.indexOf(element.value);
			element.value = values[current+1];
			buttonUpdater()
		}).curry(target, args.values, buttonUpdater));
		document.observe('dom:loaded', function() { buttonUpdater(); });
	}
}