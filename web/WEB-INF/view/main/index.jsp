<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="str" uri="http://jakarta.apache.org/taglibs/string-1.1" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="nav" tagdir="/WEB-INF/tags/nav" %>
<%@ taglib prefix="template" tagdir="/WEB-INF/tags/template" %>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<title>TEAM-PLEX Main Page</title>
	<link rel="stylesheet" type="text/css" href="<c:url value="/css/overcast/jquery-ui-1.10.1.custom.css"/>">
	<link rel="stylesheet" type="text/css" href="<c:url value="/css/bootstrap.css"/>"/>
	<link rel="stylesheet" type="text/css" href="<c:url value="/css/bootstrap-responsive.css"/>"/>
	<link rel="stylesheet" type="text/css" href="<c:url value="/css/teamplex-base.css"/>"/>
	<link rel="stylesheet" type="text/css" href="<c:url value="/css/teamplex-main.css"/>"/>
</head>
<body>
	<nav class="navbar">
		<div class="navbar-inner">
			<ul class="nav pull-right">
				<li><a href="/user/signin">Sign-in</a></li>
				<li><a href="/user/login">Log-in</a></li>
			</ul>
		</div>
	</nav>
	
	<div class="container hide">
		<h1>TEAM-PLEX</h1>
		
		<section class="hero-unit">
			<div id="guide" class="carousel slide" data-interval="false">
				<!-- Carousel items -->
				<div class="carousel-inner">
					<section class="active item guide1">
						<header class="page-header">
							<p>팀플렉스는 게임에 대해 서로의 생각과 도전을 공유하는 곳입니다.</p>
						</header>
						<article class="row">
							<div class="span3">
								<div class="thumbnail">
									<div class="caption">Post</div>
									<img alt="this is a post" src="holder.js/260x180"/>
									<div class="caption">
										<p>게임에 대한 나의 생각이 표현되고</p>
									</div>
								</div>
							</div>
							<div class="span1">›</div>
							<div class="span3">
								<div class="thumbnail">
									<div class="caption">Toz</div>
									<img alt="this is a Toz" src="holder.js/260x180"/>
									<div class="caption">
										<p>각자의 이야기가 모이면</p>
									</div>
								</div>
							</div>
							<div class="span1">›</div>
							<div class="span3">
								<div class="thumbnail">
									<div class="caption">D-Cafe</div>
									<img alt="this is a dCafe" src="holder.js/260x180"/>
									<div class="caption">
										<p>커뮤니티가 만들어집니다.</p>
									</div>
								</div>
							</div>
						</article>
					</section>
					<section class="item guide2">
						<section class="fake-modal modal-post">
							<header class="modal-header">
						 		<img class="profile-image" data-src="holder.js/50x50/social" alt="writer image" />
						 		<h3 class="post-title">만약..</h3>
						 		<article class="post-content">
						 			당신이 포스트를 작성하면
								</article>
							</header>
							<article class="modal-body">
						 	</article>
						</section>
					</section>
					<section class="item guide3">
						<section class="fake-modal modal-post">
							<header class="modal-header">
						 		<img class="profile-image" data-src="holder.js/50x50/social" alt="writer image" />
						 		<h3 class="post-title">만약..</h3>
						 		<article class="post-content">
						 			당신이 포스트를 작성하면
								</article>
							</header>
							<article class="modal-body">
								<div class="modal-reply">
									<article class="reply hide">
										<img data-src="holder.js/50x50/social" alt="50x50" class="profile-image" width="50" height="50">
										<p class="replyer-nickname"><strong>TEAM-PLEX</strong></p>
							 			<p class="reply-content">사람들이 참여합니다.</p>
									</article>
									<article class="reply hide">
										<img data-src="holder.js/50x50/social" alt="50x50" class="profile-image" width="50" height="50">
										<p class="replyer-nickname"><strong>TEAM-PLEX</strong></p>
							 			<p class="reply-content">어떤이는 반대도 하고,</p>
									</article>
									<article class="reply hide">
										<img data-src="holder.js/50x50/social" alt="50x50" class="profile-image" width="50" height="50">
										<p class="replyer-nickname"><strong>TEAM-PLEX</strong></p>
							 			<p class="reply-content">어떤이는 질문도 하지요.</p>
									</article>
									<article class="reply hide">
										<img data-src="holder.js/50x50/social" alt="50x50" class="profile-image" width="50" height="50">
										<p class="replyer-nickname"><strong>TEAM-PLEX</strong></p>
							 			<p class="reply-content">어떤이는 공감도 해주고요.</p>
									</article>
							  	</div>
						 	</article>
						</section>
					</section>
					<section class="item guide4">
						<section class="fake-modal modal-post">
							<header class="modal-header">
						 		<img class="profile-image" data-src="holder.js/50x50/social" alt="writer image" />
						 		<h3 class="post-title">만약..</h3>
						 		<article class="post-content">
						 			당신이 포스트를 작성하면
								</article>
							</header>
							<article class="modal-body">
								<div class="modal-reply">
									<article class="reply">
										<img data-src="holder.js/50x50/social" alt="50x50" class="profile-image" width="50" height="50">
										<p class="replyer-nickname"><strong>TEAM-PLEX</strong></p>
							 			<p class="reply-content">사람들이 참여합니다.</p>
									</article>
									<article class="reply">
										<img data-src="holder.js/50x50/social" alt="50x50" class="profile-image" width="50" height="50">
										<p class="replyer-nickname"><strong>TEAM-PLEX</strong></p>
							 			<p class="reply-content">어떤이는 반대도 하고,</p>
									</article>
									<article class="reply">
										<img data-src="holder.js/50x50/social" alt="50x50" class="profile-image" width="50" height="50">
										<p class="replyer-nickname"><strong>TEAM-PLEX</strong></p>
							 			<p class="reply-content">어떤이는 질문도 하지요.</p>
									</article>
									<article class="reply">
										<img data-src="holder.js/50x50/social" alt="50x50" class="profile-image" width="50" height="50">
										<p class="replyer-nickname"><strong>TEAM-PLEX</strong></p>
							 			<p class="reply-content">어떤이는 공감도 해주고요.</p>
									</article>
							  	</div>
						 	</article>
						</section>
						<section class="fake-modal modal-post hide">
							<header class="modal-header">
						 		<img class="profile-image" data-src="holder.js/50x50/social" alt="writer image" />
						 		<h3 class="post-title">당신의 대화에 감명받은 누군가는..</h3>
						 		<article class="post-content">
						 			대화에 새로운 포스트를 붙입니다.
								</article>
							</header>
							<article class="modal-body">
						 	</article>
						</section>
						<section class="fake-modal modal-post hide">
							<header class="modal-header">
						 		<img class="profile-image" data-src="holder.js/50x50/social" alt="writer image" />
						 		<h3 class="post-title">이들의 대화는</h3>
						 		<article class="post-content">
								</article>
							</header>
							<article class="modal-body">
						 	</article>
						</section>
						<section class="fake-modal modal-post hide">
							<header class="modal-header">
						 		<img class="profile-image" data-src="holder.js/50x50/social" alt="writer image" />
						 		<h3 class="post-title">이어지고..</h3>
						 		<article class="post-content">
								</article>
							</header>
							<article class="modal-body">
						 	</article>
						</section>
					</section>
					<section class="item guide5">
						<header class="page-header">
							<p>하나의 커뮤니티가 탄생합니다.</p>
						</header>
						<article class="thumbnail">
							<img alt="this is a post" src="holder.js/700x300"/>
						</article>
					</section>
					<section class="item guide6">
						<header class="page-header">
							<p>등록은 쉽습니다. 원하는 버튼을 눌러보세요:</p>
						</header>
						<article class="row">
							<div class="span3">
								<a href="/user/signup/twitter" class="thumbnail">
									<img alt="twitter" src="<c:url value="/img/Twitter alt 2.png"/>"/>
								</a>
							</div>
							<div class="span3">
								<a href="/user/signup/facebook" class="thumbnail">
									<img alt="facebook" src="<c:url value="img/Facebook alt 1.png"/>"/>
								</a>
							</div>
							<div class="span3">
								<a href="/user/signup/steam" class="thumbnail">
									<img alt="steam" src="<c:url value="img/Steam alt.png"/>"/>
								</a>
							</div>
						</article>
						<footer>
							<p><a href="/user/signup/email">이메일로 가입하려면 선택하세요.</a></p>
						</footer>
					</section>
				</div>
				<!-- Carousel nav -->
				<a class="carousel-control left hide" href="#guide" data-slide="prev">&lsaquo;</a>
				<a class="carousel-control right" href="#guide" data-slide="next">&rsaquo;</a>
			</div>
		</section>
	</div>

	<script type="text/javascript" >
        var CONTEXT_PATH = '<c:url value="/"/>';
    </script>
    <script type="text/javascript" data-main="<c:url value="/js/teamplex-main"/>" src="<c:url value="/js/require-jquery.js"/>"></script>
</body>
</html>