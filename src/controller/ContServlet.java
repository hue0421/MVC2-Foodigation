package controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.oreilly.servlet.MultipartRequest;

import dao.ContDao;
import dao.MemberDao;
import vo.Cont;
import vo.Member;
import vo.PageMaker;

@WebServlet("*.do")
public class ContServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final String FILE_REPO = "D:\\day0728\\FoodigationPro2 (2)\\FoodigationPro2\\WebContent\\images\\temp";

	public ContServlet() {
	}

	@SuppressWarnings("unchecked")
	private void doHandle(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		
		PrintWriter out = response.getWriter();

		String requestURI = request.getRequestURI();
		String contextPath = request.getContextPath();
		String action = requestURI.substring(contextPath.length());

		/* ---------- ---------- ---------- ---------- ---------- ---------- ---------- ---------- ---------- ---------- */
		/* ---------- ---------- ---------- ---------- ---------- ---------- ---------- ---------- ---------- ---------- */
		/* ---------- ---------- ---------- ---------- ---------- ---------- ---------- ---------- ---------- ---------- */

		/* index진입점, mainForm contents(사진 9개) 찾아와서 출력, 처음 카테고리 new 라서 최신순으로 출력된다, cno(등록순서)로 내림차순 정렬 */
		if (action.equals("/mainForm.do")) {
			List<Cont> list = ContDao.getInstance().selectAll_New();
			request.setAttribute("list", list);
			request.getRequestDispatcher("food/mainForm.jsp").forward(request, response);
		}

		/* mainForm에 카테고리 바꿀 때 ajax로 json넘겨주는 용도 */
		else if (action.equals("/contentsAjax.do")) {
			String dataID = request.getParameter("dataID");
			List<Cont> list = null;

			switch (dataID) {
			case "category-new":
				list = ContDao.getInstance().selectAll_New();
				break;

			case "category-bab":
				dataID = "RESTAURANT";
				list = ContDao.getInstance().selectCat(dataID);
				break;

			case "category-dessert":
				dataID = "DESSERT";
				list = ContDao.getInstance().selectCat(dataID);
				break;

			case "category-cafe":
				dataID = "CAFE";
				list = ContDao.getInstance().selectCat(dataID);
				break;

			case "category-sool":
				dataID = "BAR";
				list = ContDao.getInstance().selectCat(dataID);
				break;

			case "category-popular":
				list = ContDao.getInstance().selectAll_pop();
				break;

			default:
				break;
			}

			JSONObject totalObject = new JSONObject();
			JSONArray contentArray = new JSONArray();
			/* json date는 전송 불가능 ? */
			for (int i = 0; i < list.size(); i++) {
				JSONObject contentInfo = new JSONObject();
				contentInfo.put("cno", list.get(i).getCno());
				contentInfo.put("name", list.get(i).getName());
				contentInfo.put("review", list.get(i).getReview());
				contentInfo.put("store_name", list.get(i).getStore_name());
				contentInfo.put("point", list.get(i).getPoint());
				contentInfo.put("cat", list.get(i).getCat());
				contentArray.add(contentInfo);
			}
			totalObject.put("contents", contentArray);
			String jsonInfo = totalObject.toJSONString();
			out.print(jsonInfo);
		}
		
		/* ---------- ---------- ---------- ---------- ---------- ---------- ---------- ---------- ---------- ---------- */

		/* 로그인 Form 이동 */
		else if (action.equals("/loginForm.do")) {
			request.getRequestDispatcher("food/loginForm.jsp").forward(request, response);
		}
		
		/* 로그인 로직, header부분 로그아웃 영역 닉네임 표시를 위해 닉네임도 session에 담음 */
		else if (action.equals("/login.do")) {
			String id = request.getParameter("id");
			String pw = request.getParameter("pw");
			String nickname = MemberDao.getInstance().nickname_return(id);

			int n = MemberDao.getInstance().login(id, pw); // 로그인 성공:1, 비밀번호틀림:0
			if (n == 1) {
				HttpSession session = request.getSession();
				session.setAttribute("session_id", id);
				session.setAttribute("session_nickname", nickname);
				out.print("success");
			} else if (n == 0) {
				out.print("password error");
			} else {
				out.print("id error");
			}
		}
		
		/* 로그아웃 실행 */
		else if (action.equals("/logout.do")) {
			HttpSession session = request.getSession();
			session.removeAttribute("session_id");
			session.removeAttribute("session_nickname");
			out.print("success");
			response.sendRedirect("mainForm.do");
		}

		/* 회원가입 Form 이동 */
		else if (action.equals("/joinForm.do")) {
			request.getRequestDispatcher("food/joinForm.jsp").forward(request, response);
		}
		
		/* 회원가입 로직 */
		else if (action.equals("/join.do")) {
			String id = request.getParameter("id");
			String pw = request.getParameter("pw");
			String name = request.getParameter("name");
			String nickname = request.getParameter("nickname");

			boolean flag = MemberDao.getInstance().insert(new Member(id, pw, name, nickname));
			if (flag) {
				out.print("<script>alert('회원가입 성공');location.href='mainForm.do';</script>");
			} else {
				out.print("<script>alert('회원가입 실패');location.href='joinForm.do';</script>");
			}
		}
		
		/* 회원가입 할 때 아이디 중복확인 */
		else if (action.equals("/overappedId.do")) {
			String id = request.getParameter("id");
			boolean flag = MemberDao.getInstance().overappedId(id);
			if (flag) {
				out.print("not usable");
			} else {
				out.print("usable");
			}
		}

		/* ---------- ---------- ---------- ---------- ---------- ---------- ---------- ---------- ---------- ---------- */

		/* 지도 등록 Form 이동 */
		if (action.equals("/mapAddForm.do")) {
			request.getRequestDispatcher("food/mapAddForm.jsp").forward(request, response);
		}

		/* AJAX로 콘텐츠 등록 정보 전송해서 세션 등록 */
		if (action.equals("/mapAddAjax.do")) {
			String name = request.getParameter("name");
			int point = Integer.parseInt(request.getParameter("point"));
			String store_name = request.getParameter("store_name");
			String cat = request.getParameter("cat");
			cat = cat.substring(0, cat.indexOf("&"));
			String review = request.getParameter("review");

			HttpSession session = request.getSession();
			session.setAttribute("session_name", name);
			session.setAttribute("session_point", point);
			session.setAttribute("session_store_name", store_name);
			session.setAttribute("session_cat", cat);
			session.setAttribute("session_review", review);

			request.getRequestDispatcher("food/mapAddForm.jsp").forward(request, response);
		}
		
		/* 지도 등록 버튼 누르면 지도 위치 request등록하고 콘텐츠 등록 Form 이동 */
		if (action.equals("/mapAdd.do")) {
			String where = request.getParameter("where");
			request.setAttribute("where", where);
			request.getRequestDispatcher("food/addContentForm.jsp").forward(request, response);
		}
		
		/* ---------- ---------- ---------- ---------- ---------- ---------- ---------- ---------- ---------- ---------- */
		
		/* 콘텐츠 추가 Form 이동 */
		if (action.equals("/addContentForm.do")) {
			request.getRequestDispatcher("food/addContentForm.jsp").forward(request, response);
		}
		
		/* 콘텐츠 추가 로직 */ 
		else if (action.equals("/addcontent.do")) {
			/* 지도등록 할 때 사용한 세션 제거 (세션 제거를 등록하기를 눌러야만 제거가 된다)*/
			HttpSession session = request.getSession();
			session.removeAttribute("session_name");
			session.removeAttribute("session_store_name");
			session.removeAttribute("session_point");
			session.removeAttribute("session_review");
			session.removeAttribute("session_cat");

			Map<String, String> ContentMap = upload(request, response); 
			String name = ContentMap.get("name");
			String review = ContentMap.get("review");
			int point = Integer.parseInt(ContentMap.get("point"));
			String store_name = ContentMap.get("store_name");
			String writer = (String) session.getAttribute("session_id");
			String map = ContentMap.get("map");
			String cat = ContentMap.get("cat");
			if (cat.contains("&")) cat = cat.substring(0, cat.indexOf("&"));
			System.out.println(name + "," + writer);
			String img_name = ContentMap.get("filename"); 
			
			/* 조회수, 작성일, 번호는 default로 들어간다 */
			boolean flag = ContDao.getInstance().insert(new Cont(name, review, store_name, point, cat, writer, map, img_name));

			if (flag) {
				out.print("<script>alert('게시글 등록 성공');location.href='mainForm.do';</script>");
			} else {
				out.print("<script>alert('게시글 등록 실패');location.href='addContentForm.do';</script>");
			}
		}
		
		/* 콘텐츠 등록할 때 결과 미리보기 */
		else if (action.equals("/preview.do")) {
			HttpSession session = request.getSession();
			// request.setAttribute("where", request.getParameter("where"));

			String name=request.getParameter("name");
			String store_name=request.getParameter("store_name");
			String review=request.getParameter("review");
			int point=Integer.parseInt(request.getParameter("point"));
			String cat=request.getParameter("cat");
			String writer = (String) session.getAttribute("session_id"); 
			String map=request.getParameter("map");
			String img_name="";
			
			Cont cont = new Cont(name, store_name, review, point, cat, writer, map, img_name);
			request.setAttribute("cont", cont);

			request.getRequestDispatcher("food/viewForm.jsp").forward(request, response);
		}
		
		/* 콘텐츠 상세보기 페이지 */
		else if (action.equals("/viewDetails.do")) {
			int cno=Integer.parseInt(request.getParameter("cno"));
			ContDao contDao = ContDao.getInstance();
			Cont cont = contDao.selectOne(cno);
			contDao.updateReadCount(cno); /* 조회수 업데이트 */
			request.setAttribute("cont", cont);
			request.getRequestDispatcher("food/viewForm.jsp").forward(request, response);
		}
		
		/* 콘텐츠 리스트 */
		else if (action.equals("/listForm.do")) {
			String category = request.getParameter("cat");
			String strPage = request.getParameter("pageNum");
			int pageNum = 1;
			
			if (strPage != null) {
				pageNum = Integer.parseInt(strPage);
			}
			
			ContDao contDao = ContDao.getInstance();
			int totalCount = contDao.getContentCount();
			PageMaker pageM = new PageMaker(pageNum, totalCount);
			List<Cont> list = contDao.selectAll(pageM.getStart(), pageM.getEnd(),category);

			request.setAttribute("cat", category);
			request.setAttribute("pageM", pageM);
			request.setAttribute("list", list);
			
			request.getRequestDispatcher("food/listForm.jsp").forward(request, response);
		}
		
		else if (action.equals("/mypageForm.do")) {
			String writer=null;
			writer=request.getParameter("writerOther");
			
			HttpSession session = request.getSession();
			if(writer==null) {
				writer = (String) session.getAttribute("session_id");
				System.out.println("내 글 보기");
			}
			List<Cont> list = ContDao.getInstance().selectAll_writer(writer);
			System.out.println(list);
			
			request.setAttribute("list", list);
			request.getRequestDispatcher("food/mypageForm.jsp").forward(request, response);
		}
		
		else if (action.equals("/delete.do")) {
			int cno=Integer.parseInt(request.getParameter("cno"));
			ContDao.getInstance().deleteContent(cno);
			request.getRequestDispatcher("mainForm.do").forward(request, response);
		}
		/* ---------- ---------- ---------- ---------- ---------- ---------- ---------- ---------- ---------- ---------- */
		/* ---------- ---------- ---------- ---------- ---------- ---------- ---------- ---------- ---------- ---------- */
		/* ---------- ---------- ---------- ---------- ---------- ---------- ---------- ---------- ---------- ---------- */
	}

	/* 파일 업로드용 메서드 */
	@SuppressWarnings("unused")
	private Map<String, String> upload(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Map<String, String> contentMap = new HashMap<String, String>();
		String encoding = "utf-8";
		File currentDirPath = new File(FILE_REPO);
		DiskFileItemFactory factory = new DiskFileItemFactory();
		factory.setRepository(currentDirPath);
		factory.setSizeThreshold(5 * 1024 * 1024);

		factory.setDefaultCharset(encoding);

		ServletFileUpload upload = new ServletFileUpload(factory);

		try {
			List<FileItem> items = upload.parseRequest(request);
			for (int i = 0; i < items.size(); i++) {
				FileItem item = (FileItem) items.get(i);
				if (item.isFormField()) {
					System.out.println(item.getFieldName() + ":" + item.getString());
					contentMap.put(item.getFieldName(), item.getString());
				} else {
					System.out.println("파라미터명:" + item.getFieldName());
					System.out.println("파일명:" + item.getName());
					System.out.println("파일의 크기:" + item.getSize());

					if (item.getSize() > 0) {
						int idx = item.getName().lastIndexOf("\\");
						if (idx == -1) {
							idx = item.getName().lastIndexOf("/");
						}
						String fileName = item.getName().substring(idx + 1);
						File uploadFile = new File(currentDirPath + "\\" + fileName);

						contentMap.put(item.getFieldName(), fileName);
						item.write(uploadFile);
					}
				}
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return contentMap;
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doHandle(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doHandle(request, response);
	}
}