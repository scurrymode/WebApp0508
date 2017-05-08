<%@ page contentType="text/html; charset=UTF-8" %>
<%
	//서블릿을 사용할 경우엔 다소 불편함은 있지만, 
	//서버측 프로그램의 원리와 제어를 개발자가 주도하기 때문에 
	//서버의 상황에 대한 이해가 가능하다.. 하지만, JSP만을 이용할 경우, 
	//서블릿의 특징이 모두 숨겨져 버리기 때문에 서버측의 실행원리에 대한 지식이 부족하게 됨 

	request.setCharacterEncoding("utf-8");
	
	//꼭 String으로 받아야 한다.
	String id = request.getParameter("id");
	String pass = request.getParameter("password");
	
	out.print("넘겨받은 아이디 "+id);
	out.print("<br>");
	out.print("넘겨받은 pass "+pass);
	
	
%>
