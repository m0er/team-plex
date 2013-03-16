<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="nav" tagdir="/WEB-INF/tags/nav" %>
<%@ taglib prefix="template" tagdir="/WEB-INF/tags/template" %>
<%@ taglib prefix="str" uri="http://jakarta.apache.org/taglibs/string-1.1" %>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>My Page</title>
	<link rel="stylesheet" type="text/css" href="<c:url value="/css/overcast/jquery-ui.css"/>">
	<link rel="stylesheet" type="text/css" href="<c:url value="/css/bootstrap.css"/>"/>
	<link rel="stylesheet" type="text/css" href="<c:url value="/css/overcast/jquery.fileupload-ui.css"/>">
	<link rel="stylesheet" type="text/css" href="<c:url value="/css/selector/select2.css"/>"/>
	<link rel="stylesheet" type="text/css" href="<c:url value="/css/teamplex-base.css"/>"/>
	<link rel="stylesheet" type="text/css" href="<c:url value="/css/teamplex-mypage.css"/>"/>
</head>
<body>
	<nav:gnb/>
	<nav:snb/>
	
	<div class="container" id="resultContainer" style="visibility: hidden;">
		<div class="row" id="mypageInfo" data-user-id="${dto.user.id}">
			<form action="" class="well span7" id="profileForm">
				<a class="profile-image">
				<c:choose>
					<c:when test="${not empty dto.user.encodeProfileImage}">
						<img alt="${dto.user.nickname}`s profile image" src="data:image/gif;base64,${dto.user.encodeProfileImage}" width="160" height="160"/>
					</c:when>
					<c:otherwise>
						<img alt="${dto.user.nickname}`s profile image" src="" data-src="holder.js/160x160/social" width="160" height="160"/>
					</c:otherwise>
				</c:choose>
				</a>
				<fieldset>
					<h1>${dto.user.nickname}</h1>
					<label>Interests</label>
					<input id="tags" class="taglist" type="text" name="tags" value="${dto.user.tagPrint}"/>
					<c:if test="${dto.user.id eq currentUser.id}">
						<a class="btn edit-profile-btn" href="<c:url value="/mypage/${dto.user.id}/form"/>">Edit Profile</a>
					</c:if>
				</fieldset>
			</form>
			<section class="well span4">
				TBD
			</section>
			<section class="well span11 post-listing" id="posts">
				<div class="navbar">
					<div class="navbar-inner">
						<a class="brand" href="#"><strong>Written posts</strong></a>
					</div>
				</div>
				<div class="row">
					<c:forEach var="post" items="${dto.posts}">
						<article class="span3 post" data-post-id="${post.id}" data-toggle="modal" data-target="postModalTemplate">
							<header class="post-title">
								<b>${post.title}</b>
							</header>
							<p class="content">
								<str:truncateNicely lower="400" appendToEnd="...">${post.content}</str:truncateNicely>
							</p>
							<input class="taglist" type="text" value="${post.tagPrint}"/>
							<footer>
								<p class="post-status">
									<small class="post-view-count" style="margin-right: 7px;"><i class="icon-eye-open icon-gray"></i>&nbsp;<span class="number">${post.viewCount == null ? 0 : post.viewCount}</span></small>
									<small class="post-reply-count" style="margin-right: 7px;"><i class="icon-comment icon-gray"></i>&nbsp;<span class="number">${fn:length(post.replyIds)}</span></small>
									<small class="post-created-time"><i class="icon-time icon-gray"></i>&nbsp;<span class="string">1h ago</span></small>
								</p>
								<p class="post-writer">
									<a href="<c:url value="/mypage/${post.writer.id}"/>">
										<c:choose>
											<c:when test="${not empty post.writer.encodeProfileImage}">
												<img alt="${post.writer.nickname}`s profile image" src="data:image/gif;base64,${post.writer.encodeProfileImage}" height="30" width="30"/>
											</c:when>
											<c:otherwise>
												<img alt="${post.writer.nickname}`s profile image" src="" data-src="holder.js/30x30/social" height="30" width="30"/>
											</c:otherwise>
										</c:choose>
									</a>
									<a href="<c:url value="/mypage/${post.writer.id}"/>"><b>${post.writer.nickname}</b></a> attach to <a href="#"><b>toz</b></a>
								</p>
							</footer>
						</article>
					</c:forEach>
				</div>
			</section>
		</div>
	</div>
	
	<template:post/>
	<template:reply/>
	
	<script type="text/javascript" >
		var CONTEXT_PATH = '<c:url value="/"/>';
    </script>
	<script type="text/javascript" data-main="<c:url value="/js/teamplex-mypage"/>" src="<c:url value="/js/require-jquery.js"/>"></script>
</body>
</html>