<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>


<div id="fh5co-author">
	<div class="container">

		<div class="row">
			<div class="col-md-8 col-md-offset-2">

				<h2>
					${cont.name } <br> <br>
				</h2>

			</div>
		</div>


		<div class="row">
			<div class="col-md-8 col-md-offset-2">
				<div class="author">
					<div class="author-inner animate-box"
						style="background-image: url(images/temp/${cont.img_name});"></div>


					<div class="desc animate-box">
						<span>Category: ${cont.cat }</span>
						<h3>
							<a href="mypageForm.do?writerOther=${cont.writer}" target="_blank">writer: ${cont.writer }</a> <br>
							<hr>
						</h3>
						<p>
							point: ${cont.point } <br>
						</p>

						<p>
							review: ${cont.review } <br>
						</p>
						<hr>



						<ul class="fh5co-social-icons">
							<li><a href="#"><i class="icon-facebook"></i></a></li>
							<li><a href="#"><i class="icon-twitter"></i></a></li>
							<li><a href="#"><i class="icon-dribbble"></i></a></li>
							<li><a href="#"><i class="icon-github"></i></a></li>
						</ul>
					</div>
				</div>
				<!-- 				<div class="row">
					<div class="col-md-2">
						<input type="submit" value="REPLY" class="btn btn-primary">
					</div>

					<div class="col-md-2">
						<input type="submit" value="LIST" class="btn btn-primary">
					</div>
				</div> -->
			</div>
		</div>

		<div class="col-md-8 col-md-offset-2 pull-right">
			
			<c:choose>
								<c:when test="${session_id eq cont.writer}">
									<a href="alter.do" id="btnMapAdd" class="btn btn-primary btn-outline">수정하기</a>
									
									<a href="delete.do?cno=${cont.cno}" id="btnMapAdd" class="btn btn-primary btn-outline">삭제하기</a>
								</c:when>
								<c:otherwise>
									
								</c:otherwise>
							</c:choose>
			
			
			
			
			
			</div>
			<div class="col-md-8 col-md-offset-2">
			<hr>
			
			
			<br>
			<div class="map_wrap">
				<div id="map"
					style="width: 100%; height: 100%; position: relative; overflow: hidden;"></div>

				<div id="menu_wrap" class="bg_white">
					<div class="option">
						<div>
							<form name="a" onsubmit="searchPlaces(); return false;">
								키워드 : <input type="text" value="${cont.map}" id="keyword" size="15">
								<button type="submit">검색하기</button>
							</form>
						</div>
					</div>
					<hr>
					<ul id="placesList"></ul>
					<div id="pagination"></div>
				</div>
			</div>
		</div>
	</div>
</div>
<%@ include file="../include/footer.jsp"%>