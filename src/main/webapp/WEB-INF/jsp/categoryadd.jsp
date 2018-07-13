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
button[type=submit]{
color: white;
margin: 30px 400px;
padding: 0px 10px;
width: 100px;
height: 30px;
float: left;
}

.alert {
    padding: 20px;
    background-color: #ff3c1a; /* Red */
    color: white;
    margin-top:45px;
    margin-bottom: 15px;
    margin-left:50px;
    width:75%;
    align:center;
    height:60px;
}

/* The close button */
.closebtn {
    margin-left: 15px;
    color: white;
    font-weight: bold;
    float: right;
    font-size: 22px;
    line-height: 20px;
    cursor: pointer;
    transition: 0.3s;
}
.closebtn:hover {
    color: black;
}
</style>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
  <div class="container">
  <h1><b>Add categories</b></h1>
  <hr><br> <br> 
     <form:form action="${pageContext.request.contextPath}/admin/savecategory" modelAttribute="pollcategory" method="POST" enctype="multipart/form-data">
  
   <fieldset>
  
      <div class="form-group">
    <label class="col-sm-3" for="uname" style="font-size:130%">Category:</label><br> <br>
      <div class="col-sm-10">
      <div class="input-group">
      <span class="input-group-addon"><i class="glyphicon glyphicon-briefcase"></i></span>
      <form:input type="text" class="form-control" id="pollcategory" placeholder="Enter category you want to add" name="pollcategory" path="pollcategory"/>
    <form:errors path = "pollcategory"  />
    </div>
    </div>
    </div><br><br>
    <h1>Upload your image</h1>
    <p><label for="image">Choose Image</label></p> <br>
<p><input name="file" id="fileToUpload" type="file" /></p><br><br>
    <div>
    <c:if test="${tes==0}">
      <div class="alert">
<span class="closebtn" onclick="this.parentElement.style.display='none';">&times;</span> 
Category already exists
 </div>

</c:if>
</div>
<button type="submit" class="btn btn-success btn-lg">Add</button>
</form:form>
</fieldset>
</div>

</body>
</html>