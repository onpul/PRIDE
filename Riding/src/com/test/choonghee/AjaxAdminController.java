/*==================================
   AdminReportListController.java
==================================*/

package com.test.choonghee;

import java.util.ArrayList;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.util.model.CalculatePage;


// 컨트롤러 등록
@Controller
public class AjaxAdminController
{
	@Autowired
	private SqlSession sqlSession;
		
	// 관리자용. 신고 내역 조회. AJAX.
	@RequestMapping(value = "/ajaxreportlist.action", method = RequestMethod.POST)
	public void ajaxReportList(String page, String orderBy, String status
			, String type, HttpServletResponse response)
	{
		//System.out.println("접속!");
		
		System.out.println("page: " +page+ "/ status: " + status + "/ type: " +type);
		
		IViewReportListDAO dao = sqlSession.getMapper(IViewReportListDAO.class);
		
		// where, order by 조건문 설정
		String[] conds = CalculatePage.pageCondition(status, type, orderBy);
		String where = conds[0];
		
		orderBy = conds[1];
		
		// 한 페이지 게시물 수
		int numPerPage = 5;
		
		// 총 게시물 수
		int total = dao.count(where);
		
		//System.out.println("토탈: " + total);
		
		// 첫 게시글 글번호, 마지막 게시글 글번호
		int[] pages = CalculatePage.calStartAndEnd(total, Integer.parseInt(page.trim()), numPerPage);
		int start = pages[0];
		int end = pages[1];
		
		ArrayList<ViewReportListDTO> list;
		
		//System.out.println(start);
		//System.out.println(end);
		
		// 해당 글 불러오기
		list = dao.listPage(where, orderBy, start, end);
		
		// json으로 보낼 수 있게 편집
		String json = "";
		StringBuffer sb = new StringBuffer();
		for (ViewReportListDTO i : list)
		{
			sb.append("{");
			sb.append("\"r_id\":\"" + i.getR_id() + "\",");
			sb.append("\"user_id\":\"" + i.getUser_id() + "\",");
			sb.append("\"nickname\":\"" + i.getNickname() + "\",");
			sb.append("\"report_date\":\"" + i.getReport_date() + "\",");
			sb.append("\"status\":\"" + i.getStatus() + "\",");
			sb.append("\"status_id\":\"" + i.getStatus_id() + "\",");
			sb.append("\"report_type\":\"" + i.getReport_type() + "\",");
			sb.append("\"content\":\"" + i.getContent() + "\",");
			//System.out.println(i.getContent());
			sb.append("\"num\":\"" + i.getNum() + "\"");
			sb.append("},");
		}
		json = sb.toString();
		
		if(!json.equals(""))
			json = json.substring(0, json.length()-1);
		json = "[" + json+ "]";
		
				
		try
		{
			// String으로 보내서 프론트에서 json 파싱.
			response.setCharacterEncoding("UTF-8");
			response.getWriter().print(json);
		} catch (Exception e)
		{
			e.toString();
		}
		
	}
	
	// 관리자용. 신고 내역 페이지. AJAX.
	@RequestMapping(value = "/ajaxreportpage.action", method = RequestMethod.POST)
	//public ArrayList<ViewReportListDTO> ajaxReportList(Model model, String page
	//public String ajaxReportList(Model model, String page
	public void ajaxReportPage(String page, String status, String type, HttpServletResponse response)
	{
		//System.out.println("접속!");
		
		System.out.println("page: " +page+ "/ status: " + status + "/ type: " +type);
				
		
		IViewReportListDAO dao = sqlSession.getMapper(IViewReportListDAO.class);
		
		// where 조건문 설정
		String where = CalculatePage.pageCondition(status, type, "none")[0];
		
		// 한 화면에 노출되는 페이지 목록 갯수
		int unitPage = 5;
		
		int[] pageInfo = CalculatePage.calPages(dao.count(where), Integer.parseInt(page), unitPage);
		
		
		
		// JSON양식으로..
		String result = "";
		
		StringBuffer sb = new StringBuffer();
		
		sb.append("{");
		sb.append("\"maxPage\": \"" + pageInfo[0] + "\",");
		sb.append("\"startPage\": \"" + pageInfo[1] + "\",");
		sb.append("\"endPage\": \"" + pageInfo[2] + "\",");
		sb.append("\"prevPage\": \"" + pageInfo[3] + "\",");
		sb.append("\"nextPage\": \"" + pageInfo[4] + "\"");
		sb.append("}");
		
		result = sb.toString();
				
		try
		{
			response.setCharacterEncoding("UTF-8");
			response.getWriter().print(result);
		} catch (Exception e)
		{
			e.toString();
		}
		
	}
	
	// 관리자의 최종 신고 처리
	@RequestMapping(value= "/reportprocess.action", method=RequestMethod.POST)
	public void ajaxReportProcess(String r_id, String status, String report_type, String admin_id
			, HttpServletResponse response)
	{
		IViewReportListDAO dao = sqlSession.getMapper(IViewReportListDAO.class);
		
		if (report_type.equals("1"))
			dao.insertReviewProcess(r_id, admin_id, status);
		else
			dao.insertParticiProcess(r_id, admin_id, status);
		
		System.out.println();
		System.out.println("r_id :" + r_id);
		System.out.println("admin_id :" + admin_id);
		System.out.println("status :" + status);
		
		String result = status.equals("1") ? "승인 처리 완료" : status.equals("2") ? "허위 처리 완료" : "반려 처리 완료";
		
		System.out.println(result);
		try
		{
			//response.setCharacterEncoding("UTF-8");
			response.setContentType("text/html;charset=UTF-8");
			response.getWriter().print(result);
		} catch (Exception e)
		{
			e.toString();
		}
		
	}
}
