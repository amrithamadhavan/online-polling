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
  <h1>Add categories using Ajax ........</h1>
     <form:form class="form-horizontal" action="${pageContext.request.contextPath}/admin/savecategory" modelAttribute="pollcategory">
  
   
   
      <div class="form-group">
    <label class="control-label col-sm-2" for="uname">category:</label>
      <div class="col-sm-10">
      <div class="input-group">
      <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
      <form:input type="text" class="form-control" id="pollcategory" placeholder="Enter category you want to add" name="pollcategory" path="pollcategory"/>
    <form:errors path = "pollcategory"  />
    </div>
    </div>
    </div>
<button type="submit" class="btn btn-success btn-lg" style="margin-left:300px">Add</button>
</form:form>
</body>
</html>