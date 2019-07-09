<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>BOARD ADD</title>
</head>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<!-- jQuery library -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!-- Popper JS -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<!-- Latest compiled JavaScript -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<body>
	<div class="container">
		<h1>BOARD ADD</h1>
		<form id="addForm"
			action="<%=request.getContextPath()%>/jsp_board/boardAddAction.jsp"
			method="post">
			<div class="form-group">
				<label for="boardPw">boardPw :</label> <input class="form-control"
					name="boardPw" id="boardPw" type="password"
					placeholder="Enter boardPw" />
			</div>
			<div class="form-group">
				<label for="boardPw">boardTitle :</label> <input
					class="form-control" name="boardTitle" id="boardTitle" type="text"
					placeholder="Enter boardTitle" />
			</div>
			<div class="form-group">
				<label for="boardContent">boardContent :</label>
				<textarea class="form-control" name="boardContent" id="boardContent"
					placeholder="Enter boardContent" rows="5" cols="30"></textarea>
			</div>
			<div class="form-group">
				<label for="boardName">boardName :</label> <input
					class="form-control" name="boardUser" id="boardUser" type="text"
					placeholder="Enter boardName" />
			</div>
			<div>
				<button type="button" id="addButton" value="���Է�"
					class="btn btn-info">���Է�</button>
				<input type="reset" value="�ʱ�ȭ" class="btn btn-info" /> <a
					class="btn btn-info"
					href="<%=request.getContextPath()%>/jsp_board/boardList.jsp">�۸��</a>
			</div>
		</form>
	</div>
</body>
<script>
	$('#addButton').click(function() {
		if ($('#boardPw').val().length < 4) {
			alert('boardPw�� 4���̻� �̾�� �մϴ�');
			$('#boardPw').focus();
		} else if ($('#boardTitle').val() == '') {
			alert('boardTitle�� �Է��ϼ���');
			$('#boardTitle').focus();
		} else if ($('#boardContent').val() == '') {
			alert('boardContent�� �Է��ϼ���');
			$('#boardContent').focus();
		} else if ($('#boardUser').val() == '') {
			alert('boardUser�� �Է��ϼ���');
			$('#boardUser').focus();
		} else {
			$('#addForm').submit();
		}
	});
</script>

</html>


