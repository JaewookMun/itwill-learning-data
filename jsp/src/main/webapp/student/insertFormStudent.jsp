﻿<%@page import="xyz.itwill.dto.StudentDTO"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 클라이언트로부터 학생정보를 입력받는 JSP 문서 - 자바스크립트를 사용하여 입력값 검증 --%>
<%-- => [학생추가]를 클릭한 경우 학생정보 저장 처리페이지(insertStudent.jsp)로 이동 - 입력값(학생정보) 전달 --%>
<%-- => [학생목록]을 클릭한 경우 학생정보 검색 출력페이지(displayStudent.jsp)로 이동 --%>    
<% 
	String message=(String)session.getAttribute("message");
	if(message==null){
		message="";
	} else{
		session.removeAttribute("message");
	}
	
	StudentDTO student=(StudentDTO)session.getAttribute("student");
	if(student!=null){
		session.removeAttribute("student");
	}

%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>JSP</title>
</head>
<body>
	<h1 align="center">학생정보 입력</h1>
	<hr>
	<form name="studentForm">
	<table align="center" border="1" cellpadding="1" cellspacing="0" width="300">
		<tr height="40">
			<th bgcolor="yellow" width="100">학생번호</th>
			<td width="200" align="center">
				<input type="text" name="no" <% if(student!=null) {  %> value="<%= student.getNo() %>" <% } %>>
			</td>
		</tr>
		<tr height="40">
			<th bgcolor="yellow" width="100">이름</th>
			<td width="200" align="center">
				<input type="text" name="name" <% if(student!=null) {  %> value="<%= student.getName() %>" <% } %>>
			</td>
		</tr>
		<tr height="40">
			<th bgcolor="yellow" width="100">전화번호</th>
			<td width="200" align="center">
				<input type="text" name="phone" <% if(student!=null) {  %> value="<%= student.getPhone() %>" <% } %>>
			</td>
		</tr>
		<tr height="40">
			<th bgcolor="yellow" width="100">주소</th>
			<td width="200" align="center">
				<input type="text" name="address" <% if(student!=null) {  %> value="<%= student.getAddress() %>" <% } %>>
			</td>
		</tr>
		<tr height="40">
			<th bgcolor="yellow" width="100">생년월일</th>
			<td width="200" align="center">
				<input type="text" name="birthday" <% if(student!=null) {  %> value="<%= student.getBirthday() %>" <% } %>>
			</td>
		</tr>
		<tr height="40">
			<td width="200" colspan="2" align="center">
				<input type="button" value="학생추가" onclick="submitCheck();">
				<input type="reset" value="초기화">
				<input type="button" value="학생목록" onclick="location.href='displayStudent.jsp';">
			</td>
		</tr>
	</table>
	<p align="center" style="color: red;"><%=message %></p>
	</form>
	<script type="text/javascript">
	studentForm.no.focus();

	function submitCheck() {
		if(studentForm.no.value=="") {
			alert("학생번호를 입력해 주세요.");
			studentForm.no.focus();
			return;
		}
		
		var noReg=/\d{4}/g;
		if(!noReg.test(studentForm.no.value)) {
			alert("학생번호는 정수 4자리로 입력해주세요.");
			studentForm.no.focus();
			return;
		}
		
		if(studentForm.name.value=="") {
			alert("이름을 입력해 주세요.");
			studentForm.name.focus();
			return;
		}

		if(studentForm.phone.value=="") {
			alert("전화번호을 입력해 주세요.");
			studentForm.phone.focus();
			return;
		}

		var phoneReg=/(01[016789])-\d{3,4}-\d{4}/g;
		if(!phoneReg.test(studentForm.phone.value)) {
			alert("전화번호를 형식에 맞게 입력해주세요.");
			studentForm.phone.focus();
			return;
		}
		
		if(studentForm.address.value=="") {
			alert("주소을 입력해 주세요.");
			studentForm.address.focus();
			return;
		}

		if(studentForm.birthday.value=="") {
			alert("생년월일을 입력해 주세요.");
			studentForm.birthday.focus();
			return;
		}
		
		var birthdayReg=/(18|19|20)\d{2}-(0[1-9]|1[0-2])-(0[1-9]|[12][0-9]|3[01])/g;
		if(!birthdayReg.test(studentForm.birthday.value)) {
			alert("생년월일을 형식에 맞게 입력해주세요.");
			studentForm.birthday.focus();
			return;
		}
		
		studentForm.method="POST";
		studentForm.action="insertStudent.jsp";
		studentForm.submit();
			// JavaScript form 태그의 name -> 객체로 사용가능
	} 
	</script>
</body>
</html>