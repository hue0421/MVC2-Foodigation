<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>

<div class="col-md-4"></div>

<div class="col-md-4">
	<br> <br> <br> <br>
	<!-- <form action="addcontent.do" method="post"> -->
	<form method="post" name="form" enctype="multipart/form-data">
		<h3>
			<label>후기등록</label>
			<c:choose>
 				<c:when test="${empty session_point }">
					<input type="text" name="point" id="point" style="visibility: hidden;">
				</c:when>
				<c:otherwise>
					<input type="text" name="point" id="point" value="${session_point}" style="visibility: hidden;">
				</c:otherwise>
			</c:choose>
		</h3>
		<div class="row form-group">
			<div class="col-md-12">
				<div class="col-md-3">
					<label>만족도</label>
				</div>
				<div class="col-md-9">
					<div class="starRev">
						<a id="star-a1" href="#" class="starR on">☆</a> <a id="star-a2"
							href="#">☆</a> <a id="star-a3" href="#">☆</a> <a id="star-a4"
							href="#">☆</a> <a id="star-a5" href="#">☆</a>
						<!-- <span id="point" style="visibility: hidden;"></span> -->
					</div>
				</div>
			</div>
			<div class="col-md-12">
				<div class="col-md-3">
					<label id="cat-id">카테고리</label>
				</div>
				<div class="col-md-9">
					<div class="category">
						<a id="cat-cafe" href="#">CAFE&nbsp;</a> 
						<a id="cat-dessert" href="#">DESSERT&nbsp;</a> 
						<a id="cat-bob" href="#">RESTAURANT&nbsp;</a>
						<a id="cat-sool" href="#">BAR&nbsp;</a>
					</div>
				</div>
			</div>
		</div>
		<hr>
		<div class="row form-group">
			<div class="row form-group">
				<div class="col-md-12">
					<label for="name">제목</label> 
					<c:choose>
 						<c:when test="${empty session_name }">
							<input type="text" name="name" id="name" class="form-control">
 						</c:when>
						<c:otherwise>
							<input type="text" name="name" id="name" value="${session_name}" class="form-control">
						</c:otherwise>
					</c:choose>
				</div>
			</div>
			<br>
			<div class="row form-group">
				<div class="col-md-12">
					<label for="name">방문가게 이름</label> 
					<c:choose>
 						<c:when test="${empty session_store_name }">
							<input type="text" name="store_name" id="store_name" class="form-control"> 						</c:when>
						<c:otherwise>
							<input type="text" name="store_name" id="store_name" value="${session_store_name}" class="form-control">
						</c:otherwise>
					</c:choose>
				</div>
			</div>
			<br>
			<div class="row form-group">
				<div class="col-md-12">
					<label for="message">내용</label>
					<c:choose>
 						<c:when test="${empty session_review }">
							<textarea name="review" id="review" cols="30" rows="10" class="form-control"></textarea>
						</c:when>
						<c:otherwise>
							<textarea name="review" id="review" cols="30" rows="10" class="form-control">${session_review}
							</textarea>
						</c:otherwise>
					</c:choose>
				</div>
			</div>
			<c:choose>
 				<c:when test="${empty session_cat }">
					<input type="text" name="cat" id="cat" style="visibility: hidden;">
				</c:when>
				<c:otherwise>
					<input type="text" name="cat" id="cat" value="${session_cat}" style="visibility: hidden;">
				</c:otherwise>
			</c:choose>
			<br>
			<!-- visibel -->
			<hr>
			<br> <br>
			<div class="col-md-6 col-sm-6">
				<div class="feature-center animate-box" data-animate-effect="fadeIn">
					<span class="icon"> <i class="icon-briefcase"></i>
					</span>
					<h3>MAP</h3>
					<c:choose>
						<c:when test="${empty where }">
							<p>다른 사람들이 찾아갈 수 있도록 위치를 알려주세요</p>
						</c:when>
						<c:otherwise>
							<p>${where }</p>
						</c:otherwise>
					</c:choose>
				</div>
			</div>
			<div class="col-md-6 col-sm-6">
				<div class="feature-center animate-box" data-animate-effect="fadeIn">
					<span class="icon"> <i class="icon-camera"></i>
					</span>
					<h3>Photo</h3>
					<p>다른 사람들에게 방문해서 찍은 사진을 공유해주세요</p>
				</div>
			</div>
			<div class="col-md-6 col-sm-6">
				<p>
					<a href="mapAddForm.do" id="btnMapAdd" class="btn btn-primary btn-outline">위치 등록하기</a>
					<!-- <input type="submit" value="위치 등록하기" class="btn btn-primary btn-outline"> -->
				</p>
			</div>
			<div class="col-md-6 col-sm-6">
				<p>
					<a id="aTagFile"href="" class="btn btn-primary btn-outline">사진 등록하기</a>
					<input type=file id="filename" name="filename" class="btn btn-primary btn-outline" style="visibility: hidden;">
				</p>
			</div>
		</div>
		<hr>
		<br> <br>
		<div class="col-md-3"></div>
		<div class="form-group">
			<input type="submit" value="등록하기" id="memberJoin" class="btn btn-primary" onclick="javascript: form.action='addcontent.do';">
			<input type="submit" value="미리보기" id="btn-view" class="btn btn-primary" onclick="javascript: form.action='preview.do';">
		</div>
		<input type="text" value="${where }" name="map" id="map" style="visibility: hidden;">
		<br> <br> <br> <br>
	</form>
</div>
<div class="col-md-4"></div>

<script type="text/javascript">
	$('#aTagFile').click(function(){
		$('#filename').trigger('click');
		return false;
	})

	$('.starRev a').click(function() {
		$(this).parent().children('a').removeClass('on');
		$(this).parent().children('a').html('☆');
		$(this).addClass('on').prevAll('a').addClass('on');
		$(this).html('★').prevAll('a').html('★');

		var $point = 0;

		if ($('#star-a1').hasClass('on')) {
			$point++;
		}
		if ($('#star-a2').hasClass('on')) {
			$point++;
		}
		if ($('#star-a3').hasClass('on')) {
			$point++;
		}
		if ($('#star-a4').hasClass('on')) {
			$point++;
		}
		if ($('#star-a5').hasClass('on')) {
			$point++;
		}
		$('#point').val($point);
		//$('#point').html(3);
		return false;
	});
</script>


<script type="text/javascript">
	$('.category a').click(function() {
		$('#cat-id').html($(this).html());
		$('#cat').val($('#cat-id').html());
		return false;
	});
	
	$("#btnMapAdd").on('click', function() {
		
		var query = {
			"name" : $("#name").val(),
			"point" : $("#point").val(),
			"store_name" : $("#store_name").val(),
			"review" : $("#review").val(),
			"cat" : $("#cat").val()
		};	
		/* 전송할 데이터 : 선택된 카테고리의 ID(ex-디저트 선택하면 dessert 전송) */
		
		$.ajax({
			type : "post",
			url : "mapAddAjax.do",
			async : true,
			data : query,
			dataType : "text",
			success : function(data, textStatus) {
				
			},
			error : function(data, textStatus) {
				/* alert("system error") */
			},
			complete : function(data, textStatus) {
			}
		});
	}); 
</script>
<%@ include file="../include/footer.jsp"%>