jQuery.fn.extend({
    timedObserver: function(delay, callback){
		return this.each(function(){
			$this = $(this);
	        observed = {
	            obj: $this, delay: delay, 
	            oldVal: $this.val(), callback: callback,
				timedFunction: function(){
					if(this.obj.val() != this.oldVal) {
						//alert("update");
						this.oldVal = this.obj.val();
		            	this.callback(this.obj.get(0), this.obj.val());
					}
			 		setTimeout(this.timedFunction, this.delay * 1000);
				}
			}
			observed.timedFunction = $.proxy(observed.timedFunction, observed);
			observed.timedFunction();
		});
    }
});