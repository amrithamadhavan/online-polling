<%@include file="header.jsp" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
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






<ul style="margin-left:600px;margin-top:100px">
<c:forEach items="${categories}" var="category">
<h2><li><a class="col-sm-3" href="${pageContext.request.contextPath}/admin/listquestions/${category.id}">${category.pollcategory}</a><a class="btn btn-info btn-sm" style="margin-left:20px" href="${pageContext.request.contextPath}/admin/editcategory/${category.id}">Edit</a><a class="btn btn-danger btn-sm" style="margin-left:20px" href="${pageContext.request.contextPath}/admin/deletecategory/${category.id}">delete</a></h2>
</c:forEach>
</ul>
<div style="margin-left:650px;margin-top:50px">
<a class="btn btn-info btn-lg" href="${pageContext.request.contextPath}/admin/addcategory">Add</a>
</div>
<center>
</body>
</html>
