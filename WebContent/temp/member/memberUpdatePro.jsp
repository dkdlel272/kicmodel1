<%@page import="modal.Member"%>
<%@page import="service.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
int num = 0;

String msg = "비밀번호가 틀립니다. 다시 입력하세요.";
String url = request.getContextPath() + "/view/member/memberUpdate.jsp";
String login = (String) session.getAttribute("memberId");
//login 불가 이면
if(login == null || login.trim().equals("")){
%>
<script>
	alert("로그인이 필요합니다.");
	location.href="<%=request.getContextPath()%>/view/member/loginForm.jsp";
</script>

<%} else {
	String email = request.getParameter("email");
	String tel = request.getParameter("tel");
	String pass = request.getParameter("pass");
	String picture = request.getParameter("picture");
	MemberDao md = new MemberDao();
	Member mem =  md.selectOne(login);
	
	
	//member에 email,tel,picture를 저장
	mem.setEmail(email);
	mem.setTel(tel);
	mem.setPicture(picture);
	
	System.out.println(mem);
	

	
	if(mem.getPass().equals(pass)){ //비밀번호가 맞는것
		
		num = md.memberUpdate(mem);
		msg ="회원정보가 수정 되었습니다.";
		url = request.getContextPath() + "/view/main.jsp";
	}
}
%>
<script>
alert("<%=msg%>");
location.href="<%=url%>";
</script>
</body>
</html>