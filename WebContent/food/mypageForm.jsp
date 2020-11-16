<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>

<div class="container">
	<c:forEach items="${list }" var="cont" begin='0' end='0' step='1'>
		<div style="line-height:75%;">
   			<br>
		</div>
		<h1>[${cont.writer}] Post List</h1>
	</c:forEach>
	<hr>
	<div class="fixed_img_col">
		<ul>
			<c:forEach items="${list }" var="cont">
				<li>
					<a href="viewDetails.do?cno=${cont.cno}&pageNum=${pageM.currentPage}">
						<%-- <span class="thumb"><img src="images/temp/${cont.imagename }" width="120" height="92"></span> --%>
						<span class="thumb"><img src="images/des1.jpg" width="120" height="92"></span>
					</a>			
					
					<div class="col-md-2">
						<strong>
							<%-- <div>${cont.name }</div> --%>
							<div>${cont.writer}</div>		
						</strong>
						<div style="line-height:50%;">
  								<br>
						</div>
  								
						<div><fmt:formatDate value="${cont.writedate}" /></div>
						<div>★★★★★</div>
						<div>${cont.views} views</div>
					</div>
					
					<div class="col-md-8">
						<a href="viewDetails.do?cno=${cont.cno}&pageNum=${pageM.currentPage}" style="">
							<strong>${cont.name }</strong> <!-- 리뷰 제목 -->
						</a>
							<div style="line-height:25%;">
  									<br>
							</div>					
						<p>${cont.review }</p> <!-- 리뷰 내용 -->
					</div>
					
					
					<br>
					
				</li>
				<br>
				<hr>
			</c:forEach>

		</ul>
	</div>




	<br>
	<br>
	<div class="col-md-3"></div>
<%-- 	<ul class="pagination">
	
	
		<li class='<c:out value="${pageM.prev==false?'':'disabled'}"></c:out>'>
			<a href="listForm.do?cat=${cat}&pageNum=${pageM.currentPage-1}" style="color:gray;">
				<strong>이전</strong>
			</a>
		</li>
		
		<c:forEach var="i" begin="${pageM.startPage}" end="${pageM.endPage}">
			<li class='<c:out value="${pageM.currentPage==i?'active':''}"></c:out>'>
				<a href="listForm.do?category=${cat}&pageNum=${i}">
					${i}
				</a>
			</li>
		</c:forEach>
		<c:forEach var="i" begin="1" end="10">
			<li class='<c:out value="${pageM.currentPage==i?'active':''}"></c:out>'>
				<a href="listForm.do?cat=${cat}&pageNum=${i}" style="color:gray;">
					${i}
				</a>
			</li>
		</c:forEach>
		
		
		<li class='<c:out value="${pageM.next==true?'':'disabled'}"></c:out>'>
			<a href="listForm.do?cat=${cat}&pageNum=${pageM.currentPage+1}" style="color:gray;">
				<strong>다음</strong>
			</a>
		</li>
		
		
	</ul> --%>
	
	
</div>


<script type="text/javascript">
	$("#btnaddContentForm").on('click', function() {
		location.href = "addContentForm.do";
	});
	
	
</script>

<script src="//ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
<script src="http://cfs.tistory.com/custom/blog/149/1491216/skin/images/ygal.js"></script>



<%@ include file="../include/footer.jsp"%>