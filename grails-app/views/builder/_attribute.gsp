<section id="attribute">
<fieldset class="attribute">
	<div class="attribut leben">
		<label for="leben" class="label"><g:message code="charakter.leben.label" default="Leben" /></label>
		<div class="value">
			<input type="hidden" id="charakter-leben-basis" name="leben" value="5" data-updates="[{target:'#charakter-leben-summe', value:(function(el){return parseInt($(el).val())})}]" />
			<input type="text" id="charakter-leben-summe" name="leben-summe" value="5" class="summe" readOnly="readOnly" tabindex="-1" />
			<widgets:kaestchenAnzeige value="${5}" max="${6}" id="charakter-leben-kaestchen">
				-${(int) (index+1)/2}
			</widgets:kaestchenAnzeige>
			<r:script>
				$('#charakter-leben-summe').timedObserver(0.2, function(el,value){
					$('#charakter-leben-kaestchen').removeClass().addClass("kaestchenContainer kaestchen_"+value);
				});
			</r:script>
		</div>
	</div>
	
	<div class="attribut energie">
		<label for="energie" class="label"><g:message code="charakter.energie.label" default="Energie" /></label>
		<div class="value">
			<input type="hidden" id="charakter-energie-basis" name="energie" value="5" data-updates="[{target:'#charakter-energie-summe', value:(function(el){return parseInt($(el).val())})}]" />
			<input type="text" id="charakter-energie-summe" name="energie-summe" value="5" class="summe" readOnly="readOnly" tabindex="-1" />
			<widgets:kaestchenAnzeige value="${5}" max="${6}" id="charakter-energie-kaestchen" />
			<r:script>
				$('#charakter-energie-summe').timedObserver(0.2, function(el,value){
					$('#charakter-energie-kaestchen').removeClass().addClass("kaestchenContainer kaestchen_"+value);
				});
			</r:script>
		</div>
	</div>
	
	<div class="attribut stabilitaet">
		<label for="stabilitaet" class="attribut stabilitaet label"><g:message code="charakter.stabilitaet.label" default="Stabilität" /></label>
		<div class="attribut stabilitaet value">
			<input type="hidden" id="charakter-stabilitaet-basis" name="stabilitaet" value="5" data-updates="[{target:'#charakter-stabilitaet-summe', value:(function(el){return parseInt($(el).val())})}]" />
			<input type="text" id="charakter-stabilitaet-summe" name="stabilitaet-summe" value="5" class="summe" readOnly="readOnly" tabindex="-1" />
			<widgets:kaestchenAnzeige value="${5}" max="${6}" id="charakter-stabilitaet-kaestchen" />
			<r:script>
				$('#charakter-stabilitaet-summe').timedObserver(0.2, function(el,value){
					$('#charakter-stabilitaet-kaestchen').removeClass().addClass("kaestchenContainer kaestchen_"+value);
				});
			</r:script>
		</div>
	</div>
</fieldset>
</section>