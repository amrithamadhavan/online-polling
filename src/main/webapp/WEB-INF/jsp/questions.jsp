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
<form:form action="${pageContext.request.contextPath}/user/submit" modelAttribute="que">
<li>${question.que}<br><br>
<!--<form:radiobutton name="radioname" value="${question.op1}" label="${question.op1}" path="op1" /><br>
<form:radiobutton name="radioname" value="${question.op2}" label="${question.op2}" path="op2" /><br>
<form:radiobutton name="radioname" value="${question.op3}" label="${question.op3}" path="op3" /><br>-->
 <input type="radio" name="radioname" value="${question.op1}">${question.op1}<br>
<input type="radio" name="radioname" value="${question.op2}">${question.op2}<br>
<input type="radio" name="radioname" value="${question.op3}">${question.op3}<br>
</li></h3>
<input type="submit" name="submit">
</form:form>
</c:forEach>
</ul>


</body>
</html>