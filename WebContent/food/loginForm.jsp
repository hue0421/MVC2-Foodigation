<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>

<div class="col-md-4"></div>


<div class="col-md-4" id="loginModal">
	<br> <br> <br> <br>

	<h3>LOGIN</h3>
	<form action="#">
		<div class="row form-group">
			<div class="col-md-12">
				<label for="fname">ID</label> <input type="text" id="join_id"
					class="form-control">
			</div>

		</div>

		<div class="row form-group">
			<div class="col-md-12">
				<label for="email">PW</label> <input type="password" id="join_pw"
					class="form-control">
			</div>
		</div>
		<br>
		<div class="col-md-5"></div>
		<div class="form-group">
			<input type="submit" value="LOGIN" id="btnLogin" class="btn btn-primary">
		</div>
		<div class="col-md-5"></div>
		<br> <br> <br> <br> <br>
	</form>
</div>


<div class="col-md-4"></div>
	
<script type="text/javascript">
var modal=$("#loginModal");

/* 
$('#btnJoin').on('click', function (event) {
	location.href="joinForm.do";
	
});
 */
$('#login_a').on('click', function(event) {
	//$(this).next().fadeToggle();
	event.stopPropagation(); // 부모요소에 동일한 클릭이벤트 전파를 막기
	modal.modal('show'); // 모달 대화상자 띄우기
});

$('#logout_a').on('click', function (event) {
	//event.stopPropagation(); // 부모요소에 동일한 클릭이벤트 전파를 막기
	location.href="logout.do";
	//$('#myModal').modal('show'); // 모달 대화상자 띄우기
	
	//return false;
});


$("#btnLogin").on('click',function(){
	var query={"id":$("#join_id").val(), "pw":$("#join_pw").val()};
	$.ajax({
		type:"post",
		url:"login.do",
		async:false,
		data:query,
		dataType:"text",
		success:function(data,textStatus){
			if(data=="success"){
				location.href="mainForm.do";
				alert("로그인 성공");
			}else if(data=="password error"){
				alert("패스워드가 일치하지 않습니다.")
			}else{
				alert("아이디가 올바르지 않습니다.")
			}
		},error:function(data,textStatus){
			alert("system error")
		},complete:function(data,textStatus){}
	});
});
</script>

<%@ include file="../include/footer.jsp"%>