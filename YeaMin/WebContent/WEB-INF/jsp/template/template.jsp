<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE>
<html>
	<head>
		<meta http-equiv="Pragma" content="no-cache">
		<meta http-equiv="Cache-Control" content="No-Cache">
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
   		<meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1, maximum-scale=1, minimum-scale=1" />
		
		<title>${title}</title>
		
		<link rel="shortcut icon" href="http://dev.axisj.com/ui/axisj.ico" type="image/x-icon" />
		<link rel="icon" href="http://dev.axisj.com/ui/axisj.ico" type="image/x-icon" />
	
		<link rel="stylesheet" type="text/css" href="/YeaMin/css/axicon/axicon.min.css" />
		<link rel="stylesheet" type="text/css" href="/YeaMin/css/axisj/ui/arongi/AXJ.min.css" id="axu-theme-axisj" />
	
		<script type="text/javascript" src="/YeaMin/js/jquery-1.12.4.js"></script>
		<script type="text/javascript" src="/YeaMin/js/axisj/dist/AXJ.min.js"></script>
	
		<link rel="stylesheet" href="/YeaMin/ui/cacao/admin.css" id="axu-theme-admin" />
		<link rel="stylesheet" href="/YeaMin/ui/custom.css" />
	
	    <script type="text/javascript" src="/YeaMin/resource/admin.js"></script>
		<script type="text/javascript" src="/YeaMin/resource/Chart.min.js"></script>
	</head>
	<body>
		<div id="AXPage">
			<!-- header start -->
			<jsp:include page="/WEB-INF/jsp/template/header.jsp"/>
			<!-- header end -->
			
			<!-- content start -->
			<jsp:include page="${contentViewName}"/>
			<!-- content end -->
			
			<!-- aside start -->
			<jsp:include page="/WEB-INF/jsp/template/aside.jsp"/>
			<!-- aside end -->
			
			<!-- footer start -->
			<jsp:include page="/WEB-INF/jsp/template/footer.jsp"/>
			<!-- footer end -->
		</div>
	</body>
</html>