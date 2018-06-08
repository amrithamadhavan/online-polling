<%@include file="header.jsp" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<style>
.form-control
{
width:400
}
</style>
</head>
<body>
<form:form action="${pageContext.request.contextPath}/ap/savequestion/${cid}" modelAttribute="question">
		<table class="table">
			<tr class="form-group">
				<td>Question:</td>
				<td><form:input type="text" class="form-control" name="que" required="required" path="que"/></td>
			</tr>
			<tr class="form-group">
				<td>option 1:</td>
				<td><form:input type="text" class="form-control" name="op1" required="required" path="op1"/></td>
			</tr>
			<tr class="form-group">
				<td>option 2:</td>
				<td><form:input type="text" class="form-control" name="op2" required="required" path="op2"/></td>
			</tr>
			<tr class="form-group">
				<td>option 3:</td>
				<td><form:input type="text" class="form-control" name="op3" required="required" path="op3"/></td>
			</tr>
			<tr class="form-group">
			<td>Category:</td>
			<td>${pcname}<form:input type="hidden" class="form-control" name="category" required="required" value="${cid}"  path="pollcategory.id"/></td>
			</tr>
			<!--  <tr>
			<td>Category:</td>
			<td><form:input type="hidden" name="category" required="required" value="${cid}"  path="pollcategory.id"/></td>
			</tr>-->
			
			<!--  <tr>
				<td>Category:</td>
				<td><form:select path="pollcategory.id">
		            <form:options items="${pollcategorylist}" itemLabel="pollcategory" itemValue="id"></form:options>
		            </form:select>
				    </td>
			</tr>-->
			<tr>
				<td><input type="submit" value="Add" class="btn btn-primary"></td>
			</tr>
			
		</table>
	</form:form>