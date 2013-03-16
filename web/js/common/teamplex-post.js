define('common/teamplex-post', [
	'jquery',
	'plugins/select2',
	'handlebars',
	'common/teamplex-handlebars'], function ($) {
	
	var enter = 13;
	
	$(document).on("keypress", ".reply-input", function(e) {
		if (e.keyCode == enter) {
			e.preventDefault();
			
			var $target = $(e.target);
			var $form = $target.parents("form");
			var params = $form.serialize();
			params += "&postId=" + $target.parents("section").attr("id").replace("postModal", "");
			
			console.log(params);
			
			$.ajax({
				url: $form.attr("action"),
				data: params,
				type: $form.attr("method").toUpperCase()
			}).done(function(reply) {
				console.log(reply);
				
				$postModal = $("#postModal" + reply.postId);
				
				var $html = getHandlebarsParsingResult("#postModalReplyTemplate", reply);
				$form.before($html).find("textarea").val("").blur();
				
				$replyCount = $("article[data-post-id=" + reply.postId + "]").find(".post-reply-count .number");
				$replyCount.text(parseInt($replyCount.text()) + 1);
			});
		}
	}).on("keypress", ".reply-content", function(e) {
		if (e.keyCode == enter) {
			e.preventDefault();
			
			var $target = $(e.target);
			var params = "postId=" + $target.parents("section").attr("id").replace("postModal", "");
			params += "&content=" + $target.text();
			params += "&id=" + $target.parent().attr("id");
			
			console.log(params);
			
			$.ajax({
				url: CONTEXT_PATH + "reply/update",
				data: params,
				type: "POST"
			}).done(function(reply) {
				console.log(reply);
				
				$("#" + reply.idString).find(".reply-content").text(reply.content);
			});
		}
	}).on("click", ".reply-delete", function(e) {
		var replyId = $(e.target).parent().attr("id");
		
		console.log(replyId);
		
		var url = CONTEXT_PATH + "reply/delete/" + replyId;
		$.get(url, function(data) {
			$("#" + replyId).remove();
		});
	}).on("click", ".post-modify", function(e) {
		var $writePostForm = $("#writePostForm");
		var $section = $(e.target).parents(".modal-post");
		
		$writePostForm.find("#title").val($section.find(".post-title").text());
		$writePostForm.find("#content").val($section.find(".post-content").text());
		$writePostForm.find("[name=tags]").val($section.find("input.post-taglist").val());
		$writePostForm.append(getHiddenInput("originalPostId", $section.attr("id").replace("postModal", "")));
		$writePostForm.attr("action", $writePostForm.attr("action").replace("write", "modify")).submit();
	}).on("click", ".post-delete", function(e) {
		e.preventDefault();
		
		var $section = $(e.target).parents(".modal-post");
		window.location = CONTEXT_PATH + "post/" + $section.attr("id").replace("postModal", "") + "/delete";
	});
	
	$(".taglist").select2({
		tags: [],
		tagRemoveButton: false,
		tagInput: false
	});
	
	function getHiddenInput(name, value) {
		return $("<input type='hidden'/>").attr({
			name: name,
			value: value
		});
	}
	
	$(".post header, .post .content").click(function(e) {
		var $target = $(e.target);
		var postId = $target.hasClass(".post") ? $target.attr("data-post-id") : $target.parents(".post").attr("data-post-id");
		var $post = $("#postModal" + postId);
		
		if ($post.isExists()) {
			$post.modal("show").focus();
			return;
		}
		
		var url = CONTEXT_PATH + "post/" + postId;
		$.get(url, function(postAndReplies) {
			console.log(postAndReplies);
			
			var $html = getPostModalTemplate(postAndReplies);
			$html.appendTo("#posts").modal("show").focus();
			Holder.run();
			
			$("article[data-post-id=" + postAndReplies.post.id + "]").find(".post-view-count .number").text(postAndReplies.post.viewCount);
		});
	});
	
	$(".post footer a").click(function(e) {
		e.stopPropagation();
		return true;
	});
	
	function getPostModalTemplate(postAndReplies) {
		var $html = getHandlebarsParsingResult("#postModalTemplate", postAndReplies);
		
		if (postAndReplies.post.contentWriter) {
			$html.find(".post-taglist").select2({
				tags: [],
				placeholder: "Input your interests",
				minimumInputLength: 1,
				ajax: { // instead of writing the function to execute the request we use Select2's convenient helper
					url: CONTEXT_PATH + "tag/search",
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
		} else {
			$html.find(".post-taglist").select2({
				tags: [],
				tagRemoveButton: false,
				tagInput: false
			});
		}
		
		addReplies(postAndReplies, $html);
		
		return $html;
	}
	
	function addReplies(postAndReplies, $html) {
		var $replyHtml = getHandlebarsParsingResult("#postModalReplyTemplate", postAndReplies);
		var $form = $html.find("form");
		if ($form.size() > 0) {
			$form.before($replyHtml);
		} else {
			$html.find(".modal-reply").append($replyHtml);
		}
	}
});