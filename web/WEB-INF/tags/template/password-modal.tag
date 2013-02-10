<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<form action="<c:url value="/mypage/${dto.user.id}/password/update"/>" method="post" class="form-horizontal modal hide fade in" id="passwordFormTemplate">
	<div class="modal-header">
		<h3>Change Password</h3>
	</div>
	<fieldset class="modal-body">
		<div class="control-group">
			<label class="control-label" for="inputPassword">Current Password</label>
			<div class="controls">
				<input type="password" class="input-medium" id="inputPassword" name="currentPassword" placeholder="input current password"/>
				<span class="help-inline"></span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label" for="inputNewPassword">New Password</label>
			<div class="controls">
				<input disabled type="password" class="input-medium" id="inputNewPassword" name="newPassword" placeholder="input new password"/>
				<span class="help-inline"></span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label" for="inputNewPasswordAgain">Confirm</label>
			<div class="controls">
				<input disabled type="password" class="input-medium" id="inputNewPasswordAgain" name="newPasswordAgain" placeholder="type again new password"/>
				<span class="help-inline"></span>
			</div>
		</div>
	</fieldset>
	<div class="modal-footer">
		<button class="btn btn-primary" type="submit" disabled>Submit</button>
		<button class="btn" data-dismiss="modal">Cancel</button>
	</div>
</form>