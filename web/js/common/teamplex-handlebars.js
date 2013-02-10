define('common/teamplex-handlebars', ['handlebars'], function () {
	Handlebars.registerHelper('ifArray', function(conditional, options) {
		if ($.isArray(conditional)) {
			return options.fn(this);
		} else {
			return options.inverse(this);
		}
	});
	
	// Hash arguments 사용할 때 사용해보자!
	// _.map(_.keys(options.hash), function(key) { console.log(key + " and " + options.hash[key]); });
});