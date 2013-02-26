<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="str" uri="http://jakarta.apache.org/taglibs/string-1.1" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="nav" tagdir="/WEB-INF/tags/nav" %>
<!DOCTYPE html>
<html ng-app>
<head>
	<meta charset="UTF-8" />
	<title>Angular.js learning test</title>
	<link rel="shortcut icon" href="/favicon.ico" type="image/x-icon">
	<link rel="stylesheet" type="text/css" href="<c:url value="/css/bootstrap.min.css"/>"/>
	<link rel="stylesheet" type="text/css" href="<c:url value="/css/test.css"/>"/>
</head>
<body>
	<div ng-controller="GreetingController">
		Hello, {{name}}
	</div>
	<div ng-controller="ListController">
		<ol>
			<li ng-repeat="name in names">{{name}}</li>
		</ol>
	</div>
	
	<div ng-controller="ButtonController">
		Hello, {{name2}}!
		<button ng-click="action()">OK</button>
	</div>
	
	<div ng-init="list = ['Chrome', 'Safari', 'Firefox', 'IE']">
		<input ng-model="list" ng-list required> <br>
		<input ng-model="list" ng-list> <br>
		<pre>list={{list}}</pre> <br>
		<ol>
			<li ng-repeat="item in list">{{item}}</li>
		</ol>
	</div>
	
	<div contenteditable="true" ng-model="content">Edit Me</div>
	<pre>model = {{content}}</pre>

	<script type="text/javascript" >
        var PREFIX = '<c:url value="/"/>';
    </script>
	<script type="text/javascript" src="<c:url value="/js/angular/angular.js"/>"></script>
	<script type="text/javascript" src="<c:url value="/js/angular/directive.js"/>"></script>
</body>
</html>