<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set value="${pageContext.request.contextPath }" var="ctx"></c:set>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
 <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <!--360浏览器优先以webkit内核解析-->


    <title> - 主页示例</title>
    <link rel="shortcut icon" href="favicon.ico"> <link href="${ctx}/static/css/bootstrap.min.css?v=3.3.6" rel="stylesheet">
    <link href="${ctx}/static/css/font-awesome.css?v=4.4.0" rel="stylesheet">

    <link href="${ctx}/static/css/animate.css" rel="stylesheet">
    <link href="${ctx}/static/css/style.css?v=4.1.0" rel="stylesheet">
	<style type="text/css">
    	.rightBar{ width:32%; height:100%;  float:right; margin-top:20px;}
    	table{ margin-top:20px;}
    </style>
</head>
<body class="gray-bg">             
    <div class="rightBar">
    	 <div id="time">
                <div id="clock" class="light">
                    <div class="display">
                        <div class="weekdays"></div>
                        <div class="ampm"></div>
                        <div class="alarm"></div>
                        <div class="digits"></div>
                    </div>
                </div>        
        </div>             
        <div id="date">
        	<div id="calendar" class="calendar"></div>     
        </div>		
    </div>  
	
	<!-- 全局js -->
    <script src="${ctx}/static/js/jquery.min.js?v=2.1.4"></script>
    <script src="${ctx}/static/js/bootstrap.min.js?v=3.3.6"></script>
    <!-- 自定义js -->
    <script src="${ctx}/static/js/content.js"></script>
    
</body>

</html>
</body>
</html>