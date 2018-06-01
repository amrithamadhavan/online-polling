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
<ul>
<c:forEach items="${pq}" var="question">
<h3>
<br>


<li>${question.que}<br><br>

 <input type="radio" name="radioname" value="${question.op1}">${question.op1}<br>
<input type="radio" name="radioname" value="${question.op2}">${question.op2}<br>
<input type="radio" name="radioname" value="${question.op3}">${question.op3}<br>
</li></h3>
<a class="btn btn-info btn-sm" style="margin-left:20px" href="${pageContext.request.contextPath}/admin/editquestion/${question.id}">Edit</a><a class="btn btn-danger btn-sm" style="margin-left:20px" href="${pageContext.request.contextPath}/admin/deletequestion/${question.id}">Delete</a>

</c:forEach>
</ul>

<div style="margin-left:650px;margin-top:50px">
<a class="btn btn-info btn-lg" href="${pageContext.request.contextPath}/admin/addquestions/${id}">Add</a>
</div>