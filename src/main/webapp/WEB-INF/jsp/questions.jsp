<%@include file="header.jsp" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
    <style>
    input[type="radio"]{  margin: 0 10px 0 10px;
}
hr {
    border: 1px solid #a6a6a6;
    margin-bottom: 25px;
}
.container {
    padding: 16px;
}
body {font-family: Arial, Helvetica, sans-serif;}
* {box-sizing: border-box}
input[type=submit]{
color: black;
padding: 0px 10px;
width: 100px;
height: 30px;
float: center;
backgorund-color: #23a5f6;
}
    </style>

</head>
<body>

<div class="container">
<h1><b>Let your Votes get into Action!</b></h1>
<hr>


<ul>
<form:form action="${pageContext.request.contextPath}/user/submit/${id}" modelAttribute="que" method="POST">
<c:forEach items="${pq}" var="question" varStatus="ch">
<h3>
<br>

<li>${question.que}<br><br>
<!--<form:radiobutton name="radioname" value="${question.op1}" label="${question.op1}" path="op1" /><br>
<form:radiobutton name="radioname" value="${question.op2}" label="${question.op2}" path="op2" /><br>
<form:radiobutton name="radioname" value="${question.op3}" label="${question.op3}" path="op3" /><br>-->
 <input type="radio" name="radioname[${ch.index}]" value="${question.op1}">${question.op1}
<input type="radio" name="radioname[${ch.index}]" value="${question.op2}">${question.op2}
<input type="radio" name="radioname[${ch.index}]" value="${question.op3}">${question.op3}
<input type="hidden" name="qid[${ch.index}]" value="${question.id}">
</li></h3>


</c:forEach>
<input type="submit" name="submit" style="float: center;margin: 3px 400px"  />
</form:form>
</ul>

<!-- <script>
$('input[type=submit]').click(function() {
    $(this).attr('disabled', 'disabled');
    $(this).parents('form').submit()
})
</script>-->
</div>

</body>
</html>