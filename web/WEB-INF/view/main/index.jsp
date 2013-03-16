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
			<a class="brand" href="/index">TEAM-PLEX</a>
			<ul class="nav pull-right">
				<li><a href="/user/signin">Sign-in</a></li>
				<li><a href="/user/login">Log-in</a></li>
			</ul>
		</div>
	</nav>
	
	<div class="container">
		<h1>TEAM-PLEX</h1>
		
		<section class="hero-unit">
			<div class="row">
				<div class="span4">
					<div class="thumbnail">
						<img alt="this is a post" src="holder.js/300x200"/>
						<div class="caption">
							<p>this is a post</p>
						</div>
					</div>
				</div>
				<div class="span4">
					<div class="thumbnail">
						<img alt="this is a Toz" src="holder.js/300x200"/>
						<div class="caption">
							<p>this is a Toz</p>
						</div>
					</div>
				</div>
				<div class="span4">
					<div class="thumbnail">
						<img alt="this is a dCafe" src="holder.js/300x200"/>
						<div class="caption">
							<p>this is a dCafe</p>
						</div>
					</div>
				</div>
			</div>
		</section>
	</div>

	<script type="text/javascript" >
        var CONTEXT_PATH = '<c:url value="/"/>';
    </script>
    <script type="text/javascript" data-main="<c:url value="/js/teamplex-main"/>" src="<c:url value="/js/require-jquery.js"/>"></script>
</body>
</html>