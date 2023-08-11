<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>

    <!-- start: Meta -->
    <meta charset="utf-8">
    <title>Bootstrap Metro Dashboard by Dennis Ji for ARM demo</title>
    <meta name="description" content="Bootstrap Metro Dashboard">
    <meta name="author" content="Dennis Ji">
    <meta name="keyword" content="Metro, Metro UI, Dashboard, Bootstrap, Admin, Template, Theme, Responsive, Fluid, Retina">
    <!-- end: Meta -->

    <!-- start: Mobile Specific -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- end: Mobile Specific -->

    <!-- start: CSS -->
    <link id="bootstrap-style" href="/resources/static/admin/css/bootstrap.min.css" rel="stylesheet">
    <link href="/resources/static/admin/css/bootstrap-responsive.min.css" rel="stylesheet">
    <link id="base-style" href="/resources/static/admin/css/style.css" rel="stylesheet">
    <link id="base-style-responsive" href="/resources/static/admin/css/style-responsive.css" rel="stylesheet">
    <link href='http://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800&subset=latin,cyrillic-ext,latin-ext' rel='stylesheet' type='text/css'>
    <!-- end: CSS -->

</head>
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
        <div id="content" class="span10">


            <ul class="breadcrumb">
                <li>
                    <i class="icon-home"></i>
                    <a href="/admin">Home</a>
                    <i class="icon-angle-right"></i>
                </li>
                <li><a href="#">Tables</a></li>
            </ul>

            <div class="row-fluid sortable">
                <div class="box span12">
                    <div class="box-header" data-original-title>
                        <h2><i class="halflings-icon white user"></i><span class="break"></span>문의사항</h2>
                        <div class="box-icon">
                            <a href="#" class="btn-setting"><i class="halflings-icon white wrench"></i></a>
                            <a href="#" class="btn-minimize"><i class="halflings-icon white chevron-up"></i></a>
                            <a href="#" class="btn-close"><i class="halflings-icon white remove"></i></a>
                        </div>
                    </div>
                    <div class="box-content">
                        <table class="table table-striped table-bordered bootstrap-datatable datatable">
                            <thead>
                            <tr>
                                <th>번호</th>
                                <th style="width: 639px;">제목</th>
                                <th style="width: 236px;">이메일</th>
                                <th>이름</th>
                                <th style="width: 135px;">등록일</th>
                                <th>답변자</th>
                                <th>답변상태</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach var="qnaListVo" items="${qnaListVo}">
                                <tr>
                                    <td>${qnaListVo.num}</td> <!-- 칸문제로 부트스트랩에서 강제정렬시키는중..답변대기가 자꾸 밑으로감 -->
                                    <td class="center"><a href="${path}/admin/qnaListView?num=${qnaListVo.num}">${qnaListVo.subject}</a></td>
                                    <td class="center">${qnaListVo.userEmail}</td>
                                    <td class="center">${qnaListVo.userName}</td>
                                    <td class="center">${qnaListVo.bdRegDate}</td>
                                    <td class="center">${qnaListVo.answerAdmin}</td>
                                    <td class="center">
                                    <c:choose>
                                        <c:when test="${qnaListVo.answerYn eq 'Y'}">답변완료</c:when>
                                        <c:otherwise>답변대기</c:otherwise>
                                    </c:choose>
                                    </td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div><!--/span-->

            </div><!--/row-->




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
        <a href="#" class="btn" data-dismiss="modal">Close</a>
        <a href="#" class="btn btn-primary">Save changes</a>
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

<jsp:include page="common/adminFooter.jsp"/><!--adminFooter.jsp -->

</body>
</html>
