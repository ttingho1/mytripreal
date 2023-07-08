<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html lang=ko>
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>호텔 - 호앤삐</title>
    <link rel="stylesheet" href="resources/static/css/bootstrap.min.css">
    <link rel="stylesheet" href="resources/static/css/font-awesome.min.css">
    <link rel="stylesheet" href="resources/static/css/prettyPhoto.css">
    <link rel="stylesheet" href="resources/static/css/price-range.css">
    <link rel="stylesheet" href="resources/static/css/animate.css">
    <link rel="stylesheet" href="resources/static/css/main.css">
    <link rel="stylesheet" href="resources/static/css/responsive.css">
    <link rel="stylesheet" href="resources/static/css/font.css">
    <link rel="stylesheet" href="resources/static/css/reset.css">
    <link rel="stylesheet" href="resources/static/css/qnaView.css">
</head>
<body>
<jsp:include page="common/header.jsp"/><!--header.jsp -->
<div class="container">
    <section>
        <div class="tableDefault">
            <table>
                <tbody>
                <tr>
                    <th>제목</th>
                    <td>
                        ${boardVo.subject}
                    </td>
                </tr>
                <tr>
                    <th>등록일</th>
                    <td>${boardVo.bdRegDate}</td>
                </tr>
                <tr>
                    <th>답변상태</th>
                    <td>
                        ${boardVo.answerYn}
                    </td>
                </tr>
                <tr style="height:500px;">
                    <td colspan="2">
                        <div class="boardConentsView">
                            <p style="height: 300px; margin-top: -130px;">
                                ${boardVo.content}
                            </p>
                        </div>
                    </td>
                </tr>
                </tbody>
            </table>
            <div class="btnWrap view text-center clearFix list-all">
                <p class="col-sm-6 text-left text-center-m ">
    <%--            <a href="/customer/customer-info-list.do" class="btn btn-gray2 btn-lg fs15">목록</a>--%>
                    <a href="/qna" class="btn btn-gray2 btn-lg fs15">목록</a>
                </p>
                <p class="col-sm-6 text-right text-center-m mt20xs">

    <%--            <a href="#none" onclick="goItemView('160');" class="btn btn-white btn-lg fs15">&lt; 이전글</a>--%>
                    <a href="#none" class="btn btn-white btn-lg fs15">임시</a>
                </p>
            </div>
        </div>
    </section>
</div>
<jsp:include page="common/footer.jsp"/><!--footer.jsp -->
<script src="resources/static/js/jquery.js"></script>
<script src="resources/static/js/bootstrap.min.js"></script>
<script src="resources/static/js/jquery.scrollUp.min.js"></script>
<script src="resources/static/js/price-range.js"></script>
<script src="resources/static/js/jquery.prettyPhoto.js"></script>
<script src="resources/static/js/main.js"></script>
</body>
</html>