<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>

<div class="col-md-4"></div>


<div class="col-md-4">
	<br> <br> <br> <br> <br>

	<h3>회원가입</h3>
	<form action="join.do" method="post">
		<div class="row form-group">

			<br>
			<div class="row form-group">
				<div class="col-md-10">
					<label for="name">NAME</label> <input type="text" name="name"
						id="name" class="form-control">
				</div>
			</div>
			<br>

			<div class="row form-group">
				<div class="col-md-10">
					<label for="email">E-mail</label> <input type="email" name="email"
						id="email" class="form-control">
				</div>
			</div>
			<br>

			<div class="row form-group">
				<div class="col-md-8">
					<label for="id">ID</label> <input type="text" name="id" id="id"
						class="form-control">

				</div>
				<div class="col-md-4">
					<br>
					<button type="button" id="btnOverappedId" class="btn btn-primary">중복확인</button>
					<div id="msg">아이디 중복확인</div>
				</div>
			</div>
			<div class="row form-group">
				<div class="col-md-10">
					<label for="pw">Password</label> <input type="password" name="pw"
						id="pw" class="form-control">
				</div>
			</div>
			<br>

			<div class="row form-group">
				<div class="col-md-10">
					<label for="pw">Password 확인</label> <input type="password"
						name="pw" id="pw2" class="form-control"> <span
						id="alert-success" style="display: none;">비밀번호가 일치합니다.</span> <span
						id="alert-danger"
						style="display: none; color: #d92742; font-weight: bold;">비밀번호가
						일치하지 않습니다.</span>
				</div>
			</div>
			<br>

			<div class="row form-group">
				<div class="col-md-10">
					<label for="nickname">NICKNAME</label> <input type="text"
						name="nickname" id="nickname" class="form-control">
				</div>
			</div>
			<br>
		</div>


		<br> <br>
		<div class="col-md-4"></div>
		<div class="form-group">
			<input type="submit" value="회원가입" id="memberJoin"
				class="btn btn-primary">
		</div>
		<div class="col-md-5"></div>
		<br> <br> <br> <br> <br>
	</form>
</div>


<div class="col-md-4"></div>
<script type="text/javascript">
	$("#memberJoin").on('click', function() {
		var id = $("#id").val();
		if (id == "") {
			alert("아이디를 입력하세요");

			id.focus();
			return false;
		}
		return true;
	});

	$("#btnOverappedId").on('click', function() {
		$.ajax({
			type : "post",
			url : "overappedId.do",
			data : {
				"id" : $("#id").val()
			},
			async : false,
			dataType : "text",
			success : function(data, textStatus) {
				if (data == 'usable') {
					$("#msg").html("사용가능한 아이디")
				} else if (data == 'not usable') {
					$("#msg").html("사용불가능한 아이디")
				}
			},
			error : function(data, textStatus) {
				alert("error")
			},
			complete : function(data, textStatus) {

			}

		});
	});
	$(".form-control").focusout(function() {
		var pwd1 = $("#pw").val();
		var pwd2 = $("#pw2").val();

		if (pwd1 != '' && pwd2 == '') {
			null;
		} else if (pwd1 != "" || pwd2 != "") {
			if (pwd1 == pwd2) {
				// 비밀번호 일치 이벤트 실행
				 $("#alert-success").css('display', 'inline-block');
	                $("#alert-danger").css('display', 'none');
			} else {
				// 비밀번호 불일치 이벤트 실행0
	                $("#alert-success").css('display', 'none');
	                $("#alert-danger").css('display', 'inline-block');
			}
		}
	});
</script>

<%@ include file="../include/footer.jsp"%>