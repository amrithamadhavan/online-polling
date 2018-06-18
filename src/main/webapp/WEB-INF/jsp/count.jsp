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
.table1
{

width: 100%;
padding: 15 px;
text-align: left;
margin-bottom: 30px;
padding: 0px 20px;
font-size: 20px;

}
.abc,th{
border-bottom: 2px solid black;
}
td{
height: 50px;

margin-left: 15px;
}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<div class="container">
<h2>Question level Results</h2><br>
<table class="table1">

<th>Question</th><th>Count</th>

<c:forEach items="${result}" var="output">
<h2>
<tr><td></td><td></td></tr>

<tr>
<c:set var="total" value="${output.op1cnt+output.op2cnt+output.op3cnt}" />
<td><b>
${output.getPollquestion().getQue()}<br><br></td>
<td>${total}</h2></b></td>
</tr>
<!-- <input type="radio" name="radioname" value="${output.getPollquestion().getOp1()}">${question.op1}<br>
<input type="radio" name="radioname" value="${output.getPollquestion().getOp2()}">${question.op2}<br>
<input type="radio" name="radioname" value="${output.getPollquestion().getOp3()}">${question.op3}<br>
</li></h3>-->
<h3>
<tr>
<td>
${output.getPollquestion().getOp1()}   </td><td>   ${output.op1cnt}</td></tr>
<tr>
<td>
${output.getPollquestion().getOp2()}  </td><td>   ${output.op2cnt}</td></tr>
<tr>
<td>
${output.getPollquestion().getOp3()} </td>
<td>   ${output.op3cnt}</td>
</tr>
<tr class="abc">
<td></td><td></td></tr>
</h3>

</c:forEach>

</table>
</div>