<%@ include file="header.jsp"%>
<head>
<style>
body {font-family: Arial, Helvetica, sans-serif;}
* {box-sizing: border-box}
input[type=text], input[type=password] {
    width: 100%;
      display: inline-block;
    border: none;
    background: white;
}
input[type=text]:focus, input[type=password]:focus {
    background-color: white;
    outline: none;
}
hr {
    border: 1px solid #a6a6a6;
    margin-bottom: 25px;
}
body { background-color: #f2f2f2;}
button {
    background-color: #4CAF50;
    color: white;
    padding: 14px 20px;
    margin: 8px 0;
    border: none;
    cursor: pointer;
    width: 100%;
    opacity: 0.7;
}

button:hover {
    opacity:1;
}
.signupbtn {
  float: center;
  margin-left:170px;
  width: 50%;
}
.container {
    padding: 16px;
}

form
{
margin-top:50px;
margin-left:100px;
}
.form-control
{
width:500px;
background-color:white;
}
.form-group
{
margin-bottom:50px

}
.input-group{
width:60%;
align:center;
margin-left:170px;
border: 2px solid #d9d9d9;
border-radius:5%;
height: 90px:
}
</style>
</head>
<div class="container">
  <h2><b>Forgot Password</b></h2>
  <p>Please fill in this form to change your password.</p>
  <hr>
<form:form class="form-horizontal" action="${pageContext.request.contextPath}/changepassword" modelAttribute="user">
  
   
      <fieldset>
      <div class="form-group">
   
      <div class="col-sm-10">
      <div class="input-group">
      <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
      <form:input type="text" class="form-control" id="uname" placeholder="Enter username" name="uname" path="uname"/>
    <form:errors path = "uname"  />
    </div>
    </div>
    </div>
    </fieldset>
    <fieldset>
    <div class="form-group">
      
      <div class="col-sm-10">
      <div class="input-group">
      <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
      
      <form:input type="password" class="form-control" id="pwd" placeholder="Enter new password" name="pwd" path="pwd"/>
    <form:errors path = "pwd"  />
    </div>
    </div>
    </div>
    </fieldset>
     <button type="submit" class="signupbtn" >Change Password</button>
     </form:form>
</div>
    
</body>
</html>
