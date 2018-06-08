<%@include file="header.jsp" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<h2>PollMasters for the Poll..!</h2>
<div class="table-responsive">
<table class="table">
<tr>
<th>Id</th>
<th>Name</th>
<th>Op</th>
</tr>
<c:forEach items="${pmforpc}" var="user">
<tr>
<td>${user.id}</td>
<td>${user.uname}</td>
<td><a class="btn btn-danger btn-lg" href="${pageContext.request.contextPath}/admin/deletepmforpc/${id}/${user.id}">delete</a></td>
</tr><br>
</c:forEach>
</table>
</div>
<br><br>
<h2>PollMasters You Can Add...!</h2>
<div class="table-responsive">
<table class="table">
<tr>
<th>Id</th>
<th>Name</th>
<th>Op</th>
</tr>
<c:forEach items="${pollmas}" var="pm">
<tr>
<td>${pm.id}</td>
<td>${pm.uname}</td>
<td><a class="btn btn-info btn-lg" href="${pageContext.request.contextPath}/admin/addpmforpc/${id}/${pm.id}">Add</a></td>
</tr><br>
</c:forEach>
</table>
</div>
<!-- <div style="margin-left:650px;margin-top:50px">
<a class="btn btn-info btn-lg" href="${pageContext.request.contextPath}/admin/addpmforpc/${id}">Add</a>
</div>-->
