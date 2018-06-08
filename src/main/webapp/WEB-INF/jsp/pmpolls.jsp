<%@include file="header.jsp" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body><h1>welcome to pm page</h1>

<ul style="margin-left:600px;margin-top:100px">
<c:forEach items="${categories}" var="category">
<h2><li><a class="col-sm-3" href="${pageContext.request.contextPath}/ap/listquestions/${category.id}">${category.pollcategory}</a><a class="btn btn-info btn-sm" style="margin-left:20px" href="${pageContext.request.contextPath}/ap/editcategory/${category.id}">Edit</a></h2>
</c:forEach>
</ul>
</body>
</html>