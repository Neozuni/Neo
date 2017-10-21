<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

#wrap{widht:300px;height:300px;  margin:0 auto; text-align:center;margin-top:300px;}

</style>
</head>
<body>
<%@ include file="./include/header.jsp" %>
	<div id=wrap>
	
	<form action="login" method="post" name="frm" id="frm">
		
		아이디 &nbsp; :<input type="text" name="id" id="id"  /><br>
		패스워드:<input type="password" name="password" id="password"/><br>
		<input type="submit" value="로그인하기" /> &nbsp; &nbsp;
		<br>
		<% String result =(String)request.getAttribute("register"); 
			
		if(result !=null ){%>
		
		<b style="color:red">	<%=result%></b>
		
		<% }else{ %>
			<%=""  %>
			
		<% } %>
		
		<% String error =(String)request.getAttribute("error"); 
		if(error != null ){%>
		<b style="color:red">	<%=error%></b>
		
		<% }else{ %>
			<%=""%>
			
		<% } %>
		
		
		
	
	</form>
	
	</div>
<%@ include file="./include/footer.jsp" %>
</body>
</html>
