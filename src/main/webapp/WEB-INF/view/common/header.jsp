<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<header id="header"><!--header-->
    <div class="header_top"><!--header_top-->
        <div class="container">
            <div class="row">
                <div class="col-sm-6">
                    <div class="contactinfo">
                        <ul class="nav nav-pills">
                            <span id="nopf">본 포트폴리오는 상업용이 아닙니다.</span>
                            <style>
                                #nopf{
                                    height: 30px;
                                    line-height: 30px;
                                }
                            </style>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div><!--/header_top-->
    <div class="header-middle"><!--header-middle-->
        <div class="container">
            <div class="row">
                <div class="col-sm-4">
                    <div class="logo pull-left">
<%--                        <a href="index"><img src="https://via.placeholder.com/139x39" alt="logo" /></a>--%>
                    </div>
                </div>
                <div class="col-sm-8">
                    <div class="navbar-header">
                        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                            <span class="sr-only">Toggle navigation</span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                        </button>
                    </div>
                    <div class="shop-menu pull-right mainmenu">
                        <ul class="nav navbar-nav collapse navbar-collapse">
                            <c:if test="${sessionScope.userEmail eq null}">
                                <li><a href="sign"><i class="fa fa-user"></i> 회원가입</a></li>
                                <li><a href="login"><i class="fa fa-lock"></i>로그인</a></li>
                            </c:if>
                            <c:if test="${sessionScope.userEmail ne null}">
                                <li><a href="myPage"><i class="fa fa-lock"></i>마이페이지</a></li>
                                <li><a href="logout"><i class="fa fa-user"></i>${sessionScope.userName}님 로그아웃</a></li>
                            </c:if>
                            <c:if test="${sessionScope.adminYn eq 'Y'}">
                                <li><a href="/admin/"><i class="fa fa-user"></i>관리자페이지</a></li>
                            </c:if>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div><!--/header-middle-->
</header><!--/header-->