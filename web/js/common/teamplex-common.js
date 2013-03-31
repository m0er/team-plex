define('common/teamplex-common',
		['jquery', 
		 'plugins/jquery-contexturl',
		 'plugins/jquery.imagesloaded', 
		 'plugins/jquery.pjax',
		 'holder',
		 ], function($) {
	
	$.fn.reverse = [].reverse;
	
	$.fn.isExists = function() {
		if (this.length > 0) return this;
		else return false;
	};
	
});

function getHandlebarsParsingResult(selector, context) {
	return $(Handlebars.compile($(selector).html()).call(null, context).trim());
}