<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script id="postModalReplyTemplate" type="text/x-handlebars-template">
{{#ifArray replies}}
	{{#each replies}}
		<article class="reply" id="{{idString}}">
			{{#if contentWriter}}
				<button class="close reply-delete">x</button>
			{{/if}}
			<img class="profile-image" alt="{{writer.nickname}}`s profile image" src="{{#if writer.encodeProfileImage}}data:image/gif;base64,{{writer.encodeProfileImage}}{{/if}}" data-src="holder.js/50x50/social"/>
			<p class="replyer-nickname"><b>{{writer.nickname}}</b></p>
 			<p class="reply-content" {{#if contentWriter}}contenteditable="true"{{/if}}>{{content}}</p>
		</article>
	{{/each}}
{{else}}
	<article class="reply" id="{{idString}}">
		{{#if contentWriter}}
			<button class="close reply-delete">x</button>
		{{/if}}
		<img class="profile-image" alt="{{writer.nickname}}`s profile image" src="{{#if writer.encodeProfileImage}}data:image/gif;base64,{{writer.encodeProfileImage}}{{/if}}" data-src="holder.js/50x50/social"/>
		<p class="replyer-nickname"><b>{{writer.nickname}}</b></p>
	 	<p class="reply-content" {{#if contentWriter}}contenteditable="true"{{/if}}>{{content}}</p>
	</article>
{{/ifArray}}
</script>