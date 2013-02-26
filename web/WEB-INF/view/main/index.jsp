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
	<link rel="stylesheet" type="text/css" href="<c:url value="/css/teamplex-base.css"/>"/>
</head>
<body>
	<nav:gnb/>
	<h1>Hello, TEAM-PLEX!</h1>
	
	<script type="text/javascript" >
        var PREFIX = '<c:url value="/"/>';
    </script>
    <script type="text/javascript" data-main="<c:url value="/js/teamplex-main"/>" src="<c:url value="/js/require-jquery.js"/>"></script>
</body>
</html>