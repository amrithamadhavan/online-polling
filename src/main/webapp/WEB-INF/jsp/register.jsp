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

.alert {
    padding: 20px;
    background-color: #ff3c1a; /* Red */
    color: white;
    margin-top:-35px;
    margin-bottom: 15px;
    margin-left:170px;
    width:50%;
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

/*body
{
background-image:url("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT_y_S03E0T0S3OJwFq9Qh4mfYXlJH9fHyaXvzCDMCEPxf9jlHHkA");"
}*/
</style>
</head>
<body>

<div class="container">
 <h2><b>Sign-up for Users</b></h2>
  <p>Please fill in this form to create an account.</p>
  <hr>

 
 <form:form class="form-horizontal" action="registration" modelAttribute="uDemo">
  
   
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
     <c:if test="${tes==0}">
      <div class="alert">
<span class="closebtn" onclick="this.parentElement.style.display='none';">&times;</span> 
Username already taken!
 </div>
</c:if>
    
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
   <!--  <fieldset>
     <div class="form-group">
      
      <div class="col-sm-10">
      <div class="input-group">
      <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
      <input type="password" class="form-control" id="repwd" placeholder="Re-enter new password" name="repwd">
    
    </div>
    </div>
   </div>
   </fieldset>-->
<!--    <fieldset>
   <legend>enter your email</legend>
   <form><input type="text" >
   </form>
   </fieldset>--> 
    
    <button type="submit" class="signupbtn" >Sign-Up</button>
  </form:form>
</div>


</body>
</html>