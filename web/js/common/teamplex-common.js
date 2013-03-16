define('common/teamplex-common', ['jquery', 'plugins/jquery-contexturl'], function($) {
	
	$.fn.reverse = [].reverse;
	
	$.fn.isExists = function() {
		if (this.length > 0) return this;
		else return false;
	};
	
});

function getHandlebarsParsingResult(selector, context) {
	return $(Handlebars.compile($(selector).html()).call(null, context).trim());
}