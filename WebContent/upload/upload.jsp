<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//클라이언트가 전송한 메세지와 파일을 받아서 서버의 지정된 디렉토리에 저장시키자 = 업로드
	
	//클라이언트가 전송한 데이터가 단순 텍스트가 아닌 바이너리 파일이 포함되어 있을 경우, 스트림 처리를 하지 않으면 안된다.
	//request 객체는 스트링의 파라미터만 받는 메서드만 지원하기 때문에 바이너리 파일을 직접 받기 위해서는 컴포넌트 외부라이브러리를 사용하는게 대부분이다.
	//String saveDir="C:/javaee_workspace/WebApp0508/WebContent/data";
	int maxSize=2*1024*1024; //2메가로 사진 크기 제한
	
	//ServletContext javaEE의 객체를 jsp에서는 application내장객체로 지원해준다.
	String realPath=application.getRealPath("/data");
	out.print(realPath);
	
	//오레일리사에서 제작한 컴포넌트는 생성자에서 업로드가 처리된다.
	MultipartRequest multi=new MultipartRequest(request, realPath, maxSize, "utf-8");
	out.print("성공");
	
	String name=multi.getOriginalFileName("myFile");
	
	//html 클라이언트 측에서 form 태그의 속성에 enctype:"multipart/form-data"가 지정되면 request 객체의 getParameter()로는 파라미터값을 받을 수 없게 된다.
	//따라서 업로드 컴포넌트를 이용해야 한다.
	String msg = multi.getParameter("msg");
	out.print(msg);

%>

<img src="/data/<%=name %>">