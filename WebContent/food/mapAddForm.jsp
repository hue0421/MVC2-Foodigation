<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>


<div id="fh5co-author">
	<div class="container">
		<p style="font-size: 28px; text-align: center">Please specify a place</p>
		<br><hr><br><br>


		<div class="map_wrap">

			<div id="map"
				style="width: 100%; height: 100%; position: relative; overflow: hidden;"></div>
			<div id="menu_wrap" class="bg_white">
				<div class="option">
					<div>
						<form name="a" onsubmit="searchPlaces(); return false;">
							키워드 : <input type="text" value="부산 서면 롯데백화점" id="keyword"
								size="15">
							<button type="submit">검색하기</button>
						</form>
					</div>
				</div>
				<hr>
				<ul id="placesList"></ul>
				<div id="pagination"></div>
			</div>
		</div>
		<br> <br>
		<hr>
		<br>
		<div id="fh5co-started" style="background-color: #fff">
			<div class="container">
				<div class="row animate-box">
					<div class="col-md-8 col-md-offset-2 text-center fh5co-heading">
						<h2>Thanks for sharing</h2>
						<p>
							<a href="#" id="btnAdd" class="btn btn-primary"
								style="background-color: #fff">등록하기</a>
						</p>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<script type="text/javascript">
	$("#btnAdd").on('click', function() {
		location.href = "mapAdd.do?where=" + $('#keyword').val();
	});
</script>
<%@ include file="../include/footer.jsp"%>