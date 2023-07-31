<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="resources/static/css/bootstrap.min.css">
    <title>Insert title here</title>
    <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
</head>
<body>
<br>
<div class="container">
    <div class="form-group row pull-right">
        <div class="col-xs-8">
            <input class="form-control" type="text" size="20">
        </div>
        <div class="col-xs-2">
            <button class="btn btn-primary" type="button">검색</button>
        </div>
    </div>
    <table class="table" style="text-align: center; border: 1px solid #dddddd;">
        <thead>
            <tr>
                <th style="background-color: #fafafa; text-align: center;">이름</th>
                <th style="background-color: #fafafa; text-align: center;">나이</th>
                <th style="background-color: #fafafa; text-align: center;">성별</th>
                <th style="background-color: #fafafa; text-align: center;">이메일</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="userVo" items="${userVo}">
                <tr>
                    <td>${userVo.userName}</td>
                    <td>${userVo.userAge}</td>
                    <td>${userVo.userGender}</td>
                    <td>${userVo.userEmail}</td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</div>
</body>
</html>