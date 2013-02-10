require.config({
	baseUrl: PREFIX + 'js',
    paths: {
    	form: 'jquery-plugin/jquery.form',
    	plugins: 'jquery-plugin',
    	jquerypp: 'jquery-plugin/jquerypp',
    	jqueryui: 'jquery-ui/jquery-ui',
    	positioning: 'jquery-plugin/jquery-teamplex-positioning',
    	underscore: 'external/underscore',
        bootstrap: 'bootstrap/bootstrap',
        holder: 'template/holder',
        handlebars: 'template/handlebars'
    }
});

require(['bootstrap',
         'form',
         'plugins/select2',
         'common/teamplex-nav',
         'common/teamplex-post',
         'common/teamplex-common'], function() {
	
	$(document).ready(function() {
		
		var $passwordForm = $("#passwordFormTemplate"),
			$inputPassword = $("#inputPassword"),
			$inputNewPassword = $("#inputNewPassword"),
			$inputNewPasswordAgain = $("#inputNewPasswordAgain"),
			$passwordButtonPrimary = $("#passwordFormTemplate .btn-primary");
		
		$("body").ezBgResize({
			img: getBackgroundImageUrl()
		});
		
		$("#inputProfileImage").change(function() {
			var $form = $("#mypageForm");
			var baseActionUrl = $form.attr("action");
			
			$form.attr("action", baseActionUrl + "/profileImage/update");
			$form.ajaxSubmit({
				success : function(data) {
					$("#mypageForm .thumbnail img").attr("src", "data:image/gif;base64," + data);
				}
			});
			$form.attr("action", baseActionUrl);
		});
		
		$("body").one("select2-ajax-ready", function(e) {
			$("#mypageForm").css("visibility", "visible");
		});
		
		$("#inputTags").select2({
			tags: [],
			placeholder: "Input your interests",
			minimumInputLength: 1,
			ajax: { // instead of writing the function to execute the request we use Select2's convenient helper
				url: PREFIX + "tag/search",
				dataType: 'json',
				data: function (term, page) {
					return {
						 term: term, // search term
						 limit: 10
					};
				},
				results: function (data, page) {
					console.log(data);
					return {results: data};
				},
			}
		});
		
		$inputPassword.keyup(function() {
			var $message = $inputPassword.next();
			var $wrapper = $inputPassword.parents(".control-group");
			var id = $("#mypageInfo").attr("data-user-id");
			var password = $(this).val();
			var url = PREFIX + "/mypage/";
			
			$.ajax({
				url : url + id + "/verify",
				type : "POST",
				data : {
					password : password
				}	
			}).done(function(data) {
				if (data) {
					$wrapper.removeClass("error").addClass("success");
					$message.text("Password correct");
					$inputNewPassword.removeAttr("disabled");
				} else {
					$wrapper.removeClass("success").addClass("error");
					$message.text("Incorrect password");
					$inputNewPassword.attr("disabled", "disabled");
				}
			});
		});
		
		$inputNewPassword.keyup(function() {
			var $message = $inputNewPassword.next();
			var $wrapper = $inputNewPassword.parents(".control-group");
			
			if ($inputNewPassword.val().length > 4) {
				$message.text("");
				$wrapper.removeClass("error").addClass("success");
				$inputNewPasswordAgain.removeAttr("disabled");
				return;
			}
			
			$wrapper.removeClass("success").addClass("error");
			$inputNewPasswordAgain.attr("disabled", "disabled");
			$message.text("Too short");
		});
		
		$inputNewPasswordAgain.keyup(function() {
			var $message = $inputNewPasswordAgain.next();
			var $wrapper = $inputNewPasswordAgain.parents(".control-group");
			
			if ($inputNewPassword.val() === $inputNewPasswordAgain.val()) {
				$message.text("Password same");
				$wrapper.removeClass("error").addClass("success");
				$passwordButtonPrimary.removeAttr("disabled");
				return;
			}
			
			$wrapper.removeClass("success").addClass("error");
			$btnPrimary.attr("disabled", "disabled");
			$message.text("Password not same");
		});
		
		$passwordButtonPrimary.click(function(e) {
			e.preventDefault();
			
			$passwordForm.ajaxSubmit({
				success: function(data) {
					if (data) {
						$passwordButtonPrimary.next().click();
					}
				}
			});
		});
	});
	
	$("#cancelButton").click(function(e) {
		e.preventDefault();
		
		location.href = location.href.replace("/form", "");
	});
	
	function getBackgroundImageUrl() {
		var url = "";
		if (parseInt(Math.random() * 2) == 1) {
			url = "img/living.social.street" + parseInt(Math.random() * 9 + 1);
		} else {
			url = "img/twitter-cover" + parseInt(Math.random() * 9 + 1);
		}
		
		return PREFIX + url + ".jpg";
	}
});
