<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<sec:authorize access="hasRole('ROLE_USER')">
<nav class="pull-left well" id="leftNav">
	<ul class="nav nav-list">
		<li class="nav-header">
			Post
		</li>
		<li><a href="#writePostForm" role="button" data-toggle="modal">Write post</a></li>
	</ul>
	
    <form class="form-horizontal modal hide fade in" id="writePostForm" action="<c:url value="/post/write"/>" method="post" role="dialog" aria-labelledby="writePostForm" aria-hidden="true">
		<div class="modal-header">
			<h3>Write post</h3>
		</div>
		<fieldset class="modal-body">
			<div class="control-group">
				<label class="control-label" for="title">Title</label>
				<div class="controls">
					<input type="text" class="input-xlarge" id="title" name="title" placeholder="input title"/>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label" for="content">Content</label>
				<div class="controls">
					<textarea class="input-xlarge" id="content" name="content" rows="10" cols="3" placeholder="input content"></textarea>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label" for="tag">Tag</label>
				<div class="controls">
					<input type="text" class="input-xlarge" id="writePostTag" name="tags" style="width:285px;"/>
				</div>
			</div>
		</fieldset>
		<div class="modal-footer">
			<button class="btn btn-primary" type="submit">Submit</button>
			<button class="btn" data-dismiss="modal">Cancel</button>
		</div>
	</form>
</nav>
</sec:authorize>