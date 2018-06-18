


<%@include file="header.jsp" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
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

.alert {
    padding: 20px;
    background-color: #ff3c1a; /* Red */
    color: white;
    margin-bottom: 15px;
}

/* The close button */
.closebtn {
    margin-left: 15px;
    color: white;
    font-weight: bold;
    float: right;
    font-size: 22px;
    line-height: 20px;
    cursor: pointer;
    transition: 0.3s;
}
.closebtn:hover {
    color: black;
}

</style>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

</head>
<body>
<div class="container">
<h2>Check Poll Results</h2>
<hr><br><br>
<ul>
<c:set var="total" value="0" scope="page" />
<c:forEach items="${categories}" var="category">
<c:forEach items="${pollcount}"  var="count">
<c:if test="${category.id==count.pcid}" >
<c:set var="total" value="${total + 1}" scope="page"/>
<h2><a class="col-sm-6" href="${pageContext.request.contextPath}/viewcount/${category.id}">${category.pollcategory}</a>${count.count}

</h2></c:if>

</c:forEach>
</c:forEach>
<c:if test="${total==0}">
<div class="alert">
<span class="closebtn" onclick="this.parentElement.style.display='none';">&times;</span> 
no polls are attended yet..!
 </div>
</c:if>
</ul>
</div>
</body>
</html>