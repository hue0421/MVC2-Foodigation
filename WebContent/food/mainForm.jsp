<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>

<div id="fh5co-work">
	<div class="container">

		<div class="filter-list">
			<ul>
				<li id="category-new" class="select-menu category-class" data-filter="branding" style="font-weight: bold">
					New
				</li>
				<li id="category-popular" class="category-class" data-filter="all" style="font-weight: bold;">
					Popularity
				</li>
				<li id="category-cafe" class="category-class" data-filter="marketing" style="font-weight: bold">
					CAFE
				</li>
				<li id="category-dessert" class="category-class" data-filter="media" style="font-weight: bold">
					DESSERT
				</li>
				<li id="category-bab" class="category-class" data-filter="photography" style="font-weight: bold">
					RESTAURANT
				</li>
				<li id="category-sool" class="category-class" data-filter="web-design" style="font-weight: bold">
					BAR
				</li>
			</ul>
		</div>
		<!-- 메인화면 카테고리 END -->

		<div id="mainContests" class="row">
		
			<c:forEach items="${list }" var="cont" begin="0" end="8" step="1" varStatus="status">
				<div class="col-md-4 text-center animate-box">
					<a class="work" href="viewDetails.do?cno=${cont.cno }">
						<div id="main-con-img" class="work-grid" style="
							<c:if test="${cont.cat eq 'CAFE'}">
								background-image:url(images/ca3.jpg);
							</c:if>	
 							<c:if test="${cont.cat eq 'DESSERT'}">
								background-image:url(images/des4.jpg);
							</c:if>
							<c:if test="${cont.cat eq 'RESTAURANT'}">
								background-image:url(images/res6.jpg);
							</c:if>
							<c:if test="${cont.cat eq 'BAR'}">
								background-image:url(images/so7.jpg);
							</c:if>">
							<div class="inner">
								<div class="desc">
									<h3 id="main-name">${cont.name }</h3>
									<span style="color:black;" id="main-cat" class="cat"> | ${cont.cat } | ${cont.point }점 | </span><br>
									<span style="color:black;" id="main-review" class="cat">${cont.review }</span> <br>
								</div>
							</div>
						</div>
					</a>
				</div>
			</c:forEach>
		</div>
	</div>
</div>

<div id="fh5co-started">
	<div class="container">
		<div class="row animate-box">
			<div class="col-md-8 col-md-offset-2 text-center fh5co-heading">
				<h2>share your review</h2>
				<p>Share your experiences in the store with other users!</p>
				<p>
					<a href="addContentForm.do" class="btn btn-primary">글쓰기</a>
				</p>
			</div>
		</div>
	</div>
</div>
<!-- END -->



<script type="text/javascript">
 	$(".filter-list li").on('click', function() {
		$(".filter-list li").removeClass('select-menu');
		$(this).addClass('select-menu');
	}); 
	/* 카테고리 선택하면 선택된 li에 클래스 추가 */
 	
 	$(".category-class").on('click', function() {
		var element = $(".select-menu");
		var elementID = element.attr('id');
		var query = {
			"dataID" : $(this).attr("id")
		};	
		/* 전송할 데이터 : 선택된 카테고리의 ID(ex-디저트 선택하면 dessert 전송) */
		
		$.ajax({
			type : "post",
			url : "contentsAjax.do",
			async : false,
			data : query,
			dataType : "text",
			success : function(data, textStatus) {
 				var jsonInfo = JSON.parse(data);
 				/* alert(data); */
				<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
				var mainContents="<div class=\"row\">";
					for(var i=0; i<9; i++){
						mainContents+=
							"<div class=\"col-md-4 text-center\">" /* animate-box - 애니메이션 클래스가 안들어감*/
								+"<a class=\"work\" href=\"viewDetails.do?cno="+jsonInfo.contents[i].cno+"\">"
									+"<div id=\"main-con-img"+[i]+"\" class=\"work-grid\">"
										+"<div class=\"inner\">"
											+"<div class=\"desc\">"
	
													+"<h3 id=\"main-name\">"+jsonInfo.contents[i].name+"</h3>"
													+"<span style=\"color:black;\" id=\"main-cat\" class=\"cat\"> | "+jsonInfo.contents[i].cat+" | "+jsonInfo.contents[i].point+"점 | </span><br>"
													+"<span style=\"color:black;\" id=\"main-review\" class=\"cat\">"+jsonInfo.contents[i].review+"</span> <br>"
													
													
												+"</div>"
											+"</div>"
										+"</div>"
									+"</a>"
								+"</div>";
					}	
					mainContents+="</div>";
					$("#mainContests").html(mainContents);

 				switch ($(".select-menu").attr('id')) {
				case $("#category-cafe").attr('id'):
					$("#main-con-img0").css({"background":"url(images/ca1.jpg)", "background-size":"cover"}); 	
					$("#main-con-img1").css({"background":"url(images/ca2.jpg)", "background-size":"cover"}); 	
					$("#main-con-img2").css({"background":"url(images/ca3.jpg)", "background-size":"cover"}); 	
					$("#main-con-img3").css({"background":"url(images/ca4.jpg)", "background-size":"cover"}); 	
					$("#main-con-img4").css({"background":"url(images/ca5.jpg)", "background-size":"cover"}); 	
					$("#main-con-img5").css({"background":"url(images/ca6.jpg)", "background-size":"cover"});
					$("#main-con-img6").css({"background":"url(images/ca7.jpg)", "background-size":"cover"}); 	
					$("#main-con-img7").css({"background":"url(images/ca8.jpg)", "background-size":"cover"}); 	
					$("#main-con-img8").css({"background":"url(images/ca9.jpg)", "background-size":"cover"}); 	
					break;
					
				case $("#category-sool").attr('id'):
					$("#main-con-img0").css({"background":"url(images/so1.jpg)", "background-size":"cover"}); 	
					$("#main-con-img1").css({"background":"url(images/so2.jpg)", "background-size":"cover"}); 	
					$("#main-con-img2").css({"background":"url(images/so3.jpg)", "background-size":"cover"}); 	
					$("#main-con-img3").css({"background":"url(images/so4.jpg)", "background-size":"cover"}); 	
					$("#main-con-img4").css({"background":"url(images/so5.jpg)", "background-size":"cover"}); 	
					$("#main-con-img5").css({"background":"url(images/so6.jpg)", "background-size":"cover"}); 	
					$("#main-con-img6").css({"background":"url(images/so7.jpg)", "background-size":"cover"}); 	
					$("#main-con-img7").css({"background":"url(images/so8.jpg)", "background-size":"cover"}); 	
					$("#main-con-img8").css({"background":"url(images/so9.jpg)", "background-size":"cover"}); 	
					break;
					
				case $("#category-bab").attr('id'):
					$("#main-con-img0").css({"background":"url(images/res1.jpg)", "background-size":"cover"}); 	
					$("#main-con-img1").css({"background":"url(images/res2.jpg)", "background-size":"cover"}); 	
					$("#main-con-img2").css({"background":"url(images/res3.jpg)", "background-size":"cover"}); 	
					$("#main-con-img3").css({"background":"url(images/res4.jpg)", "background-size":"cover"}); 	
					$("#main-con-img4").css({"background":"url(images/res5.jpg)", "background-size":"cover"}); 	
					$("#main-con-img5").css({"background":"url(images/res6.jpg)", "background-size":"cover"}); 	
					$("#main-con-img6").css({"background":"url(images/res7.jpg)", "background-size":"cover"}); 	
					$("#main-con-img7").css({"background":"url(images/res8.jpg)", "background-size":"cover"}); 	
					$("#main-con-img8").css({"background":"url(images/res9.jpg)", "background-size":"cover"}); 	
					
					break;
					
				case $("#category-dessert").attr('id'):
					$("#main-con-img0").css({"background":"url(images/des1.jpg)", "background-size":"cover"}); 	
					$("#main-con-img1").css({"background":"url(images/des2.jpg)", "background-size":"cover"}); 	
					$("#main-con-img2").css({"background":"url(images/des3.jpg)", "background-size":"cover"}); 	
					$("#main-con-img3").css({"background":"url(images/des4.jpg)", "background-size":"cover"}); 	
					$("#main-con-img4").css({"background":"url(images/des5.jpg)", "background-size":"cover"}); 	
					$("#main-con-img5").css({"background":"url(images/des6.jpg)", "background-size":"cover"}); 	
					$("#main-con-img6").css({"background":"url(images/des7.jpg)", "background-size":"cover"}); 	
					$("#main-con-img7").css({"background":"url(images/des8.jpg)", "background-size":"cover"}); 	
					$("#main-con-img8").css({"background":"url(images/des9.jpg)", "background-size":"cover"});
					break;
				default:
					$("#main-con-img0").css({"background":"url(images/des1.jpg)", "background-size":"cover"}); 	
					$("#main-con-img1").css({"background":"url(images/ca2.jpg)", "background-size":"cover"}); 	
					$("#main-con-img2").css({"background":"url(images/so3.jpg)", "background-size":"cover"}); 	
					$("#main-con-img3").css({"background":"url(images/res4.jpg)", "background-size":"cover"}); 	
					$("#main-con-img4").css({"background":"url(images/des5.jpg)", "background-size":"cover"}); 	
					$("#main-con-img5").css({"background":"url(images/ca6.jpg)", "background-size":"cover"}); 	
					$("#main-con-img6").css({"background":"url(images/so7.jpg)", "background-size":"cover"}); 	
					$("#main-con-img7").css({"background":"url(images/res8.jpg)", "background-size":"cover"}); 	
					$("#main-con-img8").css({"background":"url(images/des9.jpg)", "background-size":"cover"});
					break;
				}
			},
			error : function(data, textStatus) {
				alert("system error")
			},
			complete : function(data, textStatus) {
			}
		});
	}); 
		 
</script>
<!-- js END -->



<%@ include file="../include/footer.jsp"%>