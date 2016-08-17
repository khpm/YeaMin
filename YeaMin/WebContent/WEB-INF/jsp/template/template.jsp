<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Pragma" content="no-cache">
		<meta http-equiv="Cache-Control" content="No-Cache">
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1"/>
   		<meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1, maximum-scale=1, minimum-scale=1"/>
		
		<title>${title}</title>
		
		<link rel="shortcut icon" href="http://dev.axisj.com/ui/axisj.ico" type="image/x-icon"/>
		<link rel="icon" href="http://dev.axisj.com/ui/axisj.ico" type="image/x-icon"/>
		
		<!-- jquery -->
		<script type="text/javascript" src="/YeaMin/js/jquery-1.12.4.js"></script>
		
		<!-- axicon -->
		<link rel="stylesheet" type="text/css" href="/YeaMin/css/axicon/axicon.min.css"/>
		
		<!-- axisj -->
		<c:if test="${user == null or user.is_admin eq 'N'}">
			<link rel="stylesheet" type="text/css" href="/YeaMin/css/axisj/ui/bulldog/AXJ.min.css" id="axu-theme-axisj"/>
			<link rel="stylesheet" href="/YeaMin/ui/cocker-dark/admin.css" id="axu-theme-admin"/>
		</c:if>
		<c:if test="${user.is_admin eq 'Y'}">
			<link rel="stylesheet" type="text/css" href="/YeaMin/css/axisj/ui/cocker/AXJ.min.css" id="axu-theme-axisj"/>
			<link rel="stylesheet" href="/YeaMin/ui/cocker-dark-red/admin.css" id="axu-theme-admin"/>
		</c:if>
		
		<link rel="stylesheet" href="/YeaMin/ui/custom.css"/>
		<script type="text/javascript" src="/YeaMin/js/axisj/dist/AXJ.min.js"></script>
		<script type="text/javascript" src="/YeaMin/js/axisj/lib/AXDivSlider.js"></script>
	
	    <script type="text/javascript" src="/YeaMin/resource/admin.js"></script>
		
		<!-- fullcalendar -->
		<link rel="stylesheet" href="/YeaMin/css/fullcalendar/lib/cupertino/jquery-ui.min.css"/>
		<link rel="stylesheet" href="/YeaMin/css/fullcalendar/fullcalendar.css" />
		<link rel="stylesheet" href="/YeaMin/css/fullcalendar/fullcalendar.print.css" media="print"/>
		<script type="text/javascript" src="/YeaMin/js/fullcalendar/lib/moment.min.js"></script>
		<script type="text/javascript" src="/YeaMin/js/fullcalendar/fullcalendar.min.js"></script>
		<script type="text/javascript" src="/YeaMin/js/fullcalendar/lang-all.js"></script>
		
		<!-- daum -->
		<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
		<script src="//apis.daum.net/maps/maps3.js?apikey=8355c25105d42f80b6f88247555a1c2a&libraries=services"></script>
		
		<!-- amcharts -->
		<script type="text/javascript" src="/YeaMin/js/amcharts/amcharts.js"></script>
		<script type="text/javascript" src="/YeaMin/js/amcharts/serial.js"></script>
		<script type="text/javascript" src="/YeaMin/js/amcharts/pie.js"></script>
		
		<!-- yeamin -->
		<link rel="stylesheet" href="/YeaMin/css/yeamin.css" />
		<script type="text/javascript" src="/YeaMin/js/yeamin.js"></script>
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