<%@include file="header.jsp" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<style>
.container {
    padding: 16px;
}
hr {
    border: 1px solid #a6a6a6;
    margin-bottom: 25px;
}
a:link{
color: grey;

text-decoration: none;
opacity: 1;
}
a:visited{
color: grey;

text-decoration: none;
opacity: 1;
}
a:hover {
    color: grey;

    text-decoration: none;
    opacity: 0.5;
}
a:active {
    color: grey;
  
    text-decoration: none;
    opacity: 0.7;
}
</style>
</head>
<body>
<div class="container">
<h1><b>Welcome to Poll Master's Page</b></h1>
<p>If voting changed anything, they'd make it Illegal</p>
<hr><br><br>
<ul style="align: center;">
<c:forEach items="${categories}" var="category">
<h2><li><a class="col-sm-5" href="${pageContext.request.contextPath}/ap/listquestions/${category.id}">${category.pollcategory}</a>
<a class="btn btn-info btn-sm" style="margin-left:20px;color: white;" href="${pageContext.request.contextPath}/ap/editcategory/${category.id}">Edit</a></h2>
</c:forEach>
</ul>
</div>

</body>
</html>