<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page contentType = "text/html; charset=UTF-8" %>
<%@ tagilb prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="view/color.jspf" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시판</title>
<link herf="style" rel="stylesheet" type="text/css">
<script language="JavaScript" src="script.js"></script>
</head>
<body bgcolor="${bodyback_c }">
<center><b>글쓰기</b>
<br></br>
<form method="post" name="writeform" action="/myWeb/board/writePro.do" onsubmit="return writeSave()">
<input type="hidden" name="num" value="${num}">
<input type="hidden" name="ref" value="${ref}">
<input type="hidden" name="step" value="${step}">
<input type="hidden" name="depth" value="${depth}">
<table width="400" border="1" cellpadding="0" cellspacing="0" align="center">
<tr>
<td align="center" colspan="2" bgcolor="${value_c }">
<a herf="/myWeb/board/list.do">글목록</a>
</td>
</tr>
<tr>
<td width="70" bgcolor="${value_c }" align="center">이름</td>
<td width="330">
<input type="text" size="10" maxlength="10" name="writer"></td>
</tr>
<tr>
<td width="70" bgcolor="${value_c }" align="center">제목</td>
<td width="330">
	<c:if test="${num==0 }">
	<input type="text" size="40" maxlength="50" name="subject">
	</c:if>
	<c:if test="${num!=0 }">
	<input type="text" size="40" maxlength="50" name="subject" value="[답변]">
	</c:if>
	</td>
</tr>
<tr>
<td width="70" bgcolor="${value_c }" align="center">Email</td>
	<td width="330">
	<input type="text" size="40" maxlength="30" name="email"></td>
	</tr>
	<tr>
	<td width="70" bgcolor="${value_c }" align="center">내 용</td>
	<td width="330">
	<textarea name="content" rows="13" cols="40"></textarea></td>
	</tr>
	
	<tr>
	<td width="70" bgcolor="${value_c }" align="center">비밀번호</td>
	<td width="330">	
	<input type="password" size="8" maxlength="12" name="pass">
	</td>
	</tr>
	
	<tr>
	<td colspan="2" bgcolor="${value_c }" align="center">
	<input type="submit" value="글쓰기">
	<input type="reset" value="다시작성">
	<input type="button" value="목록보기" onclick="windows.location='/myWeb/board/list.doi'">
	</td>
	</tr>

</table>



</form>
</body>
</html>