<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:if test="${check==1 }">
<meta http-equiv="Refresh"
	content="0;url=/myWeb/board/list.do?pageNum=${pageNum }">
	</c:if>

<c:if test="${check==0 }">
비밀번호가 다릅니다. <br><br>
<a href="javascript:history.go(-1)">[글삭제 폼으로 돌아가기]</a>
 </c:if>
 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>