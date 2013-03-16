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
</head>
<body>
	<div class="navbar">
		<div class="navbar-inner">
			<a class="brand" href="/index">TEAM-PLEX</a>
			<ul class="nav">
				<li><a href="/user/signin">Sign-in</a></li>
				<li><a href="/user/login">Log-in</a></li>
			</ul>
		</div>
	</div>

	<script type="text/javascript" >
        var CONTEXT_PATH = '<c:url value="/"/>';
    </script>
    <script type="text/javascript" data-main="<c:url value="/js/teamplex-main"/>" src="<c:url value="/js/require-jquery.js"/>"></script>
</body>
</html>