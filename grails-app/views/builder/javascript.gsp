<%@ page contentType="text/javascript" %>
<%@ page import="uts.chargen.Konfiguration" %>
uts.chargen.rp = {
	talentLevelKosten: function(level) {
		return (${Konfiguration.findBySchluessel('talent_level_rp_kosten').wert});
	},
	talentSpezialisierungsKosten: function(spezialisierungen) {
		var anzahl = spezialisierungen.length;
		return (${Konfiguration.findBySchluessel('talent_spezialisierungen_rp_kosten').wert});
	}
}