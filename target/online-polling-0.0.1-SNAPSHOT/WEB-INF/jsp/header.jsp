<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
<%@ page isELIgnored="false" %>
<html lang="en">
<head>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  
   <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
</body>
<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    
    <ul class="nav navbar-nav">
      <li class="active"><a href="${pageContext.request.contextPath}/">HOME</a></li>
    
   
      
      </ul>
      <security:authorize access="isAnonymous()">
      
       <ul class="nav navbar-nav navbar-right">
      
      <li><a href="${pageContext.request.contextPath}/register"><span class="glyphicon glyphicon-user"></span> Sign Up</a></li>
      <li><a href="${pageContext.request.contextPath}/login"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
    </ul>
    </security:authorize>
    <security:authorize access="isAuthenticated()"> 
     <ul class="nav navbar-nav">
     <li><a href="${pageContext.request.contextPath}/user/polls">Polls</a></li>
     
      <li><a href="${pageContext.request.contextPath}/admin/dispajax">Admin</a>
      </ul>
    <ul class="nav navbar-nav navbar-right">
    <li><a href="${pageContext.request.contextPath}/viewprofile" class="btn btn-md"> <span class="glyphicon glyphicon-user"></span>ViewProfile</a>
     <li><a href="${pageContext.request.contextPath}/user/result" class="btn btn-md">
          <span class="glyphicon glyphicon-stats"></span> Result
        </a></li>
    <li><a href="${pageContext.request.contextPath}/logout"><span class="glyphicon glyphicon-log-in"></span> Logout</a></li>
    </ul>
    </security:authorize>
    
  </div>
</nav>
</html>