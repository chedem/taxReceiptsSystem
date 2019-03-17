<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>税务凭证——首页</title>
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--[if lt IE 9]>
		    <meta http-equiv="refresh" content="0;ie.html" />
		<![endif]-->
 <link href="jsp/css/plugins/bootstrap/bootstrap.min.css" rel="stylesheet"
          type="text/css">
<link rel="stylesheet" href="jsp/css/plugins/fontawe/font-awesome.css" type="text/css"></link>
    <link href="jsp/css/common/animate.css" rel="stylesheet" type="text/css">
    <link rel="stylesheet" href="jsp/css/common/style.css" type="text/css">
    <!-- 全局js -->
    <script type="text/javascript" src="jsp/js/plugins/jQuery/jquery.min.js"></script>
    <script type="text/javascript" src="jsp/js/plugins/bootstrap/bootstrap.min.js"></script>
    <script type="text/javascript"
            src="jsp/js/lib/jquery.cookie.js"></script>
    <script type="text/javascript"
            src="jsp/js/plugins/metisMenu/jquery.metisMenu.js"></script>
    
    <script type="text/javascript" src="jsp/index/js/hplus.js"></script>
    <script type="text/javascript" src="jsp/index/js/contabs.js"></script>
    <script type="text/javascript" src="jsp/index/js/hideLeftNav.js"></script>
</head>
<body class="fixed-sidebar full-height-layout gray-bg">
<div id="wrapper">
    <div class="c_top bg-info">
        <nav class="c_logo"> <img src="jsp/img/bitug_favicon.gif"
                                  alt="SWPZ" href="javascript:void(0);" /> <strong class="c_font">凭证自动化平台</strong>
        </nav>
    </div>
    <div class="row">
        <!--左侧导航-->
        <nav id="leftNav" class="navbar-default navbar-static-side"
             role="navigation">
            <div class="sidebar-collapse">
                <ul class="nav" id="side-menu">
                    <li class="nav-header">
                        <div class="dropdown profile-element">
							<span><img alt="image" class="img-circle"
                                       src="jsp/img/profile_small.jpg" /> </span> <a data-toggle="dropdown"
                                                                                     class="dropdown-toggle" href="javascript:void(0);"
                                                                                     aria-expanded="false"> <span class="clear"> <span
                                class="block m-t-xs" style="color:#fff;"><strong
                                class="font-bold">admin</strong> </span> <span class="text-muted block">超级管理员<b
                                class="caret"></b> </span> </span> </a>
                            <ul class="dropdown-menu animated fadeInRight m-t-xs">
                                <!-- <li><a class="J_menuItem" href="profile.html">个人信息</a>
                                    </li> -->
                                <li><a class="J_menuItem" href="javascript:void(0);">联系我们</a>
                                </li>
                                <li class="divider"></li>
                                <li><a href="jsp/login/login.jsp">安全退出</a></li>
                            </ul>
                        </div></li>
                    <li><a href="javascript:void(0);"> <i
                            class="glyphicon glyphicon-cog"></i> <span class="nav-label">基础设置</span>
                        <span class="fa arrow"></span> </a>
                        <ul class="nav nav-second-level">
                            <li><a id="userAdmin" class="J_menuItem"
                                   data-index="0" href="jsp/administrator/admin.jsp">用户管理</a>
                            </li>
                            <!-- <li><a id="subject" class="J_menuItem"
                                   data-index="0" href="javascript:void(0);" onclick="window.open('jsp/summary/index1.jsp');">科目配比</a>
                            </li> -->
                            <li><a id="subject" class="J_menuItem"
                                   data-index="0" href="jsp/summary/index1.jsp">科目配比</a>
                            </li>
                        </ul>
                    </li>
                    <li><a href="javascript:void(0);"> <i
                            class="glyphicon glyphicon-list-alt"></i> <span class="nav-label">数据操作</span>
                        <span class="fa arrow"></span> </a>
                        <ul class="nav nav-second-level">
                            <li><a class="J_menuItem"
                                   data-index="0" href="jsp/budget/budget.jsp">数据导入</a>
                            </li>
                            <li><a class="J_menuItem"
                                   data-index="0" href="jsp/download/allDownload.jsp">数据导出</a>
                            </li>
                        </ul>
                    </li>
                </ul>
            </div>
        </nav>
        <!--右侧选项卡-->
        <div id="page-wrapper" class="gray-bg dashbard-1">
            <div class="row content-tabs">
                <button id="showOrhide" class="roll-nav roll-left btn">
                    <i class="fa fa-backward"></i>
                </button>
                <nav class="page-tabs J_menuTabs">
                    <div class="page-tabs-content">
                        <a href="javascript:void(0);" class="active J_menuTab"
                           data-id="index_v1.html">首页</a>
                    </div>
                </nav>
                <button class="roll-nav roll-right J_tabRight">
                    <i class="fa fa-forward"></i>
                </button>
                <div class="btn-group roll-nav roll-right">
                    <button class="J_tabClose">
                        关闭操作<span class="caret"></span>
                    </button>
                </div>
                <a href="jsp/login/login.jsp"
                   class="roll-nav roll-right J_tabExit"><i
                        class="fa fa fa-sign-out"></i> 退出</a>
            </div>
            <div align="center" style="margin:0 auto;">
                <div id="content_box">
                    <div class="J_mainContent" id="content-main">
                        <iframe class="J_iframe" id="external-frame" name="iframe0"
                                width="800" height="560" scrolling="no" src="jsp/index/index-main.html"
                                frameborder="0" data-id="index_v1.html" seamless> </iframe>
                    </div>
                </div>
            </div>
        </div>
</body>
</html>
