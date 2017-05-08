<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
 <%! 
 	String[] color={"red","orange","yellow","green","blue","navy","purple"};
 %>
 
 <%
 	String bg = request.getParameter("bg");
 	out.print(bg);
 %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script>
function send(){
	//현재 페이지로 파라미터를 전송한다.
	form1.action="index.jsp";
	form1.submit();
}
</script>
</head>
<body style="background:<%=bg %>">

<form name="form1">
<select name="bg" >
	<%for(int i=0;i<color.length;i++){ %>
	<option <% if(color[i].equals(bg)){%>selected<%} %> value="<%=color[i] %>"><%=color[i] %></option>
	<% }%>
</select>

<input type="button" value="전송" onClick="send()">
</form>

</body>
</html>