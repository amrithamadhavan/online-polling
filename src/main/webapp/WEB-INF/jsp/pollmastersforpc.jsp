<%@include file="header.jsp" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<style>
.container {
    padding: 16px;
}
hr {
    border: 1px solid #a6a6a6;
    margin-bottom: 25px;
}
.table1
{
border: 1px transparent;
width: 100%;
padding: 15 px;
text-align: left;
margin-bottom: 30px;

border-radius: 40px;
}
td{
height: 45px;

padding: 0px 20px;
font-size: 20px;
}
th{
height: 40px;
background-color: #e6e6e6;
padding: 0px 20px;
font-size: 25px;

}
</style>
</head>
<body>
<div class="container">
<h2><b>Poll Masters for Category</b></h2>
<p>They are already Poll Masters </p>
<hr>
<div class="table-responsive">
<table class="table1">
<tr>
<th>ID</th>
<th>Name</th>
<th></th>
</tr>
<c:forEach items="${pmforpc}" var="user">
<tr>
<td>${user.id}</td>
<td>${user.uname}</td>
<td><a class="btn btn-danger btn-lg" style="height: 30px;padding: 3px 15px;" href="${pageContext.request.contextPath}/admin/deletepmforpc/${id}/${user.id}">Delete</a></td>
</tr><br>
</c:forEach>
</table>
</div>
<br><br>
<h2><b>Existing Poll masters</b></h2>
<p>You can add these Poll Masters to the above Poll</p>
<hr>
<div class="table-responsive">
<table class="table1">
<tr>
<th>ID</th>
<th>Name</th>
<th></th>
</tr>
<c:forEach items="${pollmas}" var="pm">
<tr>
<td>${pm.id}</td>
<td>${pm.uname}</td>
<td><a class="btn btn-info btn-lg" style="height: 35px;padding: 3px 15px;" href="${pageContext.request.contextPath}/admin/addpmforpc/${id}/${pm.id}">Add</a></td>
</tr><br>
</c:forEach>
</table>
</div>
</div>
</body>
</html>
