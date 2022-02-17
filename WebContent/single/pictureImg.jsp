<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
1) upload 폴더를 만들기 (/upload)
<%
//upload에 대한 path를 잡아야힘
String path = application.getRealPath("/") + "upload/";
String filename =null;

MultipartRequest multi = new MultipartRequest(request, path, 10*1024*1024, "utf-8");//10*1024*1024 =>10mb
filename =multi.getFilesystemName("picture");  //upload 폴더에 저장
%>
<script>
const img = opener.document.querySelector("#pic");
img.src ="<%=request.getContextPath()%>/upload/<%=filename%>"  //이미지 보여주는것
opener.document.f.picture.value="<%=filename%>" 
self.close();
</script>
</body>
</html>