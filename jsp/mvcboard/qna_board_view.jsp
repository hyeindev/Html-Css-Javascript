<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="net.board.db.*" %>
    <%
    	BoardBean board = (BoardBean)request.getAttribute("boarddata");
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MVC 게시판</title>
<script>
function deleteCheck() {
  	if(confirm('정말 삭제 하시겠습니까?')) {
		return true;
	}else {
		alert("삭제를 취소합니다.");
		return false;
	}  
}

</script>
</head>
<body>

<table>
	<tr align="center" valign="middle">
		<td colspan="2">MVC 게시판</td>
	</tr>
	<tr>
		<td style="font-familly:Tahoma; font-size:12pt" height="16">
			<div align="center">제 목&nbsp;&nbsp;</div>
		</td>
		<td style="font-familly:Tahoma; font-size:12pt">
			<%=board.getBOARD_SUBJECT() %>
		</td>
	</tr>
	<tr bgcolor="#CCCCCC">
		<td colspan="2" style="height:1px;">
		</td>
	</tr>
	<tr>
		<td style="font-familly:Tahoma; font-size:12pt" height="16">
			<div align="center">내 용&nbsp;&nbsp;</div>
		</td>
		<td style="font-familly:Tahoma; font-size:12pt">
			<table border=0 width=490 height=250 style="table-layout:fixed">
				<tr>
					<td valign=top style="font-familly:Tahoma; font-size:12pt">
						<%=board.getBOARD_CONTENT().replace("\r\n","<br/>") %>
					</td>
				</tr>
			</table>
		</td>
	</tr>
	<tr>
		<td style="font-familly:Tahoma; font-size:12pt" height="16">
			<div align="center">첨부 파일</div>
		</td>
		<td style="font-familly:Tahoma; font-size:12pt">
			<% if(!(board.getBOARD_FILE() ==null)) {%>
				<a href="./boardupload/<%=board.getBOARD_FILE() %>"><%=board.getBOARD_FILE() %></a>
			<% }  %>	
		</td>
	</tr>
	<tr	bgcolor="#CCCCCC">
		<td colspan="2">&nbsp;</td>
	</tr>
	<tr align="center" valign="middle">
		<td colspan="2">
			<font size=2>
				<a href="./BoardReplyView.bo?num=<%=board.getBOARD_NUM() %>">[답변]</a>&nbsp;&nbsp;
				<a href="./BoardModify.bo?num=<%=board.getBOARD_NUM() %>">[수정]</a>&nbsp;&nbsp;
				<a href="./BoardDelete.bo?num=<%=board.getBOARD_NUM() %>" onclick="return deleteCheck();">[삭제]</a>&nbsp;&nbsp;
				<a href="javascript:history.go(-1)">[뒤로 (목록)]</a>&nbsp;&nbsp;
				<a href="./BoardList.bo">[목록]</a>&nbsp;&nbsp;
			</font>
		</td>
	</tr>
</table>

</body>
</html>