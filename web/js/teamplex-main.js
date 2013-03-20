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
		var $guide = $("#guide"),
			$prev = $("[data-slide=prev]"),
			$next = $("[data-slide=next]");
		
		$.initContextUrl();
		
		function guidePreprocess() {
			var currentGuide = $guide.find(".carousel-inner .active").index();
			
			if (currentGuide == 0) {
				$prev.hide();
			} else {
				$prev.show();
			}
			
			$next.popover("destroy");
			$(".guide3 .reply").hide();
			$(".guide4 .fake-modal").first().nextAll().hide();
			
			if (currentGuide == 1) {
				$next.popover({
					placement: "bottom",
					content: "어떤일이 벌어질까요?",
					container: ".container",
					trigger: "manual"
				}).popover("show");
			} else if (currentGuide == 2) {
				$next.popover({
					placement: "bottom",
					content: "이러한 포스트가 모이면, 더 놀라운 것은...",
					container: ".container",
					trigger: "manual"
				});
				
				$(".guide3 .modal-reply .reply:hidden").each(function(index) {
					var $this = $(this);
					delay(function() {
						$this.fadeIn('slow');
					}, (index + 1) * 1000);
				});
				
				delay(function() {
					$next.popover("show");
				}, ($(".guide3 .modal-reply .reply").size() + 1) * 1000);
			} else if (currentGuide == 3) {
				$next.popover({
					placement: "bottom",
					content: "이렇게 관심있는 사람들의 대화가 모여서..",
					container: ".container",
					trigger: "manual"
				});
				
				$(".guide4 .fake-modal:hidden").each(function(index) {
					var $this = $(this);
					delay(function() {
						$this.fadeIn('slow');
					}, (index + 1) * 1000);
				});
				
				delay(function() {
					$next.popover("show");
				}, ($(".guide4 .fake-modal").size()) * 1000);
			} else if (currentGuide == 4) {
				$next.popover({
					placement: "bottom",
					content: "지금 참여해 보세요!",
					container: ".container",
					trigger: "manual"
				});
				
				delay(function() {
					$next.popover("show");
				}, 1000);
			}
		}
		
		function delay(func, delay) {
			setTimeout(func, delay);
		}
		
		$prev.click(function(e) {
			$(".carousel").bind('slid', function() {
				guidePreprocess();
			});
		});
		
		$next.click(function(e) {
			$(".carousel").bind('slid', function() {
				guidePreprocess();
			});
		});
		
	});
});