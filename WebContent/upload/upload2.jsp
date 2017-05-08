<%@page import="java.io.InputStream"%>
<%@page import="java.io.IOException"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="org.apache.commons.io.FilenameUtils"%>
<%@page import="java.io.File"%>
<%@page import="java.io.FileOutputStream"%>
<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="java.util.List"%>
<%@page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%@page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

	ServletFileUpload upload = new ServletFileUpload(new DiskFileItemFactory());
	//요청객체를 넣어주면 클라이언트가 전송한 파라미터들을 분석해준다!
	
	List<FileItem> list = upload.parseRequest(request);
	//우리의 경우 msg와 myFile이라는 파라미터가 전송되므로 총 2개의 FileItem이 생성될 것이다.
	
	out.print("클라이언트가 보낸 파라미터의 수는? "+list.size());
	
	for(int i=0; i<list.size();i++){
		FileItem item = list.get(i);
		if(item.isFormField()==true){
			//일반 텍스트 파라미터
			
			String name = item.getFieldName(); //html 컴포넌트의 name
			String value = item.getString();
			
			if(name.equals("msg")){
				out.print("메세지는 "+value);
			}else if(name.equals("id")){
				out.print("아이디는 "+value);
			}
			
		}else{
			//파일이 저장될 경로 구하기
			String realPath = application.getRealPath("/data");
			String path = realPath+File.separator+FilenameUtils.getName(item.getName());
			InputStream is = item.getInputStream();
			FileOutputStream fos = new FileOutputStream(path);
			
			byte[] b = new byte[1024];
			
			int flag;
			while(true){
				flag=is.read(b);
				if(flag==-1)break;
				fos.write(b);				
			}
			out.print("업로드 완료");
			if(fos!=null){
				fos.close();	
			}
			if(is!=null){
				is.close();
			}
		}
	}
	

%>