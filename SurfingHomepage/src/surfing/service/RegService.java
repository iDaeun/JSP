package surfing.service;

import java.io.File;
import java.io.UnsupportedEncodingException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import jdbc.ConnectionProvider;
import surfing.dao.Dao;
import surfing.model.MemberInfo;

public class RegService implements SurfingService {

	boolean photo = false;
	
	// 파일 업로드
	public MemberInfo fileUpload(HttpServletRequest request) {

		// (1) 파일 저장

		// 사진파일 저장
		String id = "";
		String pw = "";
		String name = "";
		String pNum = "";
		int level = 0;
		String photo = "";
		
		String savedPhoto = "";
		
		long fileSize = 0;
		boolean IsPhoto = false;
		boolean memory = false;
		String type = "";
		String dir = "";

		// memberInfo 객체에 저장
		MemberInfo memberInfo = new MemberInfo();

		// upload할 경로
		String uploadPath = "/member_photo_upload";
		dir = request.getSession().getServletContext().getRealPath(uploadPath);

		System.out.println("내가 지정한경로:" + dir);

		// 1. multipart/form-data 여부 확인
		boolean isMultipart = ServletFileUpload.isMultipartContent(request);

		if (isMultipart) {

			// 2. 메모리나 파일로 업로드 데이터를 보관하는 factory설정
			DiskFileItemFactory factory = new DiskFileItemFactory();

			// 3. 업로드 요청 처리하는 ServletFileUpload생성
			ServletFileUpload upload = new ServletFileUpload(factory);

			// 업로드 기준값
			// factory.setSizeThreshold(sizeThreshold);
			// upload.setSizaMax(-1); : 업로드 바이트는 무제한

			// 4. 업로드 요청 파싱 -> FileItem목록 구함
			List<FileItem> items;
			try {

				items = upload.parseRequest(request);
				Iterator<FileItem> itr = items.iterator();

				while (itr.hasNext()) {

					FileItem item = itr.next();

					// type 구별해주기
					if (item.isFormField()) {
						// type != file
						if (item.getFieldName().equals("id")) {
							id = item.getString("utf-8");
							memberInfo.setId(id); // id저장
						}

						if (item.getFieldName().equals("pw")) {
							pw = item.getString("utf-8");
							memberInfo.setPw(pw); // pw저장
						}

						if (item.getFieldName().equals("name")) {
							name = item.getString("utf-8");
							memberInfo.setName(name); // name저장
						}
						
						if (item.getFieldName().equals("pNum")) {
							pNum = item.getString("utf-8");
							memberInfo.setpNum(pNum); // pNum저장
						}
						
						if (item.getFieldName().equals("level")) {
							level = Integer.parseInt(item.getString());
							memberInfo.setLevel(level); // level저장
						}

					} else {
						// type == file
						if (item.getFieldName().equals("photo")) {
							photo = item.getName(); // 파일이름
							fileSize = item.getSize(); // 파일 사이즈
							memory = item.isInMemory(); // 메모리 여부
							type = item.getContentType(); // 파일타입

							// 파일 골랐을때만 파일 업로드 진행
							if (fileSize > 0) {

								// 중복되지 않도록 이름 처리
								savedPhoto = System.nanoTime() + "_" + photo;

								// 파일 업로드
								item.write(new File(dir, savedPhoto));
								System.out.println("사진write");

								memberInfo.setPhoto(savedPhoto); // 사진저장
							
								IsPhoto = true;
								
								request.setAttribute("IsPhoto", IsPhoto);
								request.setAttribute("savedPhoto", savedPhoto);
								request.setAttribute("fileSize", fileSize);
								request.setAttribute("type", type);
								request.setAttribute("dir", dir);
								request.setAttribute("memory", memory);
								

							}
						}
					}
				}

			} catch (FileUploadException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (UnsupportedEncodingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		}

		return memberInfo;

	}

	@Override
	public String getViewName(HttpServletRequest request, HttpServletResponse response) {

		String viewPage = "/WEB-INF/view/regProcess.jsp";


		// (2) 회원 정보 입력
		Connection conn = null;
		int rCnt = 0;

		try {

			conn = ConnectionProvider.getConnection();
			Dao dao = Dao.getInstance();

			MemberInfo memberInfo = fileUpload(request);
			
			System.out.println(memberInfo);
			
			rCnt = dao.insertMem(conn, memberInfo);
			
			System.out.println(rCnt);

		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		request.setAttribute("rCnt", rCnt);
		
		return viewPage;
	}

}
