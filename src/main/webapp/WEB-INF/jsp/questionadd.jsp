<%@include file="header.jsp" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<style>
body {font-family: Arial, Helvetica, sans-serif;}
* {box-sizing: border-box}
.table1
{

width: 100%;
padding: 15 px;
text-align: right;
margin-bottom: 30px;

}
td,th{
height: 50px;

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
input[type=submit]{
color: white;
padding: 0px 10px;
width: 100px;
height: 30px;
float: center;
}
.alert {
    padding: 20px;
    background-color: #ff3c1a; /* Red */
    color: white;
    margin-top:45px;
    margin-bottom: 15px;
    margin-left:50px;
    width:75%;
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
</style>
</head>
<DIV class="container">
<h1><b>Add Question </b><br> <br></h1>
<h2> Category: ${pcname} </h2>
<hr>
<form action="${pageContext.request.contextPath}/ap/savequestion/${cid}" >
               <table class="table1">
                     <tr>
                           <th><h3>Question</h3></th></tr>
                           <tr>
                           <td><input class="form-control" type="text" name="question"  ></td>
                     </tr>

         </table>
         <div>
    <c:if test="${tes==0}">
      <div class="alert">
<span class="closebtn" onclick="this.parentElement.style.display='none';">&times;</span> 
Question must not be empty.!
 </div>

</c:if>
</div>
         <table>
                  <th><H3>Options</H3></th>
                      <tbody id="btn">
                   
              </tbody>
               </table>
               <table>
                <tr>
                   <td> <button type="button"  onclick="generateRow()" class="btn btn-default btn-sm">
          <span class="glyphicon glyphicon-plus"></span> Plus
        </button> <button type="button" onclick="removerow()" class="btn btn-default btn-sm">
          <span class="glyphicon glyphicon-remove"></span> Remove 
        </button></td>
        </tr>
        </table>
        <table>
                     <tr>
                     <td> </td>
                           <td><input type="submit" value="Add"  style="margin: 0px 400px" class="btn btn-primary"></td>
                     </tr>
                     
              </table>
       </form>
      
      <script>
var i=0;

function generateRow() 
{
  i++;
  //alert(i);
//document.write("hello");
var d=document.getElementById("btn");
d.innerHTML+="<tr id='"+i+"'><td><input type='text' class='form-control' required='required' name='option" + i + "' /></td></tr><br>";
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
