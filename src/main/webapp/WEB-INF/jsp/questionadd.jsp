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
<form:form action="${pageContext.request.contextPath}/admin/savequestion/${cid}" modelAttribute="question">
		<table class="table">
			<tr>
				<td>Question:</td>
				<td><form:input type="text" name="que" required="required" path="que"/></td>
			</tr>
			<tr>
				<td>option 1:</td>
				<td><form:input type="text" name="op1" required="required" path="op1"/></td>
			</tr>
			<tr>
				<td>option 2:</td>
				<td><form:input type="text" name="op2" required="required" path="op2"/></td>
			</tr>
			<tr>
				<td>option 3:</td>
				<td><form:input type="text" name="op3" required="required" path="op3"/></td>
			</tr>
			
			<!-- <tr>
			<td>Category:</td>
			<td><form:input type="text" name="category" required="required" value="${pcname}"  path="pollcategory.id"/></td>
			</tr>-->
			
			 <tr>
				<td>Category:</td>
				<td><form:select path="pollcategory.id">
		            <form:options items="${pollcategorylist}" itemLabel="pollcategory" itemValue="id"></form:options>
		            </form:select>
				    </td>
			</tr>
			<tr>
				<td><input type="submit" value="Add" class="btn btn-primary"></td>
			</tr>
			
		</table>
	</form:form>