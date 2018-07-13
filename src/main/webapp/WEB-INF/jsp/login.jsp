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
  <style>
  body {font-family: Arial, Helvetica, sans-serif;}
body { background-color: #f2f2f2;}
  hr {
    border: 1px solid #a6a6a6;
    margin-bottom: 25px;
}
  button {
    background-color: #4CAF50;
    color: white;
    padding: 14px 20px;
    margin: 8px 0;
    border: none;
    cursor: pointer;
    width: 50%;
    opacity: 0.7;
}

button:hover {
    opacity:1;
}
.signupbtn {
  float: center;
  align: center;
  width: 95%;
   background-color: #4CAF50;
    color: white;
    padding: 14px 20px;
        border: none;
    cursor: pointer;
       opacity: 0.7;
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
    
    margin-top:100px;
    width:470px;
    height:50;
}
.input-group1 {
    position: relative;
    display: table;
    border-collapse: separate;
  
    margin-top:20px;
    width:540px;
    height:50;
}
.abc{
align: center;
width: 50%;


}

.form-control{
height:50;
width:100%;
}
.forgot{
text-decoration: underline;
font-size: 130%;
margin-top: 120px;
margin-left: -400px;
}

/*.bg {
   
  
   background-image:url("${pageContext.request.contextPath}/resources/images/loginpgb.jpg");
  
}*/



body, html {
    height: 100%;
    font-family: Arial, Helvetica, sans-serif;
}

* {
    box-sizing: border-box;
}


.avatar {
    vertical-align: middle;
    width: 50px;
    height: 50px;
    border-radius: 50%;
   margin-bottom:-50px;
   margin-top:70px;
}



    </style>
</head>
<body class="bg">


    <div class="container">
  <h2><B>Login</B></h2><br>
  <h3>Enter your details to login</h3>
  <hr>
  <center>
  <div class="abc">

  <form class="form-horizontal" action="login" method="post" >
<img src="${pageContext.request.contextPath}/resources/images/login-glyphicon.jpg" alt="Avatar" class="avatar">
   <fieldset>
    <div class="input-group">
    
      <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
      <input  name="username" class="form-control" required="required" placeholder="enter username">
    </div>
    </fieldset>
    <fieldset>
    <div class="input-group1">
      <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
      <input type="password" name="password" required="required" class="form-control" placeholder="Password">
    </div>
    </fieldset>
    <br>
   
   <div >
   <center>
<input type="submit" value="login" class="signupbtn"></center>
<br><br>
<!-- <a class="forgot" style="align: left;" href="${pageContext.request.contextPath}/forgotP
assword">Forgot password</a>-->

</div>

</form>
</div>
 </div>
<br>
</div>
</body>
</center>
<c:if test="${param.error == 'true'}">
  <script>
  alert("Invalid credentials");</script>
</c:if>

</html>










