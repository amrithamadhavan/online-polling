<%@include file="header.jsp" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<ul style="margin-left:100px;margin-top:100px">
<style>
body {font-family: Arial, Helvetica, sans-serif;}

.container {
    padding: 16px;
}
hr {
    border: 1px solid #a6a6a6;
    margin-bottom: 25px;
}
a:link{
color: grey;

text-decoration: none;
opacity: 1;
}
a:visited{
color: grey;

text-decoration: none;
opacity: 1;
}
a:hover {
    color: grey;

    text-decoration: none;
    opacity: 0.5;
}
a:active {
    color: grey;
  
    text-decoration: none;
    opacity: 0.7;
}
td{
width:0.1%;
height: 150px;

}
.avatar {
    vertical-align: middle;
    width: 80px;
    height: 80px;
    border-radius: 50%;
}
img{
margin-right:-200px;
}
</style>


</head>
<body>



<!-- <script type="text/javascript">
        function doAjaxPost() {
        // get the form values
        var name = $('#name').val();
       
 
        $.ajax({
        type: "POST",
        url: "http://localhost:9000/online-polling/admin/addcategory",
        data: "pollcategory=" + name,
        success: function(response){
        // we have the response
        //$('#info').html(response);
        $('#name').val('');
        
        },
        error: function(e){
        alert('Error: ' + e);
        alert("error");
        }
        });
        }
        </script>
    </head>-->

    <body>

       <!--  <h1>Add categories using Ajax ........</h1>
     <form:form class="form-horizontal" action="/admin/addcategory" modelAttribute="pollcategory">
  
   
   
      <div class="form-group">
    <label class="control-label col-sm-2" for="uname">category:</label>
      <div class="col-sm-10">
      <div class="input-group">
      <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
      <form:input type="text" class="form-control" id="pollcategory" placeholder="Enter category you want to add" name="pollcategory" path="pollcategory"/>
    <form:errors path = "pollcategory"  />
    </div>
    </div>
    </div>
<div style="margin-left:650px;margin-top:50px">
<a class="btn btn-info btn-lg" href="${pageContext.request.contextPath}/admin/addcategory">Add</a>
</div>
</form:form>-->

<div class="container">
<div>
<h2><b>The list of polls</b></h2>
<!--  <input style="margin-left:250px;margin-top:-40px;width:400px;float:right;" class="form-control" id="myInput" type="text" placeholder="Search..">--></div>
<hr>
<center>
<table>
 <tbody id="myTable">

<c:forEach  items="${categories}" var="category" varStatus="vs">
<tr>
<td><a href="${pageContext.request.contextPath}/admin/listquestions/${category.id}" data-toggle="tooltip" title="click here to view the questions!"><img src="${pageContext.request.contextPath}/resources/images/${category.getId()}.jpg" class="avatar"></a></td>
<td> <h2><a  href="${pageContext.request.contextPath}/admin/listquestions/${category.id}" data-toggle="tooltip" title="click here to view the questions!">${category.pollcategory}</a> </h2></td>
 
 
 


 

<td><button type="button" style="margin-left:400px" id="test${vs.index}" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal${vs.index}"><span class="glyphicon glyphicon-pencil"></span></button></td></tr>


  <div class="modal fade" id="myModal${vs.index}" role="dialog">
    <div class="modal-dialog">
 
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Edit Your Poll.!</h4>
        </div>
        <div class="modal-body">
          <a class="btn btn-info " style="margin-left:20px;color:white;" href="${pageContext.request.contextPath}/admin/editcategory/${category.id}" data-toggle="tooltip" title="You can change the category name!">Edit</a>
<a class="btn btn-danger " style="margin-left:20px;color:white;" href="${pageContext.request.contextPath}/admin/deletecategory/${category.id}">delete</a>
<a class="btn btn-primary btn-sm" style="margin-left:20px;color:white;" href="${pageContext.request.contextPath}/admin/pollmasters/${category.id}" data-toggle="tooltip" title="You can add or remove pollmasters!">PollMasters</a>
<c:if test="${category.isactive}">
<a class="btn btn-primary btn-sm" style="margin-left:20px;color:white;" href="${pageContext.request.contextPath}/admin/activatepoll/${category.id}">Deactivate</a> <br>
</c:if>
<c:if test="${category.isactive==false}">
<a class="btn btn-primary btn-sm" style="margin-left:20px;color:white;" href="${pageContext.request.contextPath}/admin/activatepoll/${category.id}">Activate</a> <br>
</c:if>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
      </div>
    </div>
 
  

 
 
 
 <!-- <a class="btn btn-info " style="margin-left:20px;color:white;" href="${pageContext.request.contextPath}/admin/editcategory/${category.id}">Edit</a>
<a class="btn btn-danger " style="margin-left:20px;color:white;" href="${pageContext.request.contextPath}/admin/deletecategory/${category.id}">delete</a>
<a class="btn btn-primary btn-sm" style="margin-left:20px;color:white;" href="${pageContext.request.contextPath}/admin/pollmasters/${category.id}">PollMasters</a>
<c:if test="${category.isactive}">
<a class="btn btn-primary btn-sm" style="margin-left:20px;color:white;" href="${pageContext.request.contextPath}/admin/activatepoll/${category.id}">Deactivate</a> <br>
</c:if>
<c:if test="${category.isactive==false}">
<a class="btn btn-primary btn-sm" style="margin-left:20px;color:white;" href="${pageContext.request.contextPath}/admin/activatepoll/${category.id}">Activate</a></h2> <br>
</c:if>-->
</c:forEach>

</tbody>
</table>
</center>
<center>
<div style="margin-top:50px">
<a class="btn btn-info btn-lg " style="color:white;" href="${pageContext.request.contextPath}/admin/addcategory" data-toggle="tooltip" title="You can add a new category!">Add</a>
<a class="btn btn-info btn-lg" style="margin:20px;color:white;" href="${pageContext.request.contextPath}/admin/editusers" data-toggle="tooltip" title="You can change the role of users!">EditUsers</a>
</center>


</div>
</div>
<script>
$(document).ready(function(){
  $("#myInput").on("keyup", function() {
    var value = $(this).val().toLowerCase();
   

    $("#myTable tr").filter(function() {
      $(this).toggle($(this).text().toLowerCase().indexOf(value) >-1)
    });
  });
 
   
});
</script>
</body>
</html>
