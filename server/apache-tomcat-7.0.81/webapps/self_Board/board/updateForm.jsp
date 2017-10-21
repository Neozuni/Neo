<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="view/color.jspf" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시판</title>
<link href="style.css" rel="stylesheet" type="text/css">
<script language="JavaScript" src="script.js"></script>
</head>
<body bgcolor="${bodyback_c }">
<center><b>글수정</b>
<br>
<form method="post" name="writeform" action="/myWeb/board/updatePro.do?pageNum=${pageNum }" onsubmit="return writeSave()">
<table width="400" border="1" cellpadding="0" cellspacing="0" align="center">
	
	<tr>
	<td width="70" bgcolor="${value_c }" align="center">이 름</td>
	<td align="left" width="330">
	<input type="text" size="10" maxlength="10" name="writer" value="${article.writer }">
	<input type="hidden" name="num" value="${article.num }"></td>
	</tr>

	<tr>
	<td width="70" bgcolor="${value_c }" align="center">제 목</td>
	<td align="left" width="330">
	<input type="text" size="40" maxlength="50" name="subject" value="${article.subject }"></td>
	</tr>

	<tr>
	<td width="70" bgcolor="${value_c }" align="center"> Email</td>
	<td align="left" width="330">
	<input type="text" size="40" maxlength="30" name="email" value="${article.email }"></td>
	</tr>
	
	<tr>
	<td width="70" bgcolor="${value_c }" align="center">내 용</td>
	<td align="left" width="330">
	<textarea name="content" rows="13" cols="40"> ${article.content}</textarea></td>
	</tr>
	
	<tr>
	<td width="70" bgcolor="${value_c }" align="center">비밀번호</td>
	<td align="left" width="330">
	<input type="password" size="8" maxlength="12" name="pass"></td>
	</tr>
	
	<tr>
	<td colspan="2" bgcolor="${value_c }" align="center">
	<input type="submit" value="글수정">
	<input type="reset" value="다시작성">
	<input type="button" value="목록보기"
				onclick="document.location.href='myWeb/board/list.do?pageNum=${pageNum}'">
	</td>
	</tr>
</table></form></center>

</body>
</html>