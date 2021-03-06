<%@page import="modal.Member"%>
<%@page import="java.util.List"%>
<%@page import="service.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<%
String login = (String) session.getAttribute("memberId");
if(login == null || login.equals("admin")){
%>
<script>
	alert("권한이 없습니다")
	location.href="<%=request.getContextPath()%>/view/member/loginForm.jsp"
</script>
<%
	}else {
%>
<%
MemberDao md = new MemberDao();
List<Member> li = md.memberList();
%>
<body>
	<hr>
	<div class="container">
		<h2  id="center">회원정보</h2>

		<table class="table table-hover">
			<thead>
				<tr>
					<th>id</th>
					<th>이름</th>
					<th>성별</th>
					<th>전화번호</th>
					<th>이메일</th>
					<th>사진</th>

				</tr>
			</thead>
			<tbody>
			<% for (Member m : li) {%>
				<tr>
					<td><%=m.getId() %></td>
					<td><%=m.getName() %></td>
					<td><%=m.getGender()==1 ?"남자":"여자" %></td>
					<td><%=m.getTel() %></td>
					<td><%=m.getEmail() %></td>
					<td><%=m.getPicture() %></td>
				</tr>
				<%} %>
			</tbody>
		</table>
		</div>
</body>
</html>
<% }  %>