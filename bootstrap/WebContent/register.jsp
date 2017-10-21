<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript">
	function passCheck() {
		//비밀번호가 일치하지 않으면 페이지 이동 안되도록...
		//메세지 띄워주고
		var f = document.registerForm;
		if (f.password.value != f.repassword.value) {
			alert("비밀번호가 일치하지 않습니다");
			f.repassword.value = "";
			f.repassword.focus();
			return false;
		}
	}
</script>

<style type="text/css">

#wrap{widht:300px;height:300px;  margin:0 auto; text-align:center;margin:100px;}
</style>


<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@ include file="./include/header.jsp"%>

	<div id=wrap>
		<form action="Register" method="post" name="registerForm"
			onsubmit="return passCheck()">
			ID : <input type="text" name="id" required="required"><br>
			<br> PASSWORD : <input type="password" name="password"
				required="required"><br>
			<br> PASSWORD CONFIRM : <input type="password" name="repassword"
				required="required"><br>
			<br> NAME : <input type="text" name="name" required="required"><br>
			<br> ADDRESS : <input type="text" name="address"
				required="required"><br>
			<br> <input type="submit" value="member register">
		</form>
	</div>

	<%@ include file="./include/footer.jsp"%>
</body>
</html>