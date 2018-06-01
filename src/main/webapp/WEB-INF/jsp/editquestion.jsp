<%@include file="header.jsp" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style>
.display {
    margin-left: 100px;
    margin-bottom: 30px;
    margin-top: -61px;
}
.navbar-inverse {
    background-color: #222;
    border-color: #080808;
    margin-left: -68px;
    margin-right: -68px;
}
.form-control
{
width:400
}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>Insert title here</title>
</head>

<body bgcolor="gray" class="container">
<!-- <button class="btn btn-danger"><a href="<c:url value='/display' />">Display</a></button>-->
	<h2>Edit Question</h2>
	
	<form:form action="${pageContext.request.contextPath}/admin/confeditque/${cid}" modelAttribute="que">
		<table class="table">
		
				<form:input type="hidden" name="queid" class="form-control" value="${que.id}" path="id"/>
			
		
			<tr class="form-group">
				<td>question:</td>
				<td><form:input type="text" name="queproductName" class="form-control" value="${que.que}" path="que"/></td>
			    <td><form:errors path = "que"  /></td>
			</tr>
			<tr class="form-group">
				<td>option 1:</td>
				<td><form:input type="text" name="op1"  class="form-control" value="${que.op1}" path="op1"/></td>
			    <td><form:errors path = "op1"  /></td>
			</tr>
			<tr class="form-group">
				<td>option 2:</td>
				<td><form:input type="text" name="op2"  class="form-control" value="${que.op2}" path="op2"/></td>
			    <td><form:errors path = "op2"  /></td>
			</tr>
			<tr class="form-group">
				<td>option 3:</td>
				<td><form:input type="text" name="op3"  class="form-control" value="${que.op3}" path="op3"/></td>
			    <td><form:errors path = "op3"  /></td>
			</tr>
			<!-- <tr class="form-group">
			<td>pollcategory:</td>
			<td><form:input type="text" name="category"  class="form-control" value="${que.getPollcategory().getPollcategory()}" path="pollcategory.id" /></td>
			</tr>-->
			<tr class="form-group">
				<td>PollCategory:</td>
				<td><form:select class="form-control" path="pollcategory.id">
		            <form:options items="${categories}" itemLabel="pollcategory" itemValue="id"></form:options>
		            </form:select>
				    </td>
			</tr>
			<tr>
				<td><input type="submit" value="update" class="btn btn-primary"></td>
				
			</tr>
		</table>
	</form:form>
</body>
</html>