<%@page import="ca.quinsam.webcamserver.util.DateUtil"%>

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
	<div id="mySidenav" class="sidenav">
		<h1>Quinsam Webcam</h1>
		<a href="#">About</a> <a href="#">Contact</a> <br />
		<h2>Locations</h2>
		<a href="#">Klemtu - North</a> <a href="#">Klemtu - South</a> <a
			href="#">Port Hardy</a>
	</div>

	<!-- Add all page content inside this div if you want the side nav to push page content to the right (not used if you only want the sidenav to sit on top of the page -->
	<div id="main">
		<h2>Hello World!</h2>
		<p>
			Current Time:
			<% out.println(DateUtil.getTimeStamp()); %>
		</p>
	</div>
</body>
</html>
