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
<form:form action="${pageContext.request.contextPath}/user/submit/${id}" modelAttribute="que">
<c:forEach items="${pq}" var="question" varStatus="ch">
<h3>
<br>

<li>${question.que}<br><br>
<!--<form:radiobutton name="radioname" value="${question.op1}" label="${question.op1}" path="op1" /><br>
<form:radiobutton name="radioname" value="${question.op2}" label="${question.op2}" path="op2" /><br>
<form:radiobutton name="radioname" value="${question.op3}" label="${question.op3}" path="op3" /><br>-->
 <input type="radio" name="radioname[${ch.index}]" value="${question.op1}">${question.op1}<br>
<input type="radio" name="radioname[${ch.index}]" value="${question.op2}">${question.op2}<br>
<input type="radio" name="radioname[${ch.index}]" value="${question.op3}">${question.op3}<br>
<input type="hidden" name="qid[${ch.index}]" value="${question.id}">
</li></h3>


</c:forEach>
<input type="submit" name="submit" />
</form:form>
</ul>

<!-- <script>
$('input[type=submit]').click(function() {
    $(this).attr('disabled', 'disabled');
    $(this).parents('form').submit()
})-->
</script>
</body>
</html>