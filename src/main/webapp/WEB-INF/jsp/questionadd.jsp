<%@include file="header.jsp" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<style>
body {font-family: Arial, Helvetica, sans-serif;}
* {box-sizing: border-box}
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
input[type=submit]{
color: white;
padding: 0px 10px;
width: 100px;
height: 30px;
float: center;
}
</style>
</head>
<DIV class="container">
<h1><b>Add Question </b><br> <br></h1>
<h2> Category: ${pcname} </h2>
<hr>
<form:form action="${pageContext.request.contextPath}/ap/savequestion/${cid}" modelAttribute="question">
              <table class="table1">
                     <tr>
                           <td>Question:</td>
                           <td><form:input class="form-control" type="text" name="que" required="required" path="que"/></td>
                     </tr>
                     <tr>
                           <td>option 1:</td>
                           <td><form:input class="form-control" type="text" name="op1" required="required" path="op1"/></td>
                     </tr>
                     <tr>
                           <td>option 2:</td>
                           <td><form:input class="form-control" type="text" name="op2" required="required" path="op2"/></td>
                     </tr>
                     <tr>
                           <td>option 3:</td>
                           <td><form:input class="form-control" type="text" name="op3"  path="op3"/></td>
                     
              <form:input type="hidden" name="category" required="required" value="${cid}"  path="pollcategory.id"/>
                     
              <!--   <tr>
                           <td>Category:</td>
                           <td><form:select path="pollcategory.id">
                          <form:options items="${pollcategorylist}" itemLabel="pollcategory" itemValue="id"></form:options>
                          </form:select>
                               </td>
                     </tr>-->
                     <tr>
                     <td> </td>
                           <td><input type="submit" value="Add"  style="margin: 0px 400px" class="btn btn-primary"></td>
                     </tr>
                     
              </table>
       </form:form>
       </DIV>
