require.config({
	baseUrl: CONTEXT_PATH + 'js',
    paths: {
    	form: 'jquery-plugin/jquery.form',
    	plugins: 'jquery-plugin',
    	jquerypp: 'jquery-plugin/jquerypp',
    	jqueryui: 'jquery-ui/jquery-ui-1.10.1.custom',
    	underscore: 'external/underscore',
        bootstrap: 'bootstrap/bootstrap',
        holder: 'template/holder',
        handlebars: 'template/handlebars'
    }
});

require(['jquerypp',
         'bootstrap',
         'underscore',
         'common/teamplex-nav',
         'common/teamplex-post',
         'common/teamplex-common'], function() {
	
	$(document).ready(function() {
		
		$.initContextUrl();
		
	});
});