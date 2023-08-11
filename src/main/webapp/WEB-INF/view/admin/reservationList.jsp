<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>

    <meta charset="utf-8">
    <title>Bootstrap Metro Dashboard by Dennis Ji for ARM demo</title>
    <meta name="description" content="Bootstrap Metro Dashboard">
    <meta name="author" content="Dennis Ji">
    <meta name="keyword" content="Metro, Metro UI, Dashboard, Bootstrap, Admin, Template, Theme, Responsive, Fluid, Retina">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link id="bootstrap-style" href="/resources/static/admin/css/bootstrap.min.css" rel="stylesheet">
    <link href="/resources/static/admin/css/bootstrap-responsive.min.css" rel="stylesheet">
    <link id="base-style" href="/resources/static/admin/css/style.css" rel="stylesheet">
    <link id="base-style-responsive" href="/resources/static/admin/css/style-responsive.css" rel="stylesheet">
    <link href='http://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800&subset=latin,cyrillic-ext,latin-ext' rel='stylesheet' type='text/css'>
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>

</head>
<style>
    .box-content table tr th,
    .box-content table tbody tr td {
        text-align: center;
    }
</style>
<script>
    // 무통장입금 - 승인버튼
    function confirm(reservation_no){

        var newForm = $('<form></form>');
        //set attribute (form)
        newForm.attr("name","newForm");
        newForm.attr("method","post");
        newForm.attr("action","/admin/confirmIsY");

        // create element & set attribute (input)
        newForm.append($('<input/>', {type: 'hidden', name: 'confirm_yn', value:'Y' }));
        newForm.append($('<input/>', {type: 'hidden', name: 'reservation_no', value:reservation_no }));

        // append form (to body)
        newForm.appendTo('body');

        // submit form
        newForm.submit();

    }
</script>
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
                                <th>예약번호</th>
                                <th>객실호수</th>
                                <th>이메일</th>
                                <th>이름</th>
                                <th>번호</th>
                                <th>결제금액</th>
                                <th>입실일</th>
                                <th>퇴실일</th>
                                <th>입금확인</th>
                                <th>취소여부</th>
                                <th>환불여부</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach var="reservationVo" items="${reservationVo}">
                                <tr>
                                    <td>${reservationVo.reservation_no}</td>
                                    <td class="center">${reservationVo.room_no}</td>
                                    <td class="center">${reservationVo.userEmail}</td>
                                    <td class="center">${reservationVo.userName}</td>
                                    <td class="center">${reservationVo.hp1}-${reservationVo.hp2}-${reservationVo.hp3}</td>
                                    <td class="center">${reservationVo.pay_total}</td>
                                    <td class="center">${reservationVo.checkin_date}</td>
                                    <td class="center">${reservationVo.checkout_date}</td>
                                    <td class="center div_btn">
                                        <c:choose>
                                            <c:when test="${reservationVo.confirm_yn eq 'Y'}">
                                                <button type="button" class="btn btn-success m-1 btn" style="width:100px" disabled="disabled">완료</button>
                                            </c:when>
                                            <c:otherwise>
                                                <button type="button" class="btn btn-success m-1 btn" style="width:100px; background-color: purple" onclick="confirm('${reservationVo.reservation_no}');">승인</button>
                                            </c:otherwise>
                                        </c:choose>
                                    </td>
                                    <td class="center">${reservationVo.cancel_yn}</td>
                                    <td class="center">${reservationVo.refund_yn}</td>
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
