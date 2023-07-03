<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
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
	<link rel="stylesheet" href="resources/static/css/table.css">
</head>
<body>
<jsp:include page="common/header.jsp"/><!--header.jsp -->
	<div id="contact-page" class="container">
    	<div class="bg">   	
    		<div class="row" style="margin-top:70px; margin-bottom:100px;">
				<div class="col-sm-4">
	    			<div class="contact-info">
	    				<h2 class="title text-center">프로필관리</h2>
	    				<ul style="border:1px solid #c2bfb9; height:290px; padding:40px 50px 50px 50px; text-align:center;">
							<div class="my_list">
								<a href="myPage">프로필관리</a>
							</div>
							<div class="my_list">
								<a href="qna">1:1문의사항</a>
							</div>
						</ul>
						<style>
							.my_list {
								line-height: 50px;
							}
						</style>
	    			</div>
    			</div>   	
	    		<div class="col-sm-8">
	    			<div class="contact-form">
	    				<h2 class="title text-center">내정보</h2>
	    				<div class="status alert alert-success" style="display: none"></div>
				    	<form id="main-contact-form" class="contact-form row" name="contact-form" method="post">
				            <div class="form-group col-md-12">
				                <input type="text" name="name" class="form-control" readonly value="${sessionScope.userName}">
				            </div>
				            <div class="form-group col-md-12">
				                <input type="email" name="email" class="form-control" readonly value="${sessionScope.userEmail}">
				            </div>
				            <div class="form-group col-md-12">
                                <a href="userUpdateConfirm" class="btn btn-primary pull-right">정보수정</a>
				            </div>
				        </form>
	    			</div>
	    		</div>
  			
	    	</div>  
    	</div>	
    </div><!--/#contact-page-->
	<section>
		<div class="container">
			<div class="row">
				<div class="col-sm-9 padding-right">
					<div class="features_items"><!--features_items-->
						<h2 class="title text-center">나의예약내역</h2>
						<table>
							<thead>
							  <tr>
								<th>번호</th>
								<th>제목</th>
								<th>작성자</th>
							  </tr>
							</thead>
							<tbody>
							  <tr>
								<td>1</td>
								<td>Joakim Noah</td>
								<td>C</td>
							  </tr>
							  <tr>
								<td>2</td>
								<td>Vladimir Radmanovic</td>
								<td>F</td>
							  </tr>
							  <tr>
								<td>3</td>
								<td>Nate Robinson</td>
								<td>G</td>
							  </tr>
							  <tr>
								<td>4</td>
								<td>Derrick Rose</td>
								<td>G</td>
							  </tr>
							  <tr>
								<td>5</td>
								<td>Marquis Teague</td>
								<td>G</td>
							  </tr>
							</tbody>
						  </table>
					</div><!--features_items-->
				</div>
			</div>
		</div>
	</section>
<jsp:include page="common/footer.jsp"/><!--footer.jsp -->
<script src="resources/static/js/jquery.js"></script>
<script src="resources/static/js/bootstrap.min.js"></script>
<script src="resources/static/js/jquery.scrollUp.min.js"></script>
<script src="resources/static/js/price-range.js"></script>
<script src="resources/static/js/jquery.prettyPhoto.js"></script>
<script src="resources/static/js/main.js"></script>
</body>
</html>