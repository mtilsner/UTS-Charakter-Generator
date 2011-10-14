package uts.chargen

class WidgetsTagLib {
	static namespace = "widgets"	
	static spinBoxId = 0
	
	def jsLibrary = { attrs ->
		out << g.javascript(library: 'widgets')
	}
	
	def spinBox = { attrs ->
		out << g.textField(name: attrs.name, value: attrs.value, class: "widgets spinBox textField", id: "spinBox_${++spinBoxId}")
		out << """<script type="text/javascript"><!--
					widgets.SpinBox(\$('spinBox_${spinBoxId}'),
										{ values: ${attrs.values.collect({"'${it}'"})} }
									   );
				  //--></script>"""
	}
}
