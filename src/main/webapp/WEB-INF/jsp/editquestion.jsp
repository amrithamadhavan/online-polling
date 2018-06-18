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
    margin-left: -265px;
    margin-right: -268px;
}
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
.table1
{
border: 1px solid white;
width: 100%;
padding: 15 px;
text-align: right;
margin-bottom: 30px;

}
td{
height: 50px;
margin-left: 80px;
padding: 0px 20px;
}
.form-control
{
background-color: #fff;
width:100%;
}
hr {
    border: 1px solid #a6a6a6;
    margin-bottom: 25px;
}
body {font-family: Arial, Helvetica, sans-serif;}
* {box-sizing: border-box}
input[type=submit]{
color: white;
padding: 0px 10px;
width: 100px;
height: 30px;
float: center;
}

</style>


<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>Insert title here</title>
</head>

<body bgcolor="gray" class="container">
<!-- <button class="btn btn-danger"><a href="<c:url value='/display' />">Display</a></button>-->
	<h2><b>Edit Question </b><br> <br></h2>
       <h3>Pollcategory: ${pcname}</h3>
       <hr>
       <form:form action="${pageContext.request.contextPath}/ap/confeditque/${cid}" modelAttribute="que">
              <table class="table1">
              
                           <form:input type="hidden" name="queid" class="form-control" value="${que.id}" path="id"/>
                     <form:input type="hidden" name="category" required="required" value="${cid}"  path="pollcategory.id"/>
              
                     <tr class="form-group">
                           <td>question:</td>
                           <td><form:input type="text" name="queproductName" class="form-control"  value="${que.que}" path="que"/></td>
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
                     <tr>
                     <td></td>
                           <td><input type="submit" value="update" style="margin: 0px 400px" class="btn btn-primary"></td>
                           
                     </tr> 
                     
              </table>
       </form:form>
       
       
</body>
</html>
                     
