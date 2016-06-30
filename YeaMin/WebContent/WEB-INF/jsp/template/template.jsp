<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<!DOCTYPE>
<html>
	<head>
		<meta http-equiv="Pragma" content="no-cache">
		<meta http-equiv="Cache-Control" content="No-Cache">
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		
		<title>${title}</title>
		
		<!-- css -->
		<link rel="stylesheet" href="/YeaMin/css/bootstrap.css">
		<link rel="stylesheet" href="/YeaMin/css/yeamin.css">
		
		<!-- js -->
		<script type="text/javascript" src="/YeaMin/js/jquery-2.2.4.js"></script>
		<script type="text/javascript" src="/YeaMin/js/bootstrap.js"></script>
		<script type="text/javascript" src="/YeaMin/js/yeamin.js"></script>
	</head>
	<body>
		<!-- header -->
		<jsp:include page="/WEB-INF/jsp/template/header.jsp"/>
		<!-- container -->
		<jsp:include page="${contentViewName}"/>
		<!-- footer -->
		<jsp:include page="/WEB-INF/jsp/template/footer.jsp"/>
	</body>
</html>