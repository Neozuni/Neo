<%@page import="context.model.MemberVO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%  ArrayList<MemberVO> list = (ArrayList)request.getAttribute("list"); %>   
<style type="text/css">
	body table{
		width: 50%;
		margin: opx;
		 margin-left: auto;
		 margin-right:  auto;
	}
	table tr:HOVER{
		text-align: center;
		background-color: pink;
	}
	
	#wrap{widht:300px;height:300px;  margin:0 auto; text-align:center;margin:100px;}
	
</style>
</head>


<body>
<%@ include file="../include/header.jsp" %>

<div id="wrap">
<table border="2">
	<tr>
		<th>ID</th><th>NAME</th><th>ADDRESS</th>
	</tr>
	<% for(int i=0; i<list.size(); i++){ %>
		<tr>
			<td><%= list.get(i).getId() %></td>
			<td><%= list.get(i).getName() %></td>
			<td><%= list.get(i).getAddress() %></td>
		</tr>
	<%} %>
</table>
</div>

<%@ include file="../include/footer.jsp" %>
</body>
</html>
















