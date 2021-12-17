<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="error.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="fontawesome/css/all.min.css">
    <link rel="stylesheet" href="css/templatemo-style.css">
    <title>빛, 그리고 그리다</title>
    <style>
    button{
    	font-size: 1px;
    }
  #box1{
  	text-align: center;
  }
        body, ul, li {
            padding:0; 
            margin:0;
        } 
        #top {
            width:100%
        }
        #top li {
            width:40%; 
            display:inline-block;
            *display:inline;
            *zoom:1;
        }
        .input {
        paddin: 0;
        margin: 0;
            width: 100%;
            height : 100%;
            position: absolute;
        } 
        #wrap {
			display: flex;
            margin:0 auto; 
        }
        form {
         	 font-size: 20px;
         	 margin: 0px auto;
        }
         hr {
            margin: auto;
            margin-top: 20px;
            margin-bottom: 20px;
            width: 45%;
            color: white;
            height: 3px;
        }
    </style>
</head>
<body>

<!-- Page Loader -->
    <div id="loader-wrapper">
        <div id="loader"></div>

        <div class="loader-section section-left"></div>
        <div class="loader-section section-right"></div>

    </div>
    
  <nav class="navbar navbar-expand-lg">
        <div class="container-fluid">
            <a class="navbar-brand" href="index.do">
                <i class="fas fa-film mr-2"></i>
                빛, 그리고 그리다
            </a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
                aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <i class="fas fa-bars"></i>
            </button>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav ml-auto mb-2 mb-lg-0">
                    <li class="nav-item">
                        <a class="nav-link nav-link-1 "  href="index.do">Photos</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link nav-link-2" href="uploadForm.do">Upload</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link nav-link-3" href="myPageUpload.do?myPageNum=1">My page</a>
                    </li>
                    <li class="nav-item">
                    	<c:if test="${id==null }">
                        	<a class="nav-link nav-link-4 active" href="loginForm.do">Login</a>
                        </c:if>
                        <c:if test="${id!=null }">
                        	<a class="nav-link nav-link-4 active" href="loginForm.jsp">Log out</a>
                        </c:if>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
	  <div class="tm-hero d-flex justify-content-center align-items-center" data-parallax="scroll" data-image-src="img/hero.jpg">
        
    </div>
    <!-- 추후에 <br>대신에 마진바텀으로 공간을 넣어주세요 -->
    <br><br><br>
    <form action="loginPro.do" method="post" >    
        	<div style="text-align: center;"><h2>로그인</h2></div><br>
   
    
      <div style="justify-content: center; display: flex;">
      	 
        	 <input type="text" name="id" class="form-control tm-search-input" style="border: #00B8B8 solid 3px;" placeholder="아이디" required="required">
         
      </div>        
      <hr>
      <div style="justify-content: center; display: flex;">
      	 
        	 <input type="password" name="passwd" class="form-control tm-search-input" style="border: #00B8B8 solid 3px;" placeholder="비밀번호" required="required">
         
      </div>        
            <hr>
            <div id="box1">
                <input type="submit" class="btn btn-primary" value="로그인" style="WIDTH: 306pt; HEIGHT: 25pt; padding:0;" >
            </div>
            <br>
             <div id="box2" style="text-align: center;">
                <span style="width: 100px;">
                    <button class="btn btn-primary" type="button" style="font-size:15px; WIDTH: 100pt; HEIGHT: 25pt; padding: 0;" onclick="location.href='joinForm.do'">회원가입</button>
                </span>
                <span>
                    <button class="btn btn-primary" type="button" style="font-size:15px; WIDTH: 100pt; HEIGHT: 25pt; padding: 0;" onclick="location.href='idFindForm.do'">아이디 찾기</button>
                </span>
                <span>
                    <button class="btn btn-primary" type="button" style="font-size:15px; WIDTH: 100pt; HEIGHT: 25pt; padding: 0;" onclick="location.href='pwFindForm.do'">비밀번호 찾기</button>
                </span>
            </div>
        
    </form>
    <br><br><br>
     <footer class="tm-bg-gray pt-5 pb-3 tm-text-gray tm-footer">
        <div class="container-fluid tm-container-small">
            <div class="row">
                <div class="col-lg-6 col-md-12 col-12 px-5 mb-5">
                    <h3 class="tm-text-primary mb-4 tm-footer-title">빛, 그리고 그리다</h3>
                    <p>빛 그리고 그리다는 저작권이 없는 사진을 공유하는<br>활발한 사이트입니다.</p>
             	 	<p>모든 콘텐츠는 예술가에게 허가나 신용을 제공하지 않고 <br>안전하게 사용할 수 있습니다. </p>
               		<p>가입 후 사진을 무료로 다운로드하고 <br>당신의 사진을 사람들과 공유해보세요.</p>
                </div>
                <div class="col-lg-3 col-md-6 col-sm-6 col-12 px-5 mb-5">
                    <h3 class="tm-text-primary mb-4 tm-footer-title">Contact</h3>
                    <p>abc@abc.com</p>
                </div>
            </div>
        </div>
    </footer>
	<script src="js/plugins.js"></script>
    <script>
        $(window).on("load", function () {
            $('body').addClass('loaded');
        });
    </script>
    
</body>
</html>