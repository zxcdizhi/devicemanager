<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set value="${pageContext.request.contextPath }" var="ctx"></c:set> 
  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0"> <meta name="renderer" content="webkit">
<title>首页</title>
<meta name="keywords" content="">
<meta name="description" content="">

<!-- 引入样式 -->
<link rel="shortcut icon" href="${ctx}/static/favicon.ico"> <link href="${ctx}/static/css/bootstrap.min.css?v=3.3.6" rel="stylesheet">
<link href="${ctx}/static/css/font-awesome.min.css?v=4.4.0" rel="stylesheet">
<link href="${ctx}/static/css/animate.css" rel="stylesheet">
<link href="${ctx}/static/css/style.css?v=4.1.0" rel="stylesheet">

<!-- 引入js -->
    <!-- 全局js -->
    <script src="${ctx}/static/js/jquery.min.js?v=2.1.4"></script>
    <script src="${ctx}/static/js/bootstrap.min.js?v=3.3.6"></script>
    <script src="${ctx}/static/js/plugins/metisMenu/jquery.metisMenu.js"></script>
    <script src="${ctx}/static/js/plugins/slimscroll/jquery.slimscroll.min.js"></script>

    <!-- 自定义js -->
    <script src="${ctx}/static/js/hAdmin.js?v=4.1.0"></script>
    <script type="text/javascript" src="${ctx}/static/js/index.js"></script>

</head>
<body>
	<body class="fixed-sidebar full-height-layout gray-bg" style="overflow:hidden">
    <div id="wrapper">
        <!--左侧导航开始-->
        <nav class="navbar-default navbar-static-side" role="navigation">
            <div class="nav-close"><i class="fa fa-times-circle"></i>
            </div>
            <div class="sidebar-collapse">
                <ul class="nav" id="side-menu">
                    <li class="nav-header">
                        <div class="dropdown profile-element">
                            <a data-toggle="dropdown" class="dropdown-toggle" href="#">
                                <span class="clear">
                                    <span class="block m-t-xs" style="font-size:20px;">
                                        <i class="fa fa-area-chart"></i>
                                        <strong class="font-bold">设备管理系统</strong>
                                    </span>
                                </span>
                            </a>
                        </div>
                        <div class="logo-element">设备管理系统
                        </div>
                    </li> 
                    <li>
                        <a class="J_menuItem" href="${ctx}/task/toDaskList">
                            <i class="fa fa-envelope"></i>
                            <span class="nav-label">任务管理</span>
                        </a>     
                    </li>
                    <li>
                        <a class="J_menuItem" href="${ctx}/device/toDeviceList">
                        	<i class="fa fa fa-bar-chart-o"></i> 
                            <span class="nav-label">设备管理</span></span>
                        </a>   
                    </li>                                           
                    <li>                    
                       <a class="J_menuItem" href="${ctx}/user/toUserList">
                        	<i class="fa fa-desktop"></i> 
                            <span class="nav-label">人员管理</span></span>
                        </a>   
                    </li>  
                    <li>                    
                       <a class="J_menuItem" href="attendanceList.jsp">
                        	<i class="fa fa-edit"></i> 
                            <span class="nav-label">考勤管理</span>
                        </a>
                    </li>                                             
                </ul>
            </div>
        </nav>
                    
        <!--左侧导航结束-->
        <!--右侧部分开始-->
        <div id="page-wrapper" class="gray-bg dashbard-1">
            <div class="row border-bottom">
                <nav class="navbar navbar-static-top" role="navigation" style="margin-bottom: 0">
                    <div class="navbar-header"><a class="navbar-minimalize minimalize-styl-2 btn btn-info " href="#"><i class="fa fa-bars"></i> </a>
                        <form role="search" class="navbar-form-custom" method="post" action="search_results.jsp">
                            <div class="form-group">
                                <input type="text" placeholder="请输入您需要查找的内容 …" class="form-control" name="top-search" id="top-search">
                            </div>
                        </form>
                    </div>
                    <ul class="nav navbar-top-links navbar-right" >
                        <li class="dropdown">
                            <a class="dropdown-toggle count-info" data-toggle="dropdown" href="#">
                                <i >${user.uname }</i> <span class="label label-warning"></span>
                            </a>
                            
                        </li>
                        <li class="dropdown">
                            <a class="dropdown-toggle count-info"  href="${ctx}/start/logout">退出</a>                            
                        </li>
                    </ul>
                </nav>
            </div>
            <div class="row J_mainContent" id="content-main">
                <iframe id="J_iframe" width="100%" height="100%" src="${ctx}/static/index_v2.jsp?v=4.0" frameborder="0" data-id="${ctx}/static/index_v2.jsp" seamless></iframe>                	   			       
            </div>
        </div>
        <!--右侧部分结束-->
    </div>
</body>
</html>