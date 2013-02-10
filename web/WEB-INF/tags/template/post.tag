<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script id="postModalTemplate" type="text/x-handlebars-template">
<section class="modal modal-post" id="postModal{{post.id}}">
	<header class="modal-header">
 		<img class="profile-image" src="{{#if post.writer.encodeProfileImage}}data:image/gif;base64,{{post.writer.encodeProfileImage}}{{/if}}" data-src="holder.js/50x50/social" alt="writer image" />
 		<h3 class="post-title" {{#if post.contentWriter}}contenteditable="true"{{/if}}>{{post.title}}</h3>
 		<article class="post-content" {{#if post.contentWriter}}contenteditable="true"{{/if}}>
 			{{post.content}}
		</article>
		<input class="post-taglist" type="text" name="tags" value="{{post.tagPrint}}"/>
	</header>
	<article class="modal-body">
		<div class="modal-reply">
	 	<c:if test="${currentUser ne null}">
			<form action="<c:url value="/reply/add"/>" method="post">
				<article class="reply reply-input">
					<c:choose>
						<c:when test="${not empty currentUser.encodeProfileImage}">
							<img class="profile-image" alt="your profile image" src="data:image/gif;base64,${currentUser.encodeProfileImage}"/>
						</c:when>
						<c:otherwise>
							<img class="profile-image" alt="your profile image" src="" data-src="holder.js/50x50/social"/>
						</c:otherwise>
					</c:choose>
			    	<textarea name="content" placeholder="Add your opinion..."></textarea>
	    		</article>
	    	</form>
	   	</c:if>
	  	</div>
 	</article>
	<footer class="modal-footer">
	{{#if post.contentWriter}}
		<button class="btn btn-primary post-modify" type="submit">Modify</button>
		<button class="btn btn-danger post-delete" type="submit">Delete</button>
	{{/if}}
		<button class="btn" data-dismiss="modal">Cancel</button>
	</footer>
</section>
</script>