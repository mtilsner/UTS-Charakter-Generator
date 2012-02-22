function split( val ) {
	return val.split( /,\s*/ );
}
function extractLast( term ) {
	return split( term ).pop();
}

tinyMCE.init({
	mode : 'textareas', 
	theme : 'advanced',
	plugins : 'bestandsbeheer,tabfocus,advimagescale,image_tools,embed,tableextras,style,table,inlinepopups,searchreplace,contextmenu,paste,wordcount,advlist,autosave',
    content_css : "../css/editor.css,../static/bundle-bundle_application_head.css,../static/bundle-bundle_charakter_head.css",
    theme_advanced_buttons1 : "formatselect,fontselect,fontsizeselect,|,bold,italic,underline,strikethrough,|,sub,sup,|,forecolor,backcolor,|,justifyleft,justifycenter,justifyright,justifyfull,|,undo,redo",
    theme_advanced_buttons2 : "bullist,numlist,|,outdent,indent,|,link,unlink,charmap,image,charmap,image,|,tablecontrols,|,removeformat,code",
	theme_advanced_buttons3 : "",
	theme_advanced_toolbar_align: "left",
	theme_advanced_toolbar_location : "external",
    theme_advanced_statusbar_location : "none"
/*	theme_ribbon_tab1 : {
		title : "Start",
		items : [
			["paste"], 
			["justifyleft,justifycenter,justifyright,justifyfull",
			 "bullist,numlist",
			 "|",
			 "bold,italic,underline",
			 "outdent,indent"], 
			["paragraph", "heading1", "heading2", "heading3"],
			["search", "|", "replace", "|", "removeformat"]
		]
	},
	theme_ribbon_tab2 : {
		title : "Insert",
		items : [
			["tabledraw"],
			["image", "bestandsbeheer_file", "bestandsbeheer_video", "bestandsbeheer_mp3"],
			["embed"],
			["link", "|", "unlink", "|", "anchor"],
			["loremipsum", "|", "charmap", "|", "hr"]
		]
	},
	theme_ribbon_tab3 : {
		title : "Source",
		source : true
	},
	theme_ribbon_tab4 : {
		title : "Image",
		bind :  "img",
		items : [
			["image_float_left", "image_float_right", "image_float_none"],
			["image_alt"],
			["image_width_plus", "|", "image_width_min", "|", "image_width_original"],     
			["image_edit", "|", "image_remove"]
		]
	}*/
});