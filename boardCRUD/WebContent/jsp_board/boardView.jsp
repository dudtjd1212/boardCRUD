<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>boardView</title>
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

	<h1>BOARD VIEW</h1>
	<div class="container">
		<%
			if (request.getParameter("boardNo") == null) {
				response.sendRedirect(request.getContextPath() + "/jsp_board/boardList.jsp");
			} else {
				int boardNo = Integer.parseInt(request.getParameter("boardNo"));
				System.out.println("boardNo :" + boardNo);
				String dbUrl = "jdbc:mysql://127.0.0.1:3306/jjdev?useUnicode=true&characterEncoding=euckr";
				String dbUser = "root";
				String dbPw = "java0000";
				Connection connection = null;
				PreparedStatement statement = null;
				ResultSet resultSet = null;
				try {
					Class.forName("com.mysql.jdbc.Driver");
					connection = DriverManager.getConnection(dbUrl, dbUser, dbPw);
					String sql = "SELECT board_title, board_content, board_user, board_date FROM board WHERE board_no=?";
					statement = connection.prepareStatement(sql);
					statement.setInt(1, boardNo);
					resultSet = statement.executeQuery();
					if (resultSet.next()) {
		%>
		<div>board_no :</div>
		<div class="alert alert-warning"><%=boardNo%></div>
		<div>board_title :</div>
		<div class="alert alert-warning"><%=resultSet.getString("board_title")%></div>
		<div>board_content :</div>
		<div class="alert alert-warning"><%=resultSet.getString("board_content")%></div>
		<div>board_user :</div>
		<div class="alert alert-warning"><%=resultSet.getString("board_user")%></div>
		<div>board_date :</div>
		<div class="alert alert-warning"><%=resultSet.getString("board_date")%></div>
		<div>
			<a
				href="<%=request.getContextPath()%>/jsp_board/boardModifyForm.jsp?boardNo=<%=boardNo%>">수정</a>
			<a
				href="<%=request.getContextPath()%>/jsp_board/boardRemoveForm.jsp?boardNo=<%=boardNo%>">삭제</a>
			<a
				href="<%=request.getContextPath()%>/jsp_board/boardList.jsp?boardNo=<%=boardNo%>">목록으로</a>
		</div>
		<%
			}
				} catch (Exception e) {
					e.printStackTrace();
					out.println("BOARD VIEW ERROR!");
				} finally {
					try {
						resultSet.close();
					} catch (Exception e) {
					}
					try {
						statement.close();
					} catch (Exception e) {
					}
					try {
						connection.close();
					} catch (Exception e) {
					}
				}
			}
		%>
	</div>
</body>
</html>


