package com.azt.servlet;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.azt.dto.HotplaceBoardAttach;
import com.azt.service.HotplaceBoardService;
 
@WebServlet(urlPatterns = {"/hotplaceBoard/hotplaceDownload.action"})
public class HotplaceDownloadServlet extends HttpServlet {

		@Override
		protected void 
		doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
			
			String sAttachNo = req.getParameter("attachno");
			int attachNo = -1;
			try {
				attachNo = Integer.parseInt(sAttachNo);
			} catch (Exception ex) {
				resp.sendRedirect("hotplaceList.action");
				return;
			}
			
			HotplaceBoardService hotplaceBoardService = new HotplaceBoardService();
			HotplaceBoardAttach hotplaceBoardAttach = hotplaceBoardService.findHotplaceBoardAttachByAttachNo(attachNo);
			
			ServletContext application = req.getServletContext();
			String path =
					application.getRealPath("/upload-files/" + hotplaceBoardAttach.getSavedFileName());
			
			resp.setContentType("application/octet-stream;charset=utf-8");
			
			resp.addHeader("Content-Disposition", 
					"Attachment;filename=\"" + 
					new String(hotplaceBoardAttach.getUserFileName().getBytes("utf-8"), "ISO-8859-1") + "\"");
			
			FileInputStream fis = new FileInputStream(path); 	//파일을 읽는 도구
			OutputStream fos = resp.getOutputStream();			//브라우저에게 전송하는 도구
			
			while (true) {
				int data = fis.read();  //파일에서 1byte 읽기
				if (data == -1) { //더 이상 읽을 데이터가 없다면 (EOF)
					break;
				}
				fos.write(data); //응답 스트림에 1byte 쓰기
			}
			
			fis.close();
			fos.close();
	
		}
}
