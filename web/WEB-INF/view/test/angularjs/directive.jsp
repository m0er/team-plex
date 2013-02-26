<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="str" uri="http://jakarta.apache.org/taglibs/string-1.1" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="nav" tagdir="/WEB-INF/tags/nav" %>
<!DOCTYPE html>
<html ng-app="directive">
<head>
	<meta charset="UTF-8" />
	<title>Angular.js learning test</title>
	<link rel="shortcut icon" href="/favicon.ico" type="image/x-icon">
	<link rel="stylesheet" type="text/css" href="<c:url value="/css/bootstrap.min.css"/>"/>
	<link rel="stylesheet" type="text/css" href="<c:url value="/css/test.css"/>"/>
</head>
<body>
	<div contenteditable="true" ng-model="content">Edit Me</div>
	<pre>model = {{content}}</pre>

	<script type="text/javascript" >
        var PREFIX = '<c:url value="/"/>';
    </script>
	<script type="text/javascript" src="<c:url value="/js/angular/angular.js"/>"></script>
	<script type="text/javascript" src="<c:url value="/js/angular/directive.js"/>"></script>
</body>
</html>