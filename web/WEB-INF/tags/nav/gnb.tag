<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<nav class="navbar navbar-fixed-top" id="topNav">
	<div class="navbar-inner">
		<div class="container">
			<a class="brand" href="<c:url value="/list"/>">TEAM-PLEX</a>
			<form id="search" action="<c:url value="/list"/>" class="navbar-search pull-left" method="get">
				<div class="control-group">
					<div class="controls">
						<div class="input-append">
							<input class="span2" name="term" type="text" placeholder="Search"/>
							<span class="add-on"><i class="icon-search"></i></span>
						</div>
					</div>
				</div>
			</form>
			<ul class="nav pull-right">
				<sec:authorize access="isAnonymous()">
					<li><a data-toggle="modal" href="#loginForm">Login</a></li>
					<li><a data-toggle="modal" href="#signupForm">Sign up</a></li>
				</sec:authorize>
				<sec:authorize access="hasRole('ROLE_USER')">
					<li id="inbox" data-read-url="<c:url value="/message/read"/>">
						<i class="icon-inbox"></i>
						<c:if test="${fn:length(notifications) > 0}">
							<span class="badge badge-important notification">${fn:length(notifications)}</span>
						</c:if>
					</li>
					<li id="mypage" data-sessionuser-nickname="${currentUser.nickname}">
						<a href="<c:url value="/mypage/${currentUser.id}"/>">My Page</a>
					</li>
					<li>
						<a href="<c:url value="/user/logout"/>">Logout</a>
					</li>
					<section class="popover fade bottom not visible" id="notification" style="display: block;">
						<div class="arrow"></div>
						<div class="popover-inner">
							<h3 class="popover-title">Notification</h3>
							<div class="popover-content row">
								<c:forEach items="${notifications}" var="notification">
								<article class="span4">
									<div class="row">
										<div class="span1">
											<a class="thumbnail" href="#">
												<c:choose>
													<c:when test="${not empty notification.from.encodeProfileImage}">
														<img class="notification-profile-image" alt="${notification.from.nickname}`s profile image" src="data:image/gif;base64,${notification.from.encodeProfileImage}"/>
													</c:when>
													<c:otherwise>
														<img class="notification-profile-image" alt="${notification.from.nickname}`s profile image" src="" data-src="holder.js/50x50/social"/>
													</c:otherwise>
												</c:choose>
											</a>
										</div>
										<div class="span3">
											<p class="notification-content">${notification.content}</p>
											<abbr class="notification-timeago pull-right" title="${notification.sentString}"></abbr>
										</div>
									</div>
								</article>
								</c:forEach>
							</div>
						</div>
					</section>
					<section id="notificationTemplate" style="display: none;">
						<img class="notification-profile-image" alt="profile image" src="data:image/gif;base64,"/>
						<p class="notification-content"></p>
					</section>
				</sec:authorize>
				<sec:authorize access="hasRole('ROLE_ADMIN')">
					<li><a href="<c:url value="/test/dummy/create"/>">creeate dummy</a></li>
					<li><a href="<c:url value="/test/dummy/delete"/>">delete dummy</a></li>
				</sec:authorize>
			</ul>
			<form action="<c:url value="/user/login"/>" method="post" class="form-horizontal modal hide fade in" id="loginForm">
				<div class="modal-header">
					<h3>Login</h3>
				</div>
				<fieldset class="modal-body">
					<div class="control-group">
						<label class="control-label" for="email">Email</label>
						<div class="controls">
							<input type="text" class="input-xlarge" id="email" name="email" placeholder="Email"/>
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="password">Password</label>
						<div class="controls">
							<input type="password" class="input-xlarge" id="password" name="password" placeholder="Password"/>
						</div>
					</div>
				</fieldset>
				<div class="modal-footer">
					<button class="btn btn-primary" type="submit">Login</button>
					<button class="btn" data-dismiss="modal">Cancel</button>
				</div>
			</form>
			<form class="form-horizontal modal hide fade in" id="signupForm" action="<c:url value="/user/signup"/>" enctype="multipart/form-data" method="post">
				<div class="modal-header">
					<h3>Sign up</h3>
				</div>
				<fieldset class="modal-body">
					<div class="control-group">
						<label class="control-label" for="email">Email</label>
						<div class="controls">
							<input type="text" class="input-xlarge" id="email" name="email" placeholder="Email"/>
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="password">Password</label>
						<div class="controls">
							<input type="password" class="input-xlarge" id="password" name="password" placeholder="Password"/>
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="profileImage">Profile Image</label>
						<div class="controls">
							<input type="file" class="input-file" name="profileImage" id="profileImage"/>
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="tag">Interests</label>
						<div class="controls">
							<input type="text" id="signupTag" name="tags" style="width:285px;" placeholder="Input your interests"/>
						</div>
					</div>
				</fieldset>
				<div class="modal-footer">
					<button class="btn btn-primary" type="submit">Sign up</button>
					<button class="btn" data-dismiss="modal">Cancel</button>
				</div>
			</form>
		</div>
	</div>
</nav>