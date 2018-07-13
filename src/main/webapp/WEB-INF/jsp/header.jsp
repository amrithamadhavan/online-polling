<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
<%@ page isELIgnored="false" %>
 <%        
    response.setHeader("Pragma", "No-cache");
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
    response.setHeader("Expires", "0");
%>
<html lang="en">
<head>
  <title>Online Polling</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  
   <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  
    <style>
  body { background-color: #f2f2f2;}
  body {font-family: Arial, Helvetica, sans-serif;}
  </style>
 <script type = "text/javascript" >

   function preventBack(){window.history.forward();}

    setTimeout("preventBack()", 0);

    window.onunload=function(){null};

</script>
</head>
<body>
<security:authentication var="user" property="principal" />
<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    
    <ul class="nav navbar-nav">
      <li><a href="${pageContext.request.contextPath}/">HOME</a></li>
    
   
      
      </ul>
      <security:authorize access="isAnonymous()">
      
       <ul class="nav navbar-nav navbar-right">
      
      <li><a href="${pageContext.request.contextPath}/register"><span class="glyphicon glyphicon-user"></span> Sign Up</a></li>
      <li><a href="${pageContext.request.contextPath}/login"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
    </ul>
    </security:authorize>
    <!--<security:authorize access="isAuthenticated()"> 
     <ul class="nav navbar-nav">
     <li><a href="${pageContext.request.contextPath}/user/polls">Polls</a></li>
     
      <li><a href="${pageContext.request.contextPath}/admin/dispajax">Admin</a>
      <li><a href="${pageContext.request.contextPath}/pollmaster/polls">PollMaster</a>
      </ul>
    <ul class="nav navbar-nav navbar-right">
   
     <li><a href="${pageContext.request.contextPath}/result" class="btn btn-md">
          <span class="glyphicon glyphicon-stats"></span> Result
        </a></li>
    <li><a href="${pageContext.request.contextPath}/logout"><span class="glyphicon glyphicon-log-in"></span> Logout</a></li>
    </ul>
    </security:authorize>-->
    
    <security:authorize access="hasRole('ROLE_USER')">
     <ul class="nav navbar-nav">
     <li><a href="${pageContext.request.contextPath}/user/polls" data-toggle="tooltip" title="you can attend your polls here.!">Polls</a></li>
     <li><a href="${pageContext.request.contextPath}/user/result" data-toggle="tooltip" title="Check your results!" class="btn btn-md">
          <span class="glyphicon glyphicon-stats"></span> Result
        </a></li>
     </ul>
     </security:authorize>
     <security:authorize access="hasRole('ROLE_POLLMASTER')">
     <ul class="nav navbar-nav">
     <li><a href="${pageContext.request.contextPath}/user/polls" data-toggle="tooltip" title="you can attend your polls here.!">Polls</a></li>
     <li><a href="${pageContext.request.contextPath}/pollmaster/polls" data-toggle="tooltip" title="You can edit the assigned polls!">PollMaster</a>
     <li><a href="${pageContext.request.contextPath}/pollmaster/result" data-toggle="tooltip" title="Check the results!" class="btn btn-md">
          <span class="glyphicon glyphicon-stats"></span> Result
        </a></li>
     </ul>
     </security:authorize>
     
    <security:authorize access="hasRole('ROLE_ADMIN')">
     <ul class="nav navbar-nav">
     <li><a href="${pageContext.request.contextPath}/admin/dispajax" data-toggle="tooltip" title="You can view and edit all the polls!">Polls</a></li>
      <li><a href="${pageContext.request.contextPath}/admin/result" data-toggle="tooltip" title="Check all the results!" class="btn btn-md">
          <span class="glyphicon glyphicon-stats"></span> Result
        </a></li>
     </ul>
     </security:authorize> 
     
     <security:authorize access="isAuthenticated()">
      <ul class="nav navbar-nav navbar-right">
   
    <li><a href="#"> <span class="glyphicon glyphicon-user"></span>Hello ${user.username}</a></li>
    <li><a href="${pageContext.request.contextPath}/logout"><span class="glyphicon glyphicon-log-in"></span> Logout</a></li>
    </ul>
     </security:authorize>
    
  </div>
</nav>
<script type="text/javascript">
    $(document).ready(function () {
        var url = window.location;
        $('ul.nav a[href="'+ url +'"]').parent().addClass('active');
        $('ul.nav a').filter(function() {
             return this.href == url;
        }).parent().addClass('active');
        
        $('[data-toggle="tooltip"]').tooltip();
    });
</script> 
</html>