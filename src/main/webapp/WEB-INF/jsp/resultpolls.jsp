


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

.alert {
    padding: 20px;
    background-color: #ff3c1a; /* Red */
    color: white;
    margin-bottom: 15px;
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
td,th{
width: 98%;
height: 100px;
}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

</head>
<body>
<div class="container">
<div>
<h2>Check Poll Results</h2><!-- <input style="margin-left:350px;margin-top:-40px;width:400px;float:right;" class="form-control" id="myInput" type="text" placeholder="Search..">--></div>
<hr><br><br>

<table>
<tbody id="myTable">
<tr>
<th><h2>Poll</h2></th>
<th><h2>PollCount</h2></th>
</tr>
<c:set var="total" value="0" scope="page" />
<c:forEach items="${categories}" var="category">
<c:forEach items="${pollcount}"  var="count">

<c:if test="${category.id==count.pcid}" >
<c:set var="total" value="${total + 1}" scope="page"/><tr>
<td><h2><a class="col-sm-6" href="${pageContext.request.contextPath}/viewcount/${category.id}">${category.pollcategory}</a></h2></td>
<td><h2>${count.count}</h2></td>
</tr>
</h2></c:if>

</c:forEach>
</c:forEach>
</tbody>
</table>
<c:if test="${total==0}">
<!-- <div class="alert">
<span class="closebtn" onclick="this.parentElement.style.display='none';">&times;</span> 
no polls are attended yet..!
 </div>-->
 <script>
 alert("no polls are attended yet..");</script>
</c:if>
</ul>
</div>
</div>
<script>
$(document).ready(function(){
  $("#myInput").on("keyup", function() {
    var value = $(this).val().toLowerCase();
    $("#myTable tr").filter(function() {
      $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
    });
  });
});
</script>
</body>
</html>