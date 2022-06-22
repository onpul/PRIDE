/*==================================
   AdminReportListController.java
==================================*/

package com.test.choonghee;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.util.model.CalculatePage;


// 컨트롤러 등록
@Controller
public class AdminReportListController
{
	@Autowired
	private SqlSession sqlSession;
		
	// 관리자용. 신고 내역 조회
	@RequestMapping(value = "/reportlist.do", method = RequestMethod.GET)
	public String reportList(Model model, HttpServletRequest request)
	{
		String result = null;
		
		IViewReportListDAO dao = sqlSession.getMapper(IViewReportListDAO.class);
		
		// 한 페이지에 글 갯수
		int numPerPage = 5;
		
		// 노출되는 페이지 목록 갯수
		int unitPage = 5;
		
		model.addAttribute("list", dao.list(numPerPage));
		
		int[] pageInfo = CalculatePage.calPages(dao.count(""), 1, unitPage);
		
		model.addAttribute("maxPage", pageInfo[0]);
		model.addAttribute("startPage", pageInfo[1]);
		model.addAttribute("endPage", pageInfo[2]);
		model.addAttribute("prevPage", pageInfo[3]);
		model.addAttribute("nextPage", pageInfo[4]);
		
		result = "/choonghee/ReportList.jsp";
		
		return result;
	}
	
	@RequestMapping(value = "/reportdetail.do", method = RequestMethod.GET)
	public String reportDetail(Model model, String r_id)
	//public String reportDetail(Model model)
	{
		String result = null;
		
		IViewReportListDAO dao = sqlSession.getMapper(IViewReportListDAO.class);
		
		
		String where = "WHERE R_ID='" + r_id + "'";
				
		ArrayList<ViewReportListDTO> list = dao.listDetail(where); 
		
		model.addAttribute("detail", list);
		
		if (list.get(0).getReport_type().equals("REVIEW"))
			model.addAttribute("content", dao.reviewContent(list.get(0).r_id));
		
		result = "/choonghee/ReportDetail.jsp";
		
		return result;
	}
	
	
}
