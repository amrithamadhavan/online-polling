<%@include file="header.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<style>
hr {
    border: 1px solid #f1f1f1;
    margin-bottom: 25px;
}
body {font-family: Arial, Helvetica, sans-serif;}

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
color: #a6a6a6;
text-decoration: none;
opacity: 1;
cursor: not-allowed;
}
a:hover {
    color: grey;

    text-decoration: none;
    opacity: 0.7;
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
</head>
<body>

<div class="container">
<h1><b>The list of Polls</b></h1>
<hr>

<ul style="margin-left:100px;margin-top:100px">
<c:forEach items="${categories}" var="category">

<!---->
<h3><li><a href="${pageContext.request.contextPath}/user/listquestions/${category.id}">${category.pollcategory}</h3>
</c:forEach>
</ul>
<c:if test="${tes==0}">
<div class="alert">
<span class="closebtn" onclick="this.parentElement.style.display='none';">&times;</span> 
you have completed all the polls.!
 </div>
</c:if>
</div>

</body>
</html>