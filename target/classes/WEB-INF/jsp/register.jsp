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
form
{
margin-top:50px;
margin-left:200px;
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
width:500px;
}
/*body
{
background-image:url("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT_y_S03E0T0S3OJwFq9Qh4mfYXlJH9fHyaXvzCDMCEPxf9jlHHkA");"
}*/
</style>
</head>
<body>

<div class="container">
  <h2><center>user registration </center></h2>
 <form:form class="form-horizontal" action="registration" modelAttribute="uDemo">
  
   
   
      <div class="form-group">
    <label class="control-label col-sm-2" for="uname">username:</label>
      <div class="col-sm-10">
      <div class="input-group">
      <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
      <form:input type="text" class="form-control" id="uname" placeholder="Enter username" name="uname" path="uname"/>
    <form:errors path = "uname"  />
    </div>
    </div>
    </div>
    <div class="form-group">
      <label class="control-label col-sm-2" for="pwd">Password:</label>
      <div class="col-sm-10">
      <div class="input-group">
      <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
      
      <form:input type="password" class="form-control" id="pwd" placeholder="Enter new password" name="pwd" path="pwd"/>
    <form:errors path = "pwd"  />
    </div>
    </div>
    </div>
     <div class="form-group">
      <label class="control-label col-sm-2" for="repwd">re-enter Password:</label>
      <div class="col-sm-10">
      <div class="input-group">
      <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
      <input type="password" class="form-control" id="repwd" placeholder="Re-Enter new password" name="repwd">
    
    </div>
    </div>
   </div>
    
    <button type="submit" class="btn btn-success btn-lg" style="margin-left:300px">Register</button>
  </form:form>
</div>

</body>
</html>