<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!-- Popper JS -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<title>BOARD REMOVE FORM</title>
</head>

<body>
<div class="container">
<%
    // boardNo���� �Ѿ���� ������ boardList.jsp�� �̵�
    if(request.getParameter("boardNo") == null) {
        response.sendRedirect(request.getContextPath()+"/jsp_board/boardList.jsp");
    } else {
%>
       <form  class="form-inline" id="removeForm" action="<%=request.getContextPath()%>/jsp_board/boardRemoveAction.jsp" method="post">
            <!-- boardPw�� �Բ� boardNo���� ���ܼ�(hidden������) �ѱ� -->
            <input name="boardNo" value="<%=request.getParameter("boardNo")%>" type="hidden"/>
            <div class="form-group">
                <label for="boardPw">��й�ȣȮ�� :</label>
                <input class="form-control" id="boardPw" name="boardPw" type="password">
            </div>
            <div class="form-group">
                <input  id="removeButton" type="button" value="����" class="btn btn-info"/>
            </div>
        </form>

<%    
    }
%>
<script>   
        $('#removeButton').click(function(){
            if($('#boardPw').val().length <4) {
                alert('boardPw�� 4���̻� �̾�� �մϴ�');
                $('#boardPw').focus();
            } else {
                $('#removeForm').submit();
            }
        });  


</script>
</div>
</body>
</html>


