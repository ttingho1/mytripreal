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
<style>
    textarea {
        resize : none;
    }
    .tableDefault > table {
        width: 100%;
        border-top: 1px solid #111 !important;
    }
    table {
        background-color: transparent;
    }

    table {
        border-spacing: 0;
        border-collapse: collapse;
    }

    .tableDefault > table > tbody > tr > th:first-child, .tableDefault > table > tbody > tr > td:first-child {
        border-left: 0;
    }

    .tableDefault > table > tbody > tr > th {
        background: #f8f8f8;
        color: #444444;
        font-weight: bold;
        font-size: 15px;
        text-align: center;
        width: 200px;
    }

    .tableDefault > table > tbody > tr > td, .tableDefault > table > tbody > tr > th {
        padding: 7px 25px;
        vertical-align: middle;
        border-bottom: 1px solid #ddd;
        border-left: 1px solid #ddd;
        height: 45px;
    }
    .tableDefault > table > tbody > tr > td {
        font-size: 14px;
    }

    .tableDefault > table > tbody > tr > td, .tableDefault > table > tbody > tr > th {
        padding: 7px 25px;
        vertical-align: middle;
        border-bottom: 1px solid #ddd;
        border-left: 1px solid #ddd;
        height: 45px;
    }
    .btnWrap {
        margin: 20px 0;
    }
    .text-center {
        text-align: center !important;
    }

    .btnWrap.view .btn {
        width: 100px;
    }

    .btn.btn-gray2 {
        background: #afafaf;
        color: #fff;
        border: 1px solid #afafaf;
    }
    .fs15 {
        font-size: 15px;
    }
    .btn-lg, .btn-group-lg > .btn {
        padding: 10px 16px;
        font-size: 18px;
        line-height: 1.3333333;
    }
    .btn {
        display: inline-block;
        padding: 6px 12px;
        margin-bottom: 0;
        font-size: 14px;
        font-weight: normal;
        line-height: 1.42857143;
        text-align: center;
        white-space: nowrap;
        vertical-align: middle;
        -ms-touch-action: manipulation;
        touch-action: manipulation;
        cursor: pointer;
        -webkit-user-select: none;
        -moz-user-select: none;
        -ms-user-select: none;
        user-select: none;
        background-image: none;
        border: 1px solid transparent;
    }
    .btn.btn-white {
        background: none;
        border: 1px solid #999;
        color: #666;
    }

    .list-all {
        display: flex;
        justify-content: center;
    }

    @media (min-width: 640px){
        .col-sm-1, .col-sm-2, .col-sm-3, .col-sm-4, .col-sm-5, .col-sm-6, .col-sm-7, .col-sm-8, .col-sm-9, .col-sm-10, .col-sm-11, .col-sm-12 {
            float: left;
        }
        .col-sm-6 {
            width: 50%;
        }
    }
</style>

<body>
<jsp:include page="common/adminHeader.jsp"/><!--adminHeader.jsp -->

<div class="container-fluid-full">
    <div class="row-fluid">

        <!-- start: Main Menu -->
        <div id="sidebar-left" class="span2">
            <div class="nav-collapse sidebar-nav">
                <ul class="nav nav-tabs nav-stacked main-menu">
                    <li><a href="/admin"><i class="icon-bar-chart"></i><span class="hidden-tablet"> 대시보드</span></a></li>
                    <li><a href="/admin/memberList"><i class="icon-bar-chart"></i><span class="hidden-tablet"> 회원관리 </span></a></li>
                    <li><a href="/admin/qnaList"><i class="icon-bar-chart"></i><span class="hidden-tablet"> 문의관리 </span></a></li>
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
                        <section>
                            <div class="tableDefault">
                                <table>
                                    <tbody>
                                    <tr>
                                        <th>제목</th>
                                        <td>
                                            ${qnaListVo.subject}
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>등록일</th>
                                        <td>${qnaListVo.bdRegDate}</td>
                                    </tr>
                                    <tr>
                                        <th>답변상태</th>
                                        <td>
                                            <c:choose>
                                                <c:when test="${qnaListVo.answerYn eq 'Y'}">답변완료</c:when>
                                                <c:otherwise>답변대기</c:otherwise>
                                            </c:choose>
                                        </td>
                                    </tr>
                                    <tr style="height:500px;">
                                        <td colspan="2">
                                            <div class="boardConentsView">
                                                <p style="height: 300px; margin-top: -130px;">
                                                    <textarea name="question" id="question" cols="30" rows="10" style="width: 100%;">${qnaListVo.content}</textarea>
                                                    <textarea name="contentAnswer" form="formTest" cols="30" rows="10" style="width: 100%;">${qnaListVo.contentAnswer}</textarea>
                                                </p>
                                            </div>
                                        </td>
                                    </tr>
                                    </tbody>
                                </table>
                                <div class="btnWrap view text-center clearFix list-all">
                                    <p class="col-sm-6 text-left text-center-m ">
<%--                                        <a href="/qna" class="btn btn-gray2 btn-lg fs15">목록</a>--%>
                                    </p>
                                    <p class="col-sm-6 text-right text-center-m mt20xs">
                                    <form id="formTest" action="/admin/qnaAnswer" method="post">
                                        <input type="hidden" id="num" name="num" value="${qnaListVo.num}">
                                        <input type="hidden" name="contentAnswer" id="contentAnswer" value="${qnaListVo.contentAnswer}">
                                        <input type="hidden" id="answerAdmin" name="answerAdmin" value="${sessionScope.userName}">
                                        <input type="submit" class="btn btn-white btn-lg fs15" value="답변등록">
                                    </form>
<%--                                        <a href="#none" class="btn btn-white btn-lg fs15">답변등록</a>--%>
                                    </p>
                                </div>
                            </div>
                        </section>
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
