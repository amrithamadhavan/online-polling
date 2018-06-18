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

</style>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>




  <div id="myCarousel" class="carousel slide" data-ride="carousel" style="margin-top: -20px;height: 100%;">
    <!-- Indicators -->
    <ol class="carousel-indicators">
      <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
      <li data-target="#myCarousel" data-slide-to="1"></li>
      <li data-target="#myCarousel" data-slide-to="2"></li>
    </ol>

    <!-- Wrapper for slides -->
    <div class="carousel-inner">

      <div class="item active">
        <img src="http://www.eurac.edu/en/aboutus/PublishingImages/Pages/default/iStock_89840841_LARGE_700x400.jpg" alt="Los Angeles" style="width:100%;height:100%;">
        <div class="carousel-caption">
          <h2>WELCOME</h2>
          <p>No.1 Polling site!</p>
        </div>
      </div>

      <div class="item">
        <img src="http://sonomacounty.ca.gov/uploadedImages/Sonoma/CRA_and_Registrar_of_Voters/_Images/_Carousel/voted-stickers500x250.png?n=5558" alt="Chicago" style="width:100%;height:100%;">
        <div class="carousel-caption">
          <h3>VOTES</h3>
          <p>Cast your Votes wiser!</p>
        </div>
      </div>
    
      <div class="item">
        <img src="https://1kabswnt2ua3ivl0cuqv2f17-wpengine.netdna-ssl.com/wp-content/uploads/2015/04/thank-you-note.jpg" alt="New York" style="width:100%;height:100%;">
        <div class="carousel-caption">
          <h3>THANK YOU</h3>
          <p>Visit us for more fun!</p>
        </div>
      </div>
  
    </div>

    <!-- Left and right controls -->
    <a class="left carousel-control" href="#myCarousel" data-slide="prev">
      <span class="glyphicon glyphicon-chevron-left"></span>
      <span class="sr-only">Previous</span>
    </a>
    <a class="right carousel-control" href="#myCarousel" data-slide="next">
      <span class="glyphicon glyphicon-chevron-right"></span>
      <span class="sr-only">Next</span>
    </a>
  </div>
</div>



</body>
</html>