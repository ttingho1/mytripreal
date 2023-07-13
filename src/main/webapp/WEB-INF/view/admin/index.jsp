<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="KO">
<head>
	<meta charset="utf-8">
	<title>호앤삐 - 관리자페이지</title>
	<meta name="description" content="Bootstrap Metro Dashboard">
	<meta name="author" content="Dennis Ji">
	<meta name="keyword" content="Metro, Metro UI, Dashboard, Bootstrap, Admin, Template, Theme, Responsive, Fluid, Retina">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<!-- start: CSS -->
	<link id="bootstrap-style" href="/resources/static/admin/css/bootstrap.min.css" rel="stylesheet">
	<link href="/resources/static/admin/css/bootstrap-responsive.min.css" rel="stylesheet">
	<link id="base-style" href="/resources/static/admin/css/style.css" rel="stylesheet">
	<link id="base-style-responsive" href="/resources/static/admin/css/style-responsive.css" rel="stylesheet">
	<link href='http://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800&subset=latin,cyrillic-ext,latin-ext' rel='stylesheet' type='text/css'>
	<!-- end: CSS -->	
</head>
<style>
	.statbox .number {
		right: 0;
		top: 0;
	}
</style>
<body>
	<!-- start: Header -->
	<div class="navbar">
		<div class="navbar-inner">
			<div class="container-fluid">
				<a class="btn btn-navbar" data-toggle="collapse" data-target=".top-nav.nav-collapse,.sidebar-nav.nav-collapse">
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
				</a>
				<a class="brand" href="/admin"><span>호앤삐</span></a>
								
				<!-- start: Header Menu -->
				<div class="nav-no-collapse header-nav">
					<ul class="nav pull-right">
						<li class="dropdown hidden-phone">
							<a class="btn dropdown-toggle" data-toggle="dropdown" href="#">
								<i class="icon-bell"></i>
								<span class="badge red">
								7 </span>
							</a>
							<ul class="dropdown-menu notifications">
								<li class="dropdown-menu-title">
 									<span>You have 11 notifications</span>
									<a href="#none"><i class="icon-repeat"></i></a>
								</li>	
                            	<li>
                                    <a href="#none">
										<span class="icon blue"><i class="icon-user"></i></span>
										<span class="message">New user registration</span>
										<span class="time">1 min</span> 
                                    </a>
                                </li>
								<li>
                                    <a href="#none">
										<span class="icon green"><i class="icon-comment-alt"></i></span>
										<span class="message">New comment</span>
										<span class="time">7 min</span> 
                                    </a>
                                </li>
								<li>
                                    <a href="#none">
										<span class="icon green"><i class="icon-comment-alt"></i></span>
										<span class="message">New comment</span>
										<span class="time">8 min</span> 
                                    </a>
                                </li>
								<li>
                                    <a href="#none">
										<span class="icon green"><i class="icon-comment-alt"></i></span>
										<span class="message">New comment</span>
										<span class="time">16 min</span> 
                                    </a>
                                </li>
								<li>
                                    <a href="#none">
										<span class="icon blue"><i class="icon-user"></i></span>
										<span class="message">New user registration</span>
										<span class="time">36 min</span> 
                                    </a>
                                </li>
								<li>
                                    <a href="#">
										<span class="icon yellow"><i class="icon-shopping-cart"></i></span>
										<span class="message">2 items sold</span>
										<span class="time">1 hour</span> 
                                    </a>
                                </li>
								<li class="warning">
                                    <a href="#">
										<span class="icon red"><i class="icon-user"></i></span>
										<span class="message">User deleted account</span>
										<span class="time">2 hour</span> 
                                    </a>
                                </li>
								<li class="warning">
                                    <a href="#none">
										<span class="icon red"><i class="icon-shopping-cart"></i></span>
										<span class="message">New comment</span>
										<span class="time">6 hour</span> 
                                    </a>
                                </li>
								<li>
                                    <a href="#none">
										<span class="icon green"><i class="icon-comment-alt"></i></span>
										<span class="message">New comment</span>
										<span class="time">yesterday</span> 
                                    </a>
                                </li>
								<li>
                                    <a href="#none">
										<span class="icon blue"><i class="icon-user"></i></span>
										<span class="message">New user registration</span>
										<span class="time">yesterday</span> 
                                    </a>
                                </li>
                                <li class="dropdown-menu-sub-footer">
                            		<a>View all notifications</a>
								</li>	
							</ul>
						</li>
						<!-- start: Notifications Dropdown -->
						<li class="dropdown hidden-phone">
							<a class="btn dropdown-toggle" data-toggle="dropdown" href="#">
								<i class="icon-calendar"></i>
								<span class="badge red">
								5 </span>
							</a>
							<ul class="dropdown-menu tasks">
								<li class="dropdown-menu-title">
 									<span>You have 17 tasks in progress</span>
									<a href="#none"><i class="icon-repeat"></i></a>
								</li>
								<li>
                                    <a href="#none">
										<span class="header">
											<span class="title">iOS Development</span>
											<span class="percent"></span>
										</span>
                                        <div class="taskProgress progressSlim red">80</div> 
                                    </a>
                                </li>
                                <li>
                                    <a href="#none">
										<span class="header">
											<span class="title">Android Development</span>
											<span class="percent"></span>
										</span>
                                        <div class="taskProgress progressSlim green">47</div> 
                                    </a>
                                </li>
                                <li>
                                    <a href="#none">
										<span class="header">
											<span class="title">ARM Development</span>
											<span class="percent"></span>
										</span>
                                        <div class="taskProgress progressSlim yellow">32</div> 
                                    </a>
                                </li>
								<li>
                                    <a href="#none">
										<span class="header">
											<span class="title">ARM Development</span>
											<span class="percent"></span>
										</span>
                                        <div class="taskProgress progressSlim greenLight">63</div> 
                                    </a>
                                </li>
                                <li>
                                    <a href="#none">
										<span class="header">
											<span class="title">ARM Development</span>
											<span class="percent"></span>
										</span>
                                        <div class="taskProgress progressSlim orange">80</div> 
                                    </a>
                                </li>
								<li>
                            		<a class="dropdown-menu-sub-footer">View all tasks</a>
								</li>	
							</ul>
						</li>
						<!-- end: Notifications Dropdown -->
						<!-- start: Message Dropdown -->
						<li class="dropdown hidden-phone">
							<a class="btn dropdown-toggle" data-toggle="dropdown" href="#">
								<i class="icon-envelope"></i>
								<span class="badge red">
								4 </span>
							</a>
							<ul class="dropdown-menu messages">
								<li class="dropdown-menu-title">
 									<span>You have 9 messages</span>
									<a href="#refresh"><i class="icon-repeat"></i></a>
								</li>	
                            	<li>
                                    <a href="#">
										<span class="avatar"><img src="img/avatar.jpg" alt="Avatar"></span>
										<span class="header">
											<span class="from">
										    	Dennis Ji
										     </span>
											<span class="time">
										    	6 min
										    </span>
										</span>
                                        <span class="message">
                                            Lorem ipsum dolor sit amet consectetur adipiscing elit, et al commore
                                        </span>  
                                    </a>
                                </li>
                                <li>
                                    <a href="#">
										<span class="avatar"><img src="img/avatar.jpg" alt="Avatar"></span>
										<span class="header">
											<span class="from">
										    	Dennis Ji
										     </span>
											<span class="time">
										    	56 min
										    </span>
										</span>
                                        <span class="message">
                                            Lorem ipsum dolor sit amet consectetur adipiscing elit, et al commore
                                        </span>  
                                    </a>
                                </li>
                                <li>
                                    <a href="#">
										<span class="avatar"><img src="img/avatar.jpg" alt="Avatar"></span>
										<span class="header">
											<span class="from">
										    	Dennis Ji
										     </span>
											<span class="time">
										    	3 hours
										    </span>
										</span>
                                        <span class="message">
                                            Lorem ipsum dolor sit amet consectetur adipiscing elit, et al commore
                                        </span>  
                                    </a>
                                </li>
								<li>
                                    <a href="#">
										<span class="avatar"><img src="img/avatar.jpg" alt="Avatar"></span>
										<span class="header">
											<span class="from">
										    	Dennis Ji
										     </span>
											<span class="time">
										    	yesterday
										    </span>
										</span>
                                        <span class="message">
                                            Lorem ipsum dolor sit amet consectetur adipiscing elit, et al commore
                                        </span>  
                                    </a>
                                </li>
                                <li>
                                    <a href="#">
										<span class="avatar"><img src="img/avatar.jpg" alt="Avatar"></span>
										<span class="header">
											<span class="from">
										    	Dennis Ji
										     </span>
											<span class="time">
										    	Jul 25, 2012
										    </span>
										</span>
                                        <span class="message">
                                            Lorem ipsum dolor sit amet consectetur adipiscing elit, et al commore
                                        </span>  
                                    </a>
                                </li>
								<li>
                            		<a class="dropdown-menu-sub-footer">View all messages</a>
								</li>	
							</ul>
						</li>
						
						<!-- start: User Dropdown -->
						<li class="dropdown">
							<a class="btn dropdown-toggle" data-toggle="dropdown" href="#">
								<c:if test="${sessionScope.userName ne null}">
									<i class="halflings-icon white user"></i> ${sessionScope.userName}님
								</c:if>
								<c:if test="${sessionScope.email ne null}">
									<i class="halflings-icon white user"></i> ${sessionScope.name}님
								</c:if>
								<span class="caret"></span>
							</a>
							<ul class="dropdown-menu">
								<li class="dropdown-menu-title">
 									<span>Account Settings</span>
								</li>
								<li><a href="#"><i class="halflings-icon user"></i> Profile</a></li>
								<li><a href="/admin/adLogout.do"><i class="halflings-icon off"></i>Logout</a></li>
							</ul>
						</li>
						<!-- end: User Dropdown -->
					</ul>
				</div>
				<!-- end: Header Menu -->
				
			</div>
		</div>
	</div>
	<!-- start: Header -->
	
		<div class="container-fluid-full">
		<div class="row-fluid">
				
			<!-- start: Main Menu -->
			<div id="sidebar-left" class="span2">
				<div class="nav-collapse sidebar-nav">
					<ul class="nav nav-tabs nav-stacked main-menu">
						<li><a href="/admin"><i class="icon-bar-chart"></i><span class="hidden-tablet"> 대시보드</span></a></li>
						<li><a href="#none"><i class="icon-bar-chart"></i><span class="hidden-tablet"> 회원관리 </span></a></li>
						<li><a href="#none"><i class="icon-bar-chart"></i><span class="hidden-tablet"> 문의관리 </span></a></li>
					</ul>
				</div>
			</div>

			<!-- end: Main Menu -->
			
			<noscript>
				<div class="alert alert-block span10">
					<h4 class="alert-heading">Warning!</h4>
					<p>You need to have <a href="http://en.wikipedia.org/wiki/JavaScript" target="_blank">JavaScript</a> enabled to use this site.</p>
				</div>
			</noscript>
			
			<!-- start: Content -->
			<div id="content" class="span10" style="height: 950px;">
			
			
			<ul class="breadcrumb">
				<li>
					<i class="icon-home"></i>
					<a href="admin/index">Home</a>
					<i class="icon-angle-right"></i>
				</li>
				<li><a href="#">Dashboard</a></li>
			</ul>

			<div class="row-fluid">
				
				<div class="span3 statbox purple" onTablet="span6" onDesktop="span3">
					<div class="number">${memResult}명<i class="icon-arrow-up"></i></div>
					<div class="title">총 회원수</div>
				</div>
				<div class="span3 statbox yellow" onTablet="span6" onDesktop="span3">
					<div class="number">???<i class="icon-arrow-down"></i></div>
					<div class="title">신규가입(오늘)</div>
				</div>
				<div class="span3 statbox blue noMargin" onTablet="span6" onDesktop="span3">
					<div class="number">???<i class="icon-arrow-up"></i></div>
					<div class="title">신규가입(이번주)</div>
				</div>
				<div class="span3 statbox green" onTablet="span6" onDesktop="span3">
					<div class="number">???<i class="icon-arrow-up"></i></div>
					<div class="title">신규가입(이번달)</div>
				</div>
			</div>

			<div class="row-fluid">

				<div class="span3 statbox red" onTablet="span6" onDesktop="span3">
					<div class="number">${qnaResult}개<i class="icon-arrow-up"></i></div>
					<div class="title">총 문의수</div>
				</div>
				<div class="span3 statbox blue" onTablet="span6" onDesktop="span3">
					<div class="number">${Yresult}개<i class="icon-arrow-up"></i></div>
					<div class="title">답변완료 문의</div>
				</div>
				<div class="span3 statbox orange noMargin" onTablet="span6" onDesktop="span3">
					<div class="number">${Nresult}개<i class="icon-arrow-up"></i></div>
					<div class="title">답변대기 문의</div>
				</div>
			</div>

			<div class="row-fluid">
<!--
				<div class="span3 statbox blue" onTablet="span6" onDesktop="span3">
					<div class="number">???<i class="icon-arrow-up"></i></div>
					<div class="title">총 예약횟수</div>
				</div>
				<div class="span3 statbox red" onTablet="span6" onDesktop="span3">
					<div class="number">???<i class="icon-arrow-up"></i></div>
					<div class="title">예약(이번달)</div>
				</div>
				<div class="span3 statbox yellow noMargin" onTablet="span6" onDesktop="span3">
					<div class="number">???<i class="icon-arrow-up"></i></div>
					<div class="title">예약(이번주)</div>
				</div>
				<div class="span3 statbox green noMargin" onTablet="span6" onDesktop="span3">
					<div class="number">???<i class="icon-arrow-up"></i></div>
					<div class="title">예약(오늘)</div>
				</div>
			</div>
-->
			<div class="row-fluid">
<!--
				<div class="span3 statbox green" onTablet="span6" onDesktop="span3">
					<div class="number">???<i class="icon-arrow-up"></i></div>
					<div class="title">예약취소</div>
				</div>
-->
				<div class="span3 statbox yellow" onTablet="span6" onDesktop="span3">
					<div class="number">???<i class="icon-arrow-up"></i></div>
					<div class="title">회원탈퇴</div>
				</div>
			</div>
		
	</div><!--/.fluid-container-->
	
			<!-- end: Content -->
		</div><!--/#content.span10-->
		</div><!--/fluid-row-->
		
	<div class="modal hide fade" id="myModal">
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal">×</button>
			<h3>Settings</h3>
		</div>
		<div class="modal-body">
			<p>Here settings can be configured...</p>
		</div>
		<div class="modal-footer">
			<a href="#none" class="btn" data-dismiss="modal">Close</a>
			<a href="#none" class="btn btn-primary">Save changes</a>
		</div>
	</div>
	
	<div class="common-modal modal fade" id="common-Modal1" tabindex="-1" role="dialog" aria-hidden="true">
		<div class="modal-content">
			<ul class="list-inline item-details">
				<li><a href="http://themifycloud.com">Admin templates</a></li>
				<li><a href="http://themescloud.org">Bootstrap themes</a></li>
			</ul>
		</div>
	</div>
	
	<div class="clearfix"></div>
	
	<!--<footer></footer>-->
	
	<!-- start: JavaScript-->

		<script src="/resources/static/admin/js/jquery-1.9.1.min.js"></script>
	<script src="/resources/static/admin/js/jquery-migrate-1.0.0.min.js"></script>
	
		<script src="/resources/static/admin/js/jquery-ui-1.10.0.custom.min.js"></script>
	
		<script src="/resources/static/admin/js/jquery.ui.touch-punch.js"></script>
	
		<script src="/resources/static/admin/js/modernizr.js"></script>
	
		<script src="/resources/static/admin/js/bootstrap.min.js"></script>
	
		<script src="/resources/static/admin/js/jquery.cookie.js"></script>
	
		<script src='/resources/static/admin/js/fullcalendar.min.js'></script>
	
		<script src='/resources/static/js/jquery.dataTables.min.js'></script>

		<script src="/resources/static/admin/js/excanvas.js"></script>
	<script src="/resources/static/admin/js/jquery.flot.js"></script>
	<script src="/resources/static/admin/js/jquery.flot.pie.js"></script>
	<script src="/resources/static/admin/js/jquery.flot.stack.js"></script>
	<script src="/resources/static/admin/js/jquery.flot.resize.min.js"></script>
	
		<script src="/resources/static/admin/js/jquery.chosen.min.js"></script>
	
		<script src="/resources/static/admin/js/jquery.uniform.min.js"></script>
		
		<script src="/resources/static/admin/js/jquery.cleditor.min.js"></script>
	
		<script src="/resources/static/admin/js/jquery.noty.js"></script>
	
		<script src="/resources/static/admin/js/jquery.elfinder.min.js"></script>
	
		<script src="/resources/static/admin/js/jquery.raty.min.js"></script>
	
		<script src="/resources/static/admin/js/jquery.iphone.toggle.js"></script>
	
		<script src="/resources/static/admin/js/jquery.uploadify-3.1.min.js"></script>
	
		<script src="/resources/static/admin/js/jquery.gritter.min.js"></script>
	
		<script src="/resources/static/admin/js/jquery.imagesloaded.js"></script>
	
		<script src="/resources/static/admin/js/jquery.masonry.min.js"></script>
	
		<script src="/resources/static/admin/js/jquery.knob.modified.js"></script>
	
		<script src="/resources/static/admin/js/jquery.sparkline.min.js"></script>
	
		<script src="/resources/static/admin/js/counter.js"></script>
	
		<script src="/resources/static/admin/js/retina.js"></script>

		<script src="/resources/static/admin/js/custom.js"></script>
	<!-- end: JavaScript-->
	
</body>
</html>
