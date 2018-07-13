<%@include file="header.jsp" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style>
.display {
    margin-left: 100px;
    margin-bottom: 30px;
    margin-top: -61px;
}
.navbar-inverse {
    background-color: #222;
    border-color: #080808;
    margin-left: -265px;
    margin-right: -268px;
}
<style>
.display {
    margin-left: 100px;
    margin-bottom: 30px;
    margin-top: -61px;
}
.navbar-inverse {
    background-color: #222;
    border-color: #080808;
    margin-left: -68px;
    margin-right: -68px;
}
.table1
{

width: 100%;
padding: 15 px;
text-align: right;
margin-bottom: 30px;

}
td,th{
height: 50px;
margin-left: 80px;
padding: 0px 20px;
}
.form-control
{
background-color: #fff;
width:100%;
}
hr {
    border: 1px solid #a6a6a6;
    margin-bottom: 25px;
}
body {font-family: Arial, Helvetica, sans-serif;}
* {box-sizing: border-box}
input[type=submit]{
color: white;
padding: 0px 10px;
width: 100px;
height: 30px;
float: center;
}

</style>


<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>Insert title here</title>
</head>

<body bgcolor="gray" class="container">
<!-- <button class="btn btn-danger"><a href="<c:url value='/display' />">Display</a></button>-->
	<h2><b>Edit Question </b><br> <br></h2>
       <h3>Pollcategory: ${pcname}</h3>
       <hr>
       <form action="${pageContext.request.contextPath}/ap/savequestion/${cid}" >
              <table class="table1">
                     <tr>
                           <th>Question</th></tr>
                           <tr>
                           <td><input class="form-control" type="text" name="question" value="${question}" required="required" ></td>
                     </tr>

         </table>
         <table>
         <th>Options</th>
                      <tbody id="btn">
                     <c:forEach items="${m}" var="listElemen" varStatus="i">
                     <c:set var="count" value="${i.index+1}"/>
             <tr id="${i.index+1}"><td><input class="form-control" type='text'   name="option${i.index+1}" value="${listElemen.key}" />  </td></tr><br> 
              </c:forEach>
              </tbody>
               </table>
               <table>
                <tr>
                   <td> <button type="button"  onclick="generateRow()" data-toggle="tooltip" title="You can add an option!" class="btn btn-default btn-sm">
          <span class="glyphicon glyphicon-plus"></span> Add
        </button> <button type="button" onclick="removerow()" data-toggle="tooltip" title="you can remove an option!" class="btn btn-default btn-sm">
          <span class="glyphicon glyphicon-remove"></span> Remove 
        </button></td>
        </tr>
        </table>
        <table>
                     <tr>
                     <td> </td>
                           <td><input type="submit" value="Edit"  style="margin: 0px 400px" class="btn btn-primary"></td>
                     </tr>
                     
              </table>
       </form>
      
      <script>
var i='${count}';

function generateRow() 
{
  i++;
 // alert(i);
//document.write("hello");
var d=document.getElementById("btn");
d.innerHTML+="<tr id='"+i+"'><td><input type='text' class='form-control' name='option" + i + "' /></td></tr><br>";
}
function removerow(){
	//'${count}'='${count}'-1;
//alert(i);
var element = document.getElementById("btn");
var child=document.getElementById(i);
element.removeChild(child);
	i--;
}
</script>

       
       
</body>
</html>
                     
