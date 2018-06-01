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

<ul style="margin-left:600px;margin-top:100px">
<c:forEach items="${categories}" var="category">
<h2><li><a href="${pageContext.request.contextPath}/user/listquestions/${category.id}">${category.pollcategory}</h2>
</c:forEach>
</ul>
<center>
</body>
</html>