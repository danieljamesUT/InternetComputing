<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.google.appengine.api.users.User" %>
<%@ page import="com.google.appengine.api.users.UserService" %>
<%@ page import="com.google.appengine.api.users.UserServiceFactory" %>
<%@ page import="com.google.appengine.api.datastore.DatastoreServiceFactory" %>
<%@ page import="com.google.appengine.api.datastore.DatastoreService" %>
<%@ page import="com.google.appengine.api.datastore.Query" %>
<%@ page import="com.google.appengine.api.datastore.Entity" %>
<%@ page import="com.google.appengine.api.datastore.FetchOptions" %>
<%@ page import="com.google.appengine.api.datastore.Key" %>
<%@ page import="com.google.appengine.api.datastore.KeyFactory" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html  lang="en">
<head>

<link rel="shortcut icon" type="image/png" href="img/ti_logo.png"/>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	
	<meta name="apple-mobile-web-app-capable" content="yes">
	<meta name="apple-mobile-web-app-status-bar-style" content="black-translucent">
	
	<link rel="apple-touch-icon"
		  href="img/apple_ti_logo.png" />
	<link rel="apple-touch-icon-precomposed"
		  href="img/android_ti_logo.png" />
		  
	<!-- Android icons -->
	<link href="img/android_ti_logo.png" rel="icon" sizes="192x192" />
	
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <title>Sign Up For Tutoring</title>  

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap-theme.min.css">
<link rel="stylesheet" href="css/mycss2.css">	

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
    $('a[data-toggle="tab"]').on('show.bs.tab', function(e) {
        localStorage.setItem('activeTab', $(e.target).attr('href'));
    });
    var activeTab = localStorage.getItem('activeTab');
    if(activeTab){
        $('#myTab a[href="' + activeTab + '"]').tab('show');
    }
});
</script>
<script type="text/javascript">
    function OpenLink(theLink){
        window.location.href = theLink.href;
    }
</script>

    <style type="text/css">
	.bs-example{
		margin: 20px;
	}
    </style>
    </head>
    
<body>

<div style="padding-top:5px"></div><img src="img/ti_logo_with_text.png" alt="TI Logo" style="width:200px;"></div>
<div style="margin:10px; margin-top:-5px"><h3>Conference Room Occupancy </h3></div>
<%response.setIntHeader("Refresh", 10);%>
<div id="container" style="margin-left:-20px; margin-top:-15px;" class="col-sm-12 col-md-8 col-lg-6 col-xs-12">
    <div class="bs-example">
    <ul class="nav nav-tabs" id="myTab">
        <li class="active"><a data-toggle="tab" href="#wingA">Wing A</a></li>
        <li><a data-toggle="tab" href="#wingB">Wing B</a></li>
        <li><a data-toggle="tab" href="#wingC">Wing C</a></li>
        <li><a data-toggle="tab" href="#wingD">Wing D</a></li>
        <li><a data-toggle="tab" href="#wingE">Wing E</a></li>
        <li><a data-toggle="tab" href="#wingF">Wing F</a></li>
        <li><a data-toggle="tab" href="#wingG">Wing G</a></li>
    </ul>
    <div class="tab-content">
        <div id="wingA" class="tab-pane fade in active">
        <div id="occupancytable">
        <table class="table table-bordered table-striped table-hover " style="width:100%">
		<thead>
		  <tr>
			<th>Room</th>
			<th>Availability</th>
			<th>Timestamp</th>
		  </tr>
		</thead>
        <%
        response.setIntHeader("Refresh", 10);
        String confListA[]={"A01","A02","A03","A04","A05"};
        DatastoreService datastore = DatastoreServiceFactory.getDatastoreService();
        for(int i=0;i<5;i++)
        {
        Key postKey = KeyFactory.createKey(confListA[i], confListA[i]);
        
        Query query = new Query("SensorData", postKey).addSort("date", Query.SortDirection.DESCENDING);
        List<Entity> updates = datastore.prepare(query).asList(FetchOptions.Builder.withLimit(100));
        Entity Update=updates.get(0);
        	
        pageContext.setAttribute("confResult",Update.getProperty("content"));
        pageContext.setAttribute("confID",Update.getProperty("sensorID"));
        pageContext.setAttribute("dateReadable", Update.getProperty("dateReadable"));
        if (Update.getProperty("content").equals("Available"))
        	{%>
	        <tbody>
	            <td>${fn:escapeXml(confID)}</td>
				<td style="font-weight:bold">${fn:escapeXml(confResult)}</td>
				<td>${fn:escapeXml(dateReadable)}</td>
	        </tbody>
        <%}
        else
        {%>
	        <tbody>
	            <td>${fn:escapeXml(confID)}</td>
				<td>${fn:escapeXml(confResult)}</td>
				<td>${fn:escapeXml(dateReadable)}</td>
	        </tbody>
        <%}
        }%>
        </table>
        </div>	
        </div>
  
  <div id="wingB" class="tab-pane fade">
    <div id="occupancytable">
        <table class="table table-hover table-bordered table-striped" style="width:100%">
		<thead>
		  <tr>
			<th>Room</th>
			<th>Availability</th>
			<th>Timestamp</th>
		  </tr>
		</thead>
        <%
        response.setIntHeader("Refresh", 10);
        String confListB[]={"B01","B02","B03","B04","B05"};
        
        for(int i=0;i<5;i++)
        {
        Key postKey = KeyFactory.createKey(confListB[i], confListB[i]);
        
        Query query = new Query("SensorData", postKey).addSort("date", Query.SortDirection.DESCENDING);
        List<Entity> updates = datastore.prepare(query).asList(FetchOptions.Builder.withLimit(100));
        Entity Update=updates.get(0);
        pageContext.setAttribute("confResult",Update.getProperty("content"));
        pageContext.setAttribute("confID",Update.getProperty("sensorID"));
        pageContext.setAttribute("dateReadable", Update.getProperty("dateReadable"));
        if (Update.getProperty("content").equals("Available"))
        	{%>
	        <tbody>
	            <td>${fn:escapeXml(confID)}</td>
				<td style="font-weight:bold">${fn:escapeXml(confResult)}</td>
				<td>${fn:escapeXml(dateReadable)}</td>
	        </tbody>
        <%}
        else
        {%>
	        <tbody>
	            <td>${fn:escapeXml(confID)}</td>
				<td>${fn:escapeXml(confResult)}</td>
				<td>${fn:escapeXml(dateReadable)}</td>
	        </tbody>
        <%}
        }%>
        </table>
    </div>
  </div>
  <div id="wingC" class="tab-pane fade">
    <div id="occupancytable">
        <table class="table table-hover table-bordered table-striped" style="width:100%">
		<thead>
		  <tr>
			<th>Room</th>
			<th>Availability</th>
			<th>Timestamp</th>
		  </tr>
		</thead>
                <%
        response.setIntHeader("Refresh", 10);
        String confListC[]={"C01","C02","C03","C04","C05"};
        
        for(int i=0;i<5;i++)
        {
        Key postKey = KeyFactory.createKey(confListC[i], confListC[i]);
        
        Query query = new Query("SensorData", postKey).addSort("date", Query.SortDirection.DESCENDING);
        List<Entity> updates = datastore.prepare(query).asList(FetchOptions.Builder.withLimit(100));
        Entity Update=updates.get(0);
        pageContext.setAttribute("confResult",Update.getProperty("content"));
        pageContext.setAttribute("confID",Update.getProperty("sensorID"));
        pageContext.setAttribute("dateReadable", Update.getProperty("dateReadable"));
        if (Update.getProperty("content").equals("Available"))
        	{%>
	        <tbody>
	            <td>${fn:escapeXml(confID)}</td>
				<td style="font-weight:bold">${fn:escapeXml(confResult)}</td>
				<td>${fn:escapeXml(dateReadable)}</td>
	        </tbody>
        <%}
        else
        {%>
	        <tbody>
	            <td>${fn:escapeXml(confID)}</td>
				<td>${fn:escapeXml(confResult)}</td>
				<td>${fn:escapeXml(dateReadable)}</td>
	        </tbody>
        <%}
        }%>
        </table>
    </div>
  </div>
  <div id="wingD" class="tab-pane fade">
    <div id="occupancytable">
        <table class="table table-hover table-bordered table-striped" style="width:100%">
		<thead>
		  <tr>
			<th>Room</th>
			<th>Availability</th>
			<th>Timestamp</th>
		  </tr>
		</thead>
                <%
        response.setIntHeader("Refresh", 10);
        String confListD[]={"D01","D02","D03","D04","D05"};
        
        for(int i=0;i<5;i++)
        {
        Key postKey = KeyFactory.createKey(confListD[i], confListD[i]);
        
        Query query = new Query("SensorData", postKey).addSort("date", Query.SortDirection.DESCENDING);
        List<Entity> updates = datastore.prepare(query).asList(FetchOptions.Builder.withLimit(100));
        Entity Update=updates.get(0);
        pageContext.setAttribute("confResult",Update.getProperty("content"));
        pageContext.setAttribute("confID",Update.getProperty("sensorID"));
        pageContext.setAttribute("dateReadable", Update.getProperty("dateReadable"));
        if (Update.getProperty("content").equals("Available"))
    	{%>
        <tbody>
            <td>${fn:escapeXml(confID)}</td>
			<td style="font-weight:bold">${fn:escapeXml(confResult)}</td>
			<td>${fn:escapeXml(dateReadable)}</td>
        </tbody>
    <%}
    else
    {%>
        <tbody>
            <td>${fn:escapeXml(confID)}</td>
			<td>${fn:escapeXml(confResult)}</td>
			<td>${fn:escapeXml(dateReadable)}</td>
        </tbody>
    <%}
        }%>
        </table>
    </div>
  </div>
  <div id="wingE" class="tab-pane fade">
    <div id="occupancytable">
        <table class="table table-hover table-bordered table-striped" style="width:100%">
		<thead>
		  <tr>
			<th>Room</th>
			<th>Availability</th>
			<th>Timestamp</th>
		  </tr>
		</thead>
                <%
        response.setIntHeader("Refresh", 10);
        String confListE[]={"E01","E02","E03","E04","E05"};
        
        for(int i=0;i<5;i++)
        {
        Key postKey = KeyFactory.createKey(confListE[i], confListE[i]);
        
        Query query = new Query("SensorData", postKey).addSort("date", Query.SortDirection.DESCENDING);
        List<Entity> updates = datastore.prepare(query).asList(FetchOptions.Builder.withLimit(100));
        Entity Update=updates.get(0);
        pageContext.setAttribute("confResult",Update.getProperty("content"));
        pageContext.setAttribute("confID",Update.getProperty("sensorID"));
        pageContext.setAttribute("dateReadable", Update.getProperty("dateReadable"));
        if (Update.getProperty("content").equals("Available"))
        	{%>
	        <tbody>
	            <td>${fn:escapeXml(confID)}</td>
				<td style="font-weight:bold">${fn:escapeXml(confResult)}</td>
				<td>${fn:escapeXml(dateReadable)}</td>
	        </tbody>
        <%}
        else
        {%>
	        <tbody>
	            <td>${fn:escapeXml(confID)}</td>
				<td>${fn:escapeXml(confResult)}</td>
				<td>${fn:escapeXml(dateReadable)}</td>
	        </tbody>
        <%}
        }%>
        </table>
    </div>
  </div>
  <div id="wingF" class="tab-pane fade">
    <div id="occupancytable">
        <table class="table table-hover table-bordered table-striped" style="width:100%">
		<thead>
		  <tr>
			<th>Room</th>
			<th>Availability</th>
			<th>Timestamp</th>
		  </tr>
		</thead>
        </table>
    </div>
  </div>
  <div id="wingG" class="tab-pane fade">
    <div id="occupancytable">
        <table class="table table-hover table-bordered table-striped" style="width:100%">
		<thead>
		  <tr>
			<th>Room</th>
			<th>Availability</th>
			<th>Timestamp</th>
		  </tr>
		</thead>
        </table>
    </div>
  </div>
</div>
</div>

<div id="child" style="margin-left:20px">
    <a href="#">Instructions</a>
    &bull;
    <a href="diagnostics.jsp" onclick="OpenLink(this); return false">Diagnostics</a>
 </div>
	
</div> <!-- end of div: container -->

 </body>
 

    
    
       
</html>