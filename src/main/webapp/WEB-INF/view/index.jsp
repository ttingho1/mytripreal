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
    <link rel="stylesheet" href="resources/static/css/prettyPhoto.css">
    <link rel="stylesheet" href="resources/static/css/price-range.css">
    <link rel="stylesheet" href="resources/static/css/animate.css">
    <link rel="stylesheet" href="resources/static/css/main.css">
    <link rel="stylesheet" href="resources/static/css/responsive.css">
    <link rel="stylesheet" href="resources/static/css/font.css">
    <link rel="stylesheet" href="resources/static/css/reset.css">
    <link rel="stylesheet" href="resources/static/css/font-awesome.min.css">
</head>
<body>
<jsp:include page="common/header.jsp"/><!--header.jsp -->
<section id="slider"><!--slider-->
    <div class="container">
        <div class="row">
            <div class="col-sm-12">
                <div id="slider-carousel" class="carousel slide" data-ride="carousel">
                    <ol class="carousel-indicators">
                        <li data-target="#slider-carousel" data-slide-to="0" class="active"></li>
                        <li data-target="#slider-carousel" data-slide-to="1"></li>
                        <li data-target="#slider-carousel" data-slide-to="2"></li>
                        <li data-target="#slider-carousel" data-slide-to="3"></li>
                    </ol>

                    <div class="carousel-inner">
                        <div class="item active">
                            <div class="col-sm-6">
                                <h1><span>최고</span>의 호텔</h1>
                                <h2>호텔 호앤삐 - 전경</h2>
                                <p>한국에서 일본식 호텔을 즐겨보세요</p>

                            </div>
                            <div class="col-sm-6">
                                <img src="resources/static/images/slide/slide1.png" class="girl img-responsive" alt="" />
                            </div>
                        </div>
                        <div class="item">
                            <div class="col-sm-6">
                                <h1><span>모두</span>의 호텔</h1>
                                <h2>호텔 호앤삐 - 내부</h2>
                                <p>한국에서 일본식 호텔을 즐겨보세요</p>
                            </div>
                            <div class="col-sm-6">
                                <img src="resources/static/images/slide/slide2.png" class="girl img-responsive" alt="" />
                            </div>
                        </div>

                        <div class="item">
                            <div class="col-sm-6">
                                <h1>호슐랭<span>5성급</span>호텔</h1>
                                <h2>호텔 호앤삐 - 주차장</h2>
                                <p>한국에서 일본식 호텔을 즐겨보세요</p>

                            </div>
                            <div class="col-sm-6">
                                <img src="resources/static/images/slide/slide3.png" class="girl img-responsive" alt="" />
                            </div>
                        </div>
                        <div class="item">
                            <div class="col-sm-6">
                                <h1><span>VIP</span>호텔</h1>
                                <h2>호텔 호앤삐</h2>
                                <p>한국에서 일본식 호텔을 즐겨보세요</p>
                            </div>
                            <div class="col-sm-6">
                                <img src="resources/static/images/slide/slide4.png" class="girl img-responsive" alt="" />
                            </div>
                        </div>
                    </div>

                    <a href="#slider-carousel" class="left control-carousel hidden-xs" data-slide="prev">
                        <i class="fa fa-angle-left"></i>
                    </a>
                    <a href="#slider-carousel" class="right control-carousel hidden-xs" data-slide="next">
                        <i class="fa fa-angle-right"></i>
                    </a>
                </div>
            </div>
        </div>
    </div>
</section><!--/slider-->

<section>
    <div class="container">
        <div class="row">
            <div class="col-sm-9 padding-right">
                <div class="features_items"><!--features_items-->
                    <h2 class="title text-center">객실미리보기</h2>
                    <div class="col-sm-4">
                        <div class="product-image-wrapper">
                            <div class="single-products">
                                <div class="productinfo text-center">
                                    <img src="resources/static/images/room/index1_1.jpg" width="350" height="327" alt="" />
                                    <h3>스이란의 방</h3>
                                    <p>Easy Polo Black Edition</p>
                                    <a href="#none" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>객실예약하기</a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-4">
                        <div class="product-image-wrapper">
                            <div class="single-products">
                                <div class="productinfo text-center">
                                    <img src="resources/static/images/room/index2_1.jpg" width="350" height="327" alt="" />
                                    <h3>퀸테사의 방</h3>
                                    <p>Easy Polo Black Edition</p>
                                    <a href="#none" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>객실예약하기</a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-4">
                        <div class="product-image-wrapper">
                            <div class="single-products">
                                <div class="productinfo text-center">
                                    <img src="resources/static/images/room/index3_1.jpg" width="350" height="327" alt="" />
                                    <h3>니코의 방</h3>
                                    <p>Easy Polo Black Edition</p>
                                    <a href="#none" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>객실예약하기</a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-4">
                        <div class="product-image-wrapper">
                            <div class="single-products">
                                <div class="productinfo text-center">
                                    <img src="resources/static/images/room/index4_1.jpg" width="350" height="327" alt="" />
                                    <h3>하얏트의 방</h3>
                                    <p>Easy Polo Black Edition</p>
                                    <a href="#none" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>객실예약하기</a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-4">
                        <div class="product-image-wrapper">
                            <div class="single-products">
                                <div class="productinfo text-center">
                                    <img src="resources/static/images/room/index5_1.jpg" width="350" height="327" alt="" />
                                    <h3>카가야의 방</h3>
                                    <p>Easy Polo Black Edition</p>
                                    <a href="#none" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>객실예약하기</a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-4">
                        <div class="product-image-wrapper">
                            <div class="single-products">
                                <div class="productinfo text-center">
                                    <img src="resources/static/images/room/index6_1.jpg" width="350" height="327" alt="" />
                                    <h3>후지야의 방</h3>
                                    <p>Easy Polo Black Edition</p>
                                    <a href="#none" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>객실예약하기</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div><!--features_items-->
                <div class="recommended_items"><!--recommended_items-->
                    <h2 class="title text-center">호앤삐만의 혜택!</h2>
                    <div id="recommended-item-carousel" class="carousel slide" data-ride="carousel">
                        <div class="carousel-inner">
                            <div class="item active">
                                <div class="col-sm-4">
                                    <div class="product-image-wrapper">
                                        <div class="single-products">
                                            <div class="productinfo text-center">
                                                <img src="resources/static/images/benefit1.jpg" width="350" height="176" alt="" />
                                                <h3>공요공간</h3>
                                                <p>공용공간에서 이야기를 즐겨요!</p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-sm-4">
                                    <div class="product-image-wrapper">
                                        <div class="single-products">
                                            <div class="productinfo text-center">
                                                <img src="resources/static/images/benefit2.jpg" width="350" height="176" alt="" />
                                                <h3>와이파이 무료혜택</h3>
                                                <p>호앤삐 언제,어디서든 LTE속도로 즐기세요!</p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-sm-4">
                                    <div class="product-image-wrapper">
                                        <div class="single-products">
                                            <div class="productinfo text-center">
                                                <img src="resources/static/images/benefit3.jpg" width="350" height="176" alt="" />
                                                <h3>키즈카페</h3>
                                                <p>아이와 함께 즐기세요!</p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="item">
                                <div class="col-sm-4">
                                    <div class="product-image-wrapper">
                                        <div class="single-products">
                                            <div class="productinfo text-center">
                                                <img src="resources/static/images/benefit4.jpg" width="350" height="176" alt="" />
                                                <h3>오색온천</h3>
                                                <p>심신을 달래고 피부노화방지에 특효!</p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-sm-4">
                                    <div class="product-image-wrapper">
                                        <div class="single-products">
                                            <div class="productinfo text-center">
                                                <img src="resources/static/images/benefit5.jpg" width="350" height="176" alt="" />
                                                <h3>동래온천</h3>
                                                <p>피부의 결을 다듬고 독소배출에 특효!</p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-sm-4">
                                    <div class="product-image-wrapper">
                                        <div class="single-products">
                                            <div class="productinfo text-center">
                                                <img src="resources/static/images/benefit6.jpg" width="350" height="176" alt="" />
                                                <h3>등억온천</h3>
                                                <p>양기를 가득채워주는데 특효!</p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <a class="left recommended-item-control" href="#recommended-item-carousel" data-slide="prev">
                            <i class="fa fa-angle-left"></i>
                        </a>
                        <a class="right recommended-item-control" href="#recommended-item-carousel" data-slide="next">
                            <i class="fa fa-angle-right"></i>
                        </a>
                    </div>
                </div><!--/recommended_items-->
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