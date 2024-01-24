package com.util;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;

import javax.servlet.http.HttpServletResponse;

public class FileManager {

	public static boolean doFileDownload(HttpServletResponse response, String saveFileName, String originalFileName,
			String path) {

		try {
			// 파일 위치
			String filePath = path + File.separator + saveFileName;

			// 한글 파일 디코딩
			originalFileName = new String(originalFileName.getBytes("euc-kr"), "ISO-8859-1");

			File f = new File(filePath);

			if (!f.exists()) {
				// 파일이 없으면
				return false;
			}

			response.setContentType("application/octet-stream");
			// 헤더 설정 ( application/octet-stream - 이진수라는 뜻 )
			
			response.setHeader("Content-disposition", "attachment;fileName=" + originalFileName);
			// Content-disposition은 헤더 - 브라우저가 서버로부터 받은 컨텐츠를 어떻게 처리해야하는지
			// attachment - 파일을 다운로드하도록 지정, originalFileName - 원본 파일 이름
			
			BufferedInputStream bis = new BufferedInputStream(new FileInputStream(f));

			OutputStream out = response.getOutputStream();

			int data;
			byte buffer[] = new byte[4096];

			while ((data = bis.read(buffer, 0, 4096)) != -1) {
				out.write(buffer, 0, data);
			}

			out.flush();
			out.close();
			bis.close();

		} catch (Exception e) {
			System.out.println(e.toString());
			return false;
		}

		return true;

	}

	public static void doFileDelete(String fileName, String path) {

		try {
			// 파일 위치 + 이름
			String filePath = path + File.separator + fileName;

			File f = new File(filePath);

			if (f.exists()) {
				// 파일이 존재하면 파일 삭제
				f.delete();
			}

		} catch (Exception e) {
			System.out.println(e.toString());
		}

	}

}
