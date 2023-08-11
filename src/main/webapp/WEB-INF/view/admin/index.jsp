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
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<!-- end: CSS -->	
</head>
<style>
	.statbox .number {
		right: 0;
		top: 0;
	}
</style>
<body>
<jsp:include page="common/adminHeader.jsp"/><!--adminHeader.jsp -->
	<div class="container-fluid-full">
	<div class="row-fluid">

		<jsp:include page="common/menuNavi.jsp" /><!-- Main Menu -->

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
				<div class="title">총 회원 수</div>
			</div>
			<div class="span3 statbox yellow" onTablet="span6" onDesktop="span3">
				<div class="number">${todayJoinResult}명<i class="icon-arrow-down"></i></div>
				<div class="title">신규가입(오늘)</div>
			</div>
<%--
			<div class="span3 statbox blue" onTablet="span6" onDesktop="span3">
				<div class="number">???<i class="icon-arrow-up"></i></div>
				<div class="title">회원탈퇴</div>
			</div>
--%>
		</div>

		<div class="row-fluid">

			<div class="span3 statbox red" onTablet="span6" onDesktop="span3">
				<div class="number">${qnaResult}개<i class="icon-arrow-up"></i></div>
				<div class="title">총 문의 수</div>
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

			<div class="span3 statbox green noMargin" onTablet="span6" onDesktop="span3">
				<div class="number">${getResult}개<i class="icon-arrow-up"></i></div>
				<div class="title">무통장입금 예약 완료</div>
			</div>

			<div class="span3 statbox purple" onTablet="span6" onDesktop="span3">
				<div class="number">${noneBankBookResult}개<i class="icon-arrow-up"></i></div>
				<div class="title">무통장입금 예약 대기</div>
			</div>

		</div>

		<div class="row-fluid">
<!--
			<div class="span3 statbox green" onTablet="span6" onDesktop="span3">
				<div class="number">???<i class="icon-arrow-up"></i></div>
				<div class="title">예약취소</div>
			</div>
-->

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
</div>
<jsp:include page="common/adminFooter.jsp"/><!--adminFooter.jsp -->
</body>
</html>
