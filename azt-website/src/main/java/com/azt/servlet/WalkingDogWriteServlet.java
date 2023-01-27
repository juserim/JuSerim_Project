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
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.azt.common.Util;
import com.azt.dto.WalkingDogBoard;
import com.azt.dto.WalkingDogBoardAttach;
import com.azt.service.WalkingDogBoardService;

@WebServlet(urlPatterns = {"/walkingDogBoard/walkingDogWrite.action"})
public class WalkingDogWriteServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		HttpSession session = req.getSession();
		if(session.getAttribute("loginuser") == null) { // 로그인하지 않는 경우
			resp.sendRedirect("/azt-website/account/login.action");
			return;
		}
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/walkingDogBoard/walkingDogWrite2.jsp");
		dispatcher.forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		req.setCharacterEncoding("utf-8");
		
		if(!ServletFileUpload.isMultipartContent(req)) {
			resp.sendRedirect("/azt-website/walkingDogBoard/walkingDogList.action");
			return;
		}
		
		ServletContext application = req.getServletContext();
		String path = application.getRealPath("/upload-files");		//최종 파일 저장 경로
		String tempPath = application.getRealPath("/upload-temp");	//임시 파일 저장 경로
		System.out.printf("%s\n%s\n", path, tempPath);
		
		DiskFileItemFactory factory = new DiskFileItemFactory();
		factory.setSizeThreshold(1024 * 1024 * 2);	
		factory.setRepository(new File(tempPath));
		
		ServletFileUpload uploader = new ServletFileUpload(factory);
		uploader.setFileSizeMax(1024 * 1024 * 10);
		
		WalkingDogBoard board = new WalkingDogBoard();
		ArrayList<WalkingDogBoardAttach> files = new ArrayList<>();
		
		try {
			List<FileItem> items = uploader.parseRequest(req);
			
			for(FileItem item : items) {
				if(item.isFormField()) {
					if(item.getFieldName().equals("title")) {
						board.setTitle(item.getString("utf-8"));
					}else if(item.getFieldName().equals("writer")) {
						board.setWriter(item.getString("utf-8"));
					}else if(item.getFieldName().equals("dogName")) {
						board.setDogName(item.getString("utf-8"));
					}else if(item.getFieldName().equals("breed")) {
						board.setBreed(item.getString("utf-8"));
					}else if(item.getFieldName().equals("weight")) {
						board.setWeight(item.getString("utf-8"));
					}else if(item.getFieldName().equals("location")) {
						board.setLocation(item.getString("utf-8"));
					}else if(item.getFieldName().equals("content")) {
						board.setContent(item.getString("utf-8"));
					}
					
				} else {
					String fileName = item.getName();
					if(fileName != null && fileName.length() > 0) {
						if(fileName.contains("\\")) {
							fileName = fileName.substring(fileName.lastIndexOf("\\")+1);
						}
						String uniqueFileName = Util.makeUniqueFileName(fileName);
						item.write(new File(path, uniqueFileName));
						item.delete();
						
						WalkingDogBoardAttach boardAttach = new WalkingDogBoardAttach();
						boardAttach.setUserFilename(fileName);
						boardAttach.setSavedFilename(uniqueFileName);
						
						files.add(boardAttach);
					}					
				}
			}
		}catch(Exception ex) {
			ex.printStackTrace();
		}
		
		board.setFiles(files);
		
		WalkingDogBoardService boardService = new WalkingDogBoardService();
		boardService.writeBoard(board);
		
		resp.sendRedirect("/azt-website/walkingDogBoard/walkingDogList.action");
		
	}
}
