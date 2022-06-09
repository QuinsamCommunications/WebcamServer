<%@page isELIgnored="false" %>
<%@page import="ca.quinsam.webcamserver.core.Config"%>
<%@page import="ca.quinsam.webcamserver.io.ImageIO"%>

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
	<!-- Load Images -->
	<%
		String path = "";
		switch(request.getParameter("site")) {
			case "Klemtu North":
				path = Config.getKlemtuNorth();
				break;
			case "Klemtu South":
				path = Config.getKlemtuSouth();
				break;
			case "Port Hardy":
				path = Config.getPortHardy();
				break;
			}
		ImageIO.loadImages(path);
	%>
	<script>
		var files = [];
		<%
			for(int i = 0; i < ImageIO.getImageCount(); i++) {
				out.println("files[" + i + "] = '" + path + "/" + ImageIO.getImage(i).getName() + "';");
			}
		%>
		function getImage(x) {
			return files[x];
		}
	</script>
	
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
	<div id="main">
		<h2 id='siteTitle'>${param.site}</h2>
		<img id='img' src='<% out.print(path + "/" + ImageIO.getImage(ImageIO.getImageCount() - 1).getName()); %>'>
		<br/>
		<div id='controls'>
			Image: 
			<input type="range" value="<% out.print(ImageIO.getImageCount() - 1); %>" min="<% out.print(ImageIO.getImageCount() - ImageIO.getMaxImages()); %>" max="<% out.print(ImageIO.getImageCount() - 1); %>" oninput="document.getElementById('img').src = getImage(this.value); this.nextElementSibling.value = parseInt(this.value) == parseInt(this.max) ? 'Latest' : parseInt(this.max) - parseInt(this.value) + ' images ago';">
			<output>Latest</output>
		</div>
	</div>
</body>
</html>
