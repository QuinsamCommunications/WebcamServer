<%@page import="ca.quinsam.webcamserver.core.Config"%>
<% Config.readFile(); %>

<html lang="en" dir="ltr">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width">
<meta name="description" content="Wildfly web server for FTP webcam monitoring">
<meta name="keywords" content="quinsam, communications, webcam">
<meta name="author" content="Chad Humphries">
<link rel="icon" type="image/png" sizes="32x32" href="img/favicon-32x32.png">
<title>Quinsam Webcam</title>
<link rel="stylesheet" href="./css/style.css">
</head>
<body>
	<!-- Side Bar -->
	<div id="mySidenav" class="sidenav">
		<h1>Quinsam Webcam</h1>
		<a href="<%out.print(Config.getURL());%>">About</a>
		<a href="<%out.print(Config.getURL());%>/contact.jsp">Contact</a>
		<br/>
		<h2>Locations</h2>
		<a href="<%out.print(Config.getURL());%>/webcam.jsp?site=Klemtu+North">Klemtu - North</a>
		<a href="<%out.print(Config.getURL());%>/webcam.jsp?site=Klemtu+South">Klemtu - South</a>
		<a href="<%out.print(Config.getURL());%>/webcam.jsp?site=Port+Hardy">Port Hardy</a>
	</div>

	<!-- Page Content -->
	<div id="main" style='margin-left:15%;'>
		<h2 id='siteTitle'>About</h2>
		<p>Quinsam Webcam is a weather monitoring webcam server created by Quinsam Communications that captures a snapshot from each webcam every hour and allows the user to scroll through the last 2 weeks of images.</p>
		<p>Check out the sites listed in the side menu!</p>
	</div>
</body>
</html>
