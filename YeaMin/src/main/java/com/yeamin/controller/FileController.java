package com.yeamin.controller;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.SocketException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.yeamin.util.YmUtil;

@Controller
public class FileController {
	
	protected final Log log = LogFactory.getLog(getClass());
	
	public FileController() {
		
	}
	
	@RequestMapping("/fileUpload.do")
	public @ResponseBody Map<String, Object> fileUpload(HttpServletRequest request, HttpServletResponse response) throws IllegalStateException, IOException {
		String saveDirPath = request.getSession().getServletContext().getRealPath("/save");
		File saveDir = new File(saveDirPath);
		if (!saveDir.exists()) {
			saveDir.mkdir();
		}
		
		MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
	    Iterator<String> iterator = multipartRequest.getFileNames();
	    
	    while(iterator.hasNext()){
	    	String fileName = iterator.next();
	    	MultipartFile multipartFile = multipartRequest.getFile(fileName);
	    	
	        if(!multipartFile.isEmpty()){
	        	String originalFileName = multipartFile.getOriginalFilename();
	        	String originalFileExtension = originalFileName.substring(originalFileName.lastIndexOf("."));
	        	long originalFileSize = multipartFile.getSize();
	        	String saveFileName = System.currentTimeMillis() + originalFileExtension;
	        	
	        	log.debug("saveDirPath : " + saveDirPath);
	        	log.debug("originalFileName : " + originalFileName);
	        	log.debug("originalFileExtension : " + originalFileExtension);
	        	log.debug("originalFileSize : " + originalFileSize);
	        	log.debug("saveFileName : " + saveFileName);
	        	
	        	multipartFile.transferTo(new File(saveDirPath + File.separator + saveFileName));	    
	        	Map<String, Object> ret = new HashMap<String, Object>();
	        	ret.put("name", originalFileName);
	        	ret.put("type", originalFileExtension);
	        	ret.put("fileSize", originalFileSize);
	        	ret.put("saveName", saveFileName);
	        	ret.put("uploadedPath", saveDirPath + File.separator);
	        	ret.put("thumbUrl", "http://localhost:8080/YeaMin/save/" + saveFileName);
	        	
	        	return ret;
	        }
	    }
	    
		return null;
	}

	@RequestMapping("/fileDownload.do")
	public void fileDownload(HttpServletRequest request, HttpServletResponse response) throws IllegalStateException, IOException {
		String originalFileName = request.getParameter("name");
		String saveDirPath = request.getSession().getServletContext().getRealPath("/save");
		String saveFileName = request.getParameter("saveName");
		
		log.debug("saveDirPath : " + saveDirPath);
    	log.debug("originalFileName : " + originalFileName);
    	log.debug("saveFileName : " + saveFileName);
		
		InputStream in = null;
		OutputStream out = null;

		File file = new File(saveDirPath + File.separator + saveFileName);

		if(!file.exists()) {
			System.out.println("파일이 존재하지 않습니다.");
			return;
		}
		
		try {
			in = new BufferedInputStream(new FileInputStream(file));
			out = new BufferedOutputStream(response.getOutputStream());
			response.setContentType("application/unknown");

			response.setHeader("Content-Transfer-Encoding", "binary");
			response.setHeader("Content-Disposition", "attachment; filename=" + new String(originalFileName.getBytes("KSC5601"), "8859_1") + ";");
			byte readByte[] = new byte[1024];
			int readInt = 0;
			out = response.getOutputStream();
			while ((readInt = in.read(readByte)) != -1) {
				out.write(readByte, 0, readInt);
			}
			out.flush();
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (SocketException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			try {
				if(in != null) {
					in.close();
				}
			} catch (IOException e) {
				e.printStackTrace();
			}
			try {
				if(out != null) {
					out.close();
				}
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}
	
	@RequestMapping("/fileDelete.do")
	public @ResponseBody Map<String, Object> fileDelete(HttpServletRequest request, HttpServletResponse response) {
		String result = "";
		String msg = "";
		
		String saveDirPath = request.getSession().getServletContext().getRealPath("/save");
		String saveFileName = request.getParameter("saveName");
		
		log.debug("saveDirPath : " + saveDirPath);
    	log.debug("saveFileName : " + saveFileName);
		
		File saveFile = new File(saveDirPath + File.separator + saveFileName);
		if(!saveFile.isDirectory() && saveFile.exists()) {
			saveFile.delete();
			result = "ok";
		} else {
			result = "err";
		}
	    
    	return YmUtil.gerResponseRetMap(result, msg);
	}
	
}
