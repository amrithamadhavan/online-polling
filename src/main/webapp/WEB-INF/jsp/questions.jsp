<%@include file="header.jsp" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
    <style>
    input[type="radio"]{  margin: 0 10px 0 10px;
}
hr {
    border: 1px solid #a6a6a6;
    margin-bottom: 25px;
}
.container {
    padding: 16px;
}
body {font-family: Arial, Helvetica, sans-serif;}
* {box-sizing: border-box}
input[type=submit]{
color: white;
padding: 0px 10px;
width: 100px;
height: 30px;
float: center;
backgorund-color: #23a5f6;
}
    </style>

</head>
<body onload="myfunc()">

<div class="container">
<h1><b>Let your Votes get into Action!</b></h1>
<hr>

<ul>

<form:form action="${pageContext.request.contextPath}/user/submit/${id}"  method="POST">

      <c:if test="${not empty hm1}">
      
      <c:forEach items="${hm1}" var="listElemen" varStatus="q">
       <h3><br>
            <li>${listElemen.key}</li><input type="hidden"  name="qname${q.index}" value="${listElemen.key}"><br>
           
           
          <c:forEach items="${listElemen.value}" var="listElement">
          <c:if test="${listElement.value==0}">
              <input type="radio" name="radioname${q.index}" value="${listElement.key}">${listElement.key}
          </c:if>
           <c:if test="${listElement.value==1}">
              <input type="radio" name="radioname${q.index}" value="${listElement.key}" checked>${listElement.key}
          </c:if>
           </c:forEach>
           </h3>
           </c:forEach>
      
          </c:if>
      
      
      <c:if test="${empty hm1}">
      
      
             <c:forEach items="${hm}" var="listElemen" varStatus="q">
       <h3><br>
            <li>${listElemen.key}</li><input type="hidden"  name="qname${q.index}" value="${listElemen.key}"><br>
           
           
          <c:forEach items="${listElemen.value}" var="listElement">
              <input type="radio" name="radioname${q.index}" value="${listElement.key}">${listElement.key}
           </c:forEach>
           </h3>
           </c:forEach>
           </c:if>
           <center>
       <input type="submit" class="btn btn-md btn-info" value="Save" style="float: center;margin-left:50px;margin-top:50px" onclick="form.action='${pageContext.request.contextPath}/user/save/${id}';">
<input type="submit" class="btn btn-md btn-success" name="submit" style="float: center;margin-left:50px;margin-top:50px"  />
</center>
<!-- <a href="${pageContext.request.contextPath}/user/save/${id}" class="btn btn-md btn-info">Save</a>-->
</form:form>
</ul>


<!-- <script>
$('input[type=submit]').click(function() {
    $(this).attr('disabled', 'disabled');
    $(this).parents('form').submit()
})
</script>-->
</div>
<!-- <script>
function myfunc(){
	//document.getElementsByName('radioname0').val=localStorage.getItem('qname0');
	//alert("hi");
	
	var radios = document.getElementsByName("radioname0");
	alert(radios.length);
	var val = localStorage.getItem('qname0'); // local storage value
	for(var i=0;i<radios.length;i++){
	  if(radios[i].value == val){
	      radios[i].checked = true; // marking the required radio as checked
	  }
	}
	// list of radio buttons
}
$('#myform input').on('change', function() {
	
	   alert($('input[name=radioname0]:checked', '#myform').val()); 
	   localStorage.setItem('qname0',$('input[name=radioname0]:checked', '#myform').val());
	   alert(localStorage.getItem('qname0'));
	   
	  
	});
</script>-->

</body>
</html>