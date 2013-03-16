<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="str" uri="http://jakarta.apache.org/taglibs/string-1.1" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="nav" tagdir="/WEB-INF/tags/nav" %>
<%@ taglib prefix="template" tagdir="/WEB-INF/tags/template" %>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8" />
	<title>TEAM-PLEX List Page</title>
	<link rel="stylesheet" type="text/css" href="<c:url value="/css/overcast/jquery-ui.css"/>">
	<link rel="stylesheet" type="text/css" href="<c:url value="/css/bootstrap.css"/>"/>
	<link rel="stylesheet" type="text/css" href="<c:url value="/css/selector/select2.css"/>"/>
	<link rel="stylesheet" type="text/css" href="<c:url value="/css/teamplex-base.css"/>"/>
	<link rel="stylesheet" type="text/css" href="<c:url value="/css/teamplex-list.css"/>"/>
</head>
<body>
	<nav:gnb/>
	<nav:snb/>
	
	<div class="container" id="resultContainer" style="visibility: hidden;">
		<div class="row">
			<section id="users" class="span4">
				<c:forEach var="user" items="${search.users}">
					<article class="row userinfo" data-user-id="${user.id}">
						<div class="userface">
							<a href="mypage/${user.id}">
								<c:choose>
									<c:when test="${not empty user.encodeProfileImage}">
										<img alt="${user.nickname}`s profile image" src="data:image/gif;base64,${user.encodeProfileImage}"/>
									</c:when>
									<c:otherwise>
										<img alt="${user.nickname}`s profile image" src="" data-src="holder.js/66x66/social"/>
									</c:otherwise>
								</c:choose>
							</a>
							<p class="username"><small>${user.nickname}</small></p>
						</div>
						<div class="span4 usertag">
							<ul class="unstyled">
								<li>
									<b>Interests</b>
								</li>
								<li>
									<input class="taglist" type="text" name="tags" value="${user.tagPrint}"/>
								</li>
							</ul>
						</div>
						<c:if test="${currentUser ne null and user.id ne currentUser.id}">
							<footer>
									<button class="btn btn-small send-message">
										<i class="icon-comment"></i>
										메시지
									</button>
							</footer>
						</c:if>
					</article>
				</c:forEach>
				<section style="display: none;" id="sendMessageTemplate">
					<form action="<c:url value="/message/send/"/>" method="post">
						<textarea rows="" cols="" placeholder="메시지를 입력하세요." name="content"></textarea>
						<input class="btn btn-primary" type="submit" value="send"/>
					</form>
				</section>
			</section>
			<section id="posts" class="span6">
				<div class="row">
					<c:forEach var="post" items="${search.posts}">
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
												<img alt="${post.writer.nickname}`s profile image" src="data:image/gif;base64,${post.writer.encodeProfileImage}" width="30" height="30"/>
											</c:when>
											<c:otherwise>
												<img alt="${post.writer.nickname}`s profile image" src="" data-src="holder.js/30x30/social" width="30" height="30"/>
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
	<!-- 
	<footer>
		TEAM-PLEX@2013
	</footer>
	 -->
	<script type="text/javascript" >
		var CONTEXT_PATH = '<c:url value="/"/>';
    </script>
    <script type="text/javascript" data-main="<c:url value="/js/teamplex-list"/>" src="<c:url value="/js/require-jquery.js"/>"></script>
</body>
</html>