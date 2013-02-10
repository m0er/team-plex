<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>TEAM-PLEX Login Form</title>
	<link rel="stylesheet" type="text/css" href="<c:url value="/css/overcast/jquery-ui.css"/>">
	<link rel="stylesheet" type="text/css" href="<c:url value="/css/bootstrap.css"/>"/>
	<link rel="stylesheet" type="text/css" href="<c:url value="/css/teamplex-base.css"/>"/>
	<link rel="stylesheet" type="text/css" href="<c:url value="/css/teamplex-login-form.css"/>"/>
</head>
<body>
	<h1>${message}</h1>
	<div class="container" id="resultContainer">
		<form class="well form-horizontal" id="loginForm" action="<c:url value="/user/login"/>" method="post">
		    <fieldset>
			    <h2><a href="<c:url value="/list"/>">TEAM-PLEX</a> Sign in</h2>
			    <input type="hidden" name="redirectUrl" value="${redirectUrl}">
			    <div class="control-group ${not empty emailIncorrectMessage ?  "error" : ""}">
					<label class="control-label" for="inputEmail">Email</label>
					<div class="controls">
						<input type="text" name="email" placeholder="Email address" value="${email}">
						<span class="help-inline">${emailIncorrectMessage}</span>
					</div>
				</div>
			    <div class="control-group ${not empty passwordIncorrectMessage ?  "error" : ""}">
					<label class="control-label" for="inputPassword">Password</label>
					<div class="controls">
						<input type="password" name="password" placeholder="Password" value="">
						<span class="help-inline">${passwordIncorrectMessage}</span>
					</div>
				</div>
			    <div class="control-group">
					<div class="controls">
					    <input type="submit" class="btn btn-primary" value="Submit">
					</div>
				</div>
		    </fieldset>
	    </form>
	</div>
</body>
</html>