package com.azt.servlet;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.azt.common.Util;
import com.azt.dto.HotplaceBoard;
import com.azt.dto.HotplaceBoardAttach;
import com.azt.service.HotplaceBoardService;



@WebServlet(urlPatterns = {"/hotplaceBoard/hotplaceWrite.action"})
public class HotplaceWriteServlet extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		RequestDispatcher dispatcher = 
				req.getRequestDispatcher("/WEB-INF/views/hotplaceBoard/hotplaceWrite.jsp");
		dispatcher.forward(req, resp);		
	}
	
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		if (!ServletFileUpload.isMultipartContent(req)) {	
			resp.sendRedirect("hotplaceList.action");
			return;
		}
		
		//경로 문자열을 저장할 변수
				//application.getRealPath('웹경로') : application 내장 객체는 ServletContext 객체
				//--> 가상경로(웹경로) -> 물리경로(컴퓨터경로)
				//--> http://..... -> C:/......
				ServletContext application = req.getServletContext();
				String path = application.getRealPath("/upload-files");		//최종 파일 저장 경로
				String tempPath = application.getRealPath("/upload-temp");	//임시 파일 저장 경로
				
				System.out.printf("%s\n%s\n", path, tempPath);

				//전송 데이터 각 요소를 분리해서 개별 객체를 만들때 사용할 처리기
				DiskFileItemFactory factory = new DiskFileItemFactory();
				factory.setSizeThreshold(1024 * 1024 * 2);	//임시 파일을 만들지 결정하는 기준 설정
				factory.setRepository(new File(tempPath));	//임시 파일 저장 경로 지정

				//요청 정보를 읽을 파서(Parser) 생성 (요청을 읽고 요소별로 분리)
				ServletFileUpload uploader = new ServletFileUpload(factory);
				uploader.setFileSizeMax(1024 * 1024 * 10);//최대 파일 크기
				
				HotplaceBoard hotplaceBoard = new HotplaceBoard();
				ArrayList<HotplaceBoardAttach> files = new ArrayList<>();

				try {			
					//요청 정보를 파싱해서 파일과 데이터를 분리하고 각 요소를 객체로 만들어서 목록으로 반환
					List<FileItem> items = uploader.parseRequest(req);			
			
					//목록에 담긴 데이터 사용
					for (FileItem item : items) {
						
						if (item.isFormField()) { //form-data인 경우 (File이 아닌 일반 데이터인 경우)
							if (item.getFieldName().equals("title")) {
								hotplaceBoard.setTitle(item.getString("utf-8"));
							} else if (item.getFieldName().equals("writer")) {
								hotplaceBoard.setWriter(item.getString("utf-8"));
							} else if (item.getFieldName().equals("content")) {
								hotplaceBoard.setContent(item.getString("utf-8"));
							} else if (item.getFieldName().equals("loc")) {
								hotplaceBoard.setLoc(item.getString("utf-8"));
							} else if (item.getFieldName().equals("place")) {
								hotplaceBoard.setPlace(item.getString("utf-8"));
							}
						} else { //file인 경우
							String fileName = item.getName(); //파일 이름 가져오기
							if (fileName != null && fileName.length() > 0) { //내용이 있는 경우
								if (fileName.contains("\\")) { // iexplore 경우
									//C:\AAA\BBB\CCC.png -> CCC.png 
									fileName = fileName.substring(fileName.lastIndexOf("\\") + 1);
								}
								//String uniqueFileName = Util.makeUniqueFileName(path, fileName);//고유한 파일이름 만들기
								String uniqueFileName = Util.makeUniqueFileName(fileName);//고유한 파일이름 만들기
								item.write(new File(path, uniqueFileName)); //파일 저장
								item.delete(); //임시 파일 삭제
								
								// 데이터베이스에 저장할 파일 정보를 Dto 객체에 저장
								HotplaceBoardAttach boardAttach = new HotplaceBoardAttach();						
								boardAttach.setUserFileName(fileName);
								boardAttach.setSavedFileName(uniqueFileName);
								
								files.add(boardAttach);
							}
						}
					}
				} catch (Exception ex) {
					ex.printStackTrace();
				}
				
				//여기까지 실행되면 1. 파일저장, 2. Board 객체 생성, 3. BoardAttach 객체 생성
				// board 객체에는 title, writer, content 정보 + 첨부파일 정보가 저장
				hotplaceBoard.setFiles(files);	
		
		
//		req.setCharacterEncoding("utf-8");
//		String title = req.getParameter("title");
//		String writer = req.getParameter("writer");
//		String place = req.getParameter("place");
//		String loc = req.getParameter("loc");
//		String content = req.getParameter("content");
//	
//		HotplaceBoard hotplaceBoard = new HotplaceBoard();
//		hotplaceBoard.setTitle(title);
//		hotplaceBoard.setWriter(writer);
//		hotplaceBoard.setPlace(place);
//		hotplaceBoard.setLoc(loc);
//		hotplaceBoard.setContent(content);
		
		HotplaceBoardService boardservice = new HotplaceBoardService();
		boardservice.hotplaceWriteBoard(hotplaceBoard);
		
		resp.sendRedirect("hotplaceList.action");
	}
}

	
 