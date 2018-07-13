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
td{
height: 50px;
width: 120px;
  border: 2px solid #a6a6a6;
  text-align: center;
  border-radius: 5%;
}
th{
height: 50px;
width: 120px;
  border: 2px solid #a6a6a6;
  text-align: center;
  border-radius: 5%;
  color: white;
  background-color: #a6a6a6 ;
}

</style>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>



<script type="text/javascript" src="https://www.google.com/jsapi"></script>
<script type="text/javascript">


    // Load the Visualization API and the piechart package.
    google.load('visualization', '1.0', {
        'packages' : [ 'corechart' ]
    });

    // Set a callback to run when the Google Visualization API is loaded.
    google.setOnLoadCallback(drawChart);

    // Callback that creates and populates a data table,
    // instantiates the pie chart, passes in the data and
    // draws it.
    function drawChart() {

<c:forEach items="${hm}" var="m" varStatus="q">
        // Create the data table.    
       var data = new google.visualization.DataTable();
        data.addColumn('string', 'Option');
        data.addColumn('number', 'Count');
        data.addRows([
                   
                    <c:forEach items="${m.value}" var="o">
                                                                  [ '${o.key}', ${o.value} ],
                                                              </c:forEach>
                    ]);
        // Set chart options
        var options = {
            'title' : "",
            is3D : true,
            pieSliceText: 'label',
            tooltip :  {showColorCode: true},
            'width' : 800,
            'height' : 400,
            backgroundColor: '#f2f2f2'
        };
        var chart = new google.visualization.PieChart(document.getElementById('chart_div${q.index}'));
        chart.draw(data, options);
        </c:forEach>
    }
</script>




</head>
<body>



<div class="container">
<h2>Question level Results</h2>
<p>See your poll results here!</p>
<hr>



<!--<c:set var="total" value="${output.op1cnt+output.op2cnt+output.op3cnt}" />

-->

        <c:forEach items="${hm}" var="q" varStatus="a">
<div>
<h3><b>${q.key}</b></h3><br><br>




<table >
<tr>
<th>Option</th>
<th>Count</th>
</tr>
<c:forEach items="${q.value}" var="o" >

<tr>
<td>${o.key} </td>   
 <td>    ${o.value} </td>
 </tr>
 </c:forEach>
</table>





  <div style="margin-left:1000px;">
  <button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal${a.index}">Show Chart</button>
  
  <div class="modal fade" id="myModal${a.index}" role="dialog">
    <div class="modal-dialog modal-lg">
 
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
         <b> <h4 class="modal-title">${q.key}</h4></b>
          
        </div>
        <div class="modal-body">
  
  
  


 <div id="chart_div${a.index}" ></div>




</div>
<div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
      </div>
    </div>
    </div>




</div>
</c:forEach>
       









<!--<c:forEach items="${hm}" var="q" varStatus="a">
<div>
<h3><b>${q.key}</b></h3>
<div id="chart_div${a.index}" ></div>

<table style="margin-left: 800px;margin-top:-300px;margin-bottom: 250px">
<tr>
<th>Option</th>
<th>Count</th>
</tr>
<c:forEach items="${q.value}" var="o" >

<tr>
<td>${o.key} </td>   
 <td>    ${o.value} </td>
 </tr>
 </c:forEach>
</table>



</div>
</c:forEach>-->
<br>
<br>
</div>
</body>
