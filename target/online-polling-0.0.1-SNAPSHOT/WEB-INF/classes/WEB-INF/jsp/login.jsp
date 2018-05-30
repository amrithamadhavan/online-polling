<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@include file="header.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <style>
  #class1 {
    
    width: 400px;
    font-size: 30px;
    text-align: center;
    margin-left: 400px;
    margin-top: 0px;
    padding: 50px;
    color: chocolate;
    }
    .input-group .form-control:last-child, .input-group-addon:last-child, .input-group-btn:first-child>.btn-group:not(:first-child)>.btn, .input-group-btn:first-child>.btn:not(:first-child), .input-group-btn:last-child>.btn, .input-group-btn:last-child>.btn-group>.btn, .input-group-btn:last-child>.dropdown-toggle {
    border-top-left-radius: 0;
    border-bottom-left-radius: 0;
    width: 500px;
    height:50;
}
.input-group {
    position: relative;
    display: table;
    border-collapse: separate;
    margin-left: 400px;
    margin-top:250px;
    height:50;
}
.input-group1 {
    position: relative;
    display: table;
    border-collapse: separate;
    margin-left: 400px;
    margin-top:20px;
    width:535px;
    height:50;
}
.form-control{
height:50;
}
/*.bg {
   
  
   background-image:url("${pageContext.request.contextPath}/resources/images/loginpgb.jpg");
  
}*/
    </style>
</head>
<body class="bg">

<div class="container">
  
  <h2><center><B>LOGIN</B></center></h2>
  <form class="form-horizontal" action="login" method="post" >
    <div class="input-group">
      <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
      <input  name="username" class="form-control"  placeholder="enter username">
    </div>
    <div class="input-group1">
      <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
      <input type="password" name="password" class="form-control" placeholder="Password">
    </div>
    <br>
   <div id="class1">
 <input type="submit" value="login" class="btn btn-lg btn-success">
 </div>
</form>
<br>
</div>
</body>
</html>
