/*********************************************************************************************
 ********************************* Seitennummer Anzeige **************************************
 *********************************************************************************************/
Event.observe(window, 'scroll', function(event){
	var seiten = $(document).getElementsByClassName('page');
	var i = 0;
	var maxValue = seiten[i].getHeight();
	while(i < seiten.length && (seiten[i].cumulativeScrollOffset()[1]-seiten[i].offsetTop+seiten[0].offsetTop) > (maxValue*3/4)) {
		i++;
	}
	if(i == seiten.length) i--;
	var seitennummer = seiten[i].classNames().find(function(cn){
		return cn.startsWith("page_");
	}).substr(5);
	$("seitennummer_wert").update(seitennummer);
})
/*
uts.chargen.charakter = {
	rp: {
		Funktionen: alleAktualisieren: function() {
			
		}
	},
	bonus: {
		Funktionen : {
			summeUndTitel: function(bonusListe) {
				var summe = 0;
				var titelZeilen = array();
				bonusListe.each(function(bonus){
					summe += bonus.value;
					titelZeilen[] = bonus.message;
				});
				return {summe: summe, titel: titelZeilen.join("\n")};
			},
			alleAktualisieren: function() {
				this.update.each(function(v){
					v.all();
				});
			}
		}
	}
}
var charakter = uts.chargen.charakter;



charakter.talent = {
	aktualisieren: function(talentName) {
		// aktualisieren der Spezialisierungen
		// TODO
		
		// aktualisieren der ResourcePunkte
		uts.chargen.charakter.rp.Funktionen.update.talent.talent(talentName);
		// aktualisieren des TalentBonus
		uts.chargen.charakter.bonus.Funktionen.update.talent.talent(talentName);
	}
}
charakter.bonus.talent = {}
uts.chargen.charakter.rp.Funktionen.update.talent = {
	talent: function(talentName) {
		var newValue;
		var oldValue;
	},
	talenttyp: function(talenttypName) {
		
	},
}
uts.chargen.charakter.bonus.Funktionen.update.talent = {
	single: function(talentName, talentBonus) {
		var summeUndTitel = uts.chargen.charakter.bonus.Funktionen.summeUndTitle(talentBonus)
		$('talent-'+talentName+'-value-bonus').update(summeUndTitel.summe);
		$('talent-'+talentName+'-value-bonus').title = summeUndTitel.titel;
		$('talent-'+talentName+'-value-summe').update(Integer.parseInt($('talent-'+talentName+'-value-wert').value)+summeUndTitel.summe);
	},
	talent: function(talentName) {
		this.single(talentName, charakter.bonus.talent[talentName]);
	}, 
	all: function() {
		charakter.bonus.talent.each(function(k,b){
			this.single(k,b);
		});
	}
};
*/