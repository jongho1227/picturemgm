<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	p{
		text-align: right;
	}
	a{
		text-decoration: none;
	}
	#container{
		width:1500px;
		margin:30px auto;
		overflow: hidden;
		border:1px solid black;
	}
	.picture{
		width:300px;
		margin-left:100px;
		margin-bottom:20px;
		float: left;
		position: relative;
		white-space: nowrap;
		overflow: hidden;
		text-overflow: ellipsis;
	}
	.upload{
		overflow: hidden;
		margin-bottom:20px;
	}
	.cancel{
		position: absolute;
		top : 60px;
		right: 0;
	}
	.uploadDate, .uploadName{
		text-align: left;
		margin:10px 0;
		white-space: nowrap;
		overflow: hidden;
		text-overflow: ellipsis;
	}
	.img{
		cursor: pointer;
	}
	#bigImg{
		border:1px solid black;
		position:relative;
		position: absolute;
		top:150px;
		left:600px;
		display: none;
		background: black;
	}
	#bigImg span{
		position: absolute;
		top:0;
		font-size:20px;
		right:5px;
		color:white;
		cursor: pointer;
	}           
	#bigImg img{
		margin:20px;
		width:600px;
		height:400px;
	}
	.pagination{
		list-style: none;
		overflow: hidden;
		clear: both;
		width:250px;
		margin:20px auto;
		padding:0;
	}
	.pagination li{
		float: left;
		width:20px;
		text-align:center;
		border: 1px solid black;
		background: white;
	}
	.pagination li a{
		font-weight: normal;
		color:black;
	}
	.active{
		background: black !important;
		
	}
	.active a{
		font-weight: bold !important;
		color:white !important;
	}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script type="text/javascript">
	/* $(function(){
		$(".cancel").click(function(){
		var a = confirm("삭제하시겠습니까?");
			if(a==false){
				return false;
			}
		}) */
		
		$(document).on("click",".img",function(){
			$("#bigImg").find("img").remove();
			$("#bigImg").css("display","inline");
			var $img = $("<img>");
			var ori = $(this).attr("data-origin");
			$img.attr("src", "displayFile?filename="+ori);
			$("#bigImg").append($img);
		})
		$(document).on("click","#close",function(){
			$("#bigImg").css("display","none");
		})
		
	})
</script>
</head>
<body>

	<div id="container">
		<p>[${AUTH }]님 로그인하셨습니다. <a href="logout">[로그아웃]</a> </p>
		<p><a href="upload">[사진업로드]</a></p>
		
		<c:forEach var="list" items="${list }">
			<div class="picture">
				<div class="upload">
					<p class="uploadDate"><b>업로드 날짜</b> : <fmt:formatDate value="${list.regdate }" pattern="yyyy년 MM월 dd일"/></p>
					<p class="uploadName"><b>파일명</b> : ${list.originFileName }</p>
				</div>
				<img src="displayFile?filename=${list.file }" class="img" data-origin="${list.originFile }">         
				<a href="delete?no=${list.no }&file=${list.file }" class="cancel">X</a>
			</div>
		</c:forEach>
		
		<ul class="pagination">
			<c:if test="${page.prev }">
				<li><a href="List?page=${page.startPage-10 }"> &laquo; </a></li>
			</c:if>
			<c:forEach  var="idx" begin="${page.startPage }" end="${page.endPage }">
				<li ${page.cri.page == idx ? 'class="active"' : '' }><a href="${pageContext.request.contextPath }/List?page=${idx }">${idx }</a></li>
			</c:forEach>
			<c:if test="${page.next }">
				<li><a href="List?page=${page.endPage+1 }"> &raquo; </a></li>
			</c:if>
		</ul>
	</div>
	<div id="bigImg">
		<span id="close"><b>X</b></span>
	</div>
</body>
</html>




