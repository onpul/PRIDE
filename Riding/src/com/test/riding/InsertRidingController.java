/*==================================
   AdminReportListController.java
==================================*/

package com.test.riding;


import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.test.login.IRidingDAO;


// 컨트롤러 등록
@Controller
public class InsertRidingController
{
	@Autowired
	private SqlSession sqlSession;
	
	// 라이딩 모임 생성 폼
	@RequestMapping(value = "/insertridingform.action", method = RequestMethod.GET )
	public String createMeetForm(HttpServletRequest request, Model model)
	{
		String result = null;
		
		HttpSession session = request.getSession();
		
		String user_id= String.valueOf(session.getAttribute("user_id"));
		
		//System.out.println("user_id: " + user_id);
		
		IInsertRidingDAO dao = sqlSession.getMapper(IInsertRidingDAO.class);
		
		// 성별 조건, 나이 조건 가져오기
		Map<String, String> preference = dao.preference(user_id);
		
		//System.out.println("sex: " + preference.get("sex"));
		//System.out.println(preference.get("age_p_id"));
		
		String sex = preference.get("sex");
		String age_p_id = preference.get("age_p_id");
		
		// 성별 조건, 나이 조건 보내주기
		model.addAttribute("sex", sex);
		model.addAttribute("age_p_id", age_p_id);
		
		result = "/WEB-INF/riding/CreateMeet.jsp";
		
		return result;
	}
	
	// 라이딩 모임 생성
	@RequestMapping(value = "/insertriding.action", method = RequestMethod.POST)
	public String createMeet(HttpServletRequest request, InsertRidingDTO dto)
	{
		String result = null;
		
		HttpSession session = request.getSession();
		
		String user_id = null;
		
		user_id = String.valueOf(session.getAttribute("user_id"));
		
		// 세션에 아이디가 없다면... 임시..
		if(user_id == null)
			user_id = "2";
		
		//System.out.println(user_id);
		
		IInsertRidingDAO dao = sqlSession.getMapper(IInsertRidingDAO.class);
		
		if (dto.getMeet_detail().trim().equals(""))
			dto.setMeet_detail("없음");
		if (dto.getStart_detail().trim().equals(""))
			dto.setStart_detail("없음");
		if (dto.getEnd_detail().trim().equals(""))
			dto.setEnd_detail("없음");
		if (dto.getComments().trim().equals(""))
			dto.setComments("없음");
		
		dto.setUser_id(user_id);
		
		
		// 모임 insert 후, 경유지도 insert
		if (dao.insertRiding(dto) > 0)
		{
			//System.out.println(dto.getRiding_id());
			// 경유지 없어도 "" 로 1개는 무조건 들어오기 때문에..
			if ( !(dto.getAddress().size() == 1 && dto.getAddress().get(0).trim().equals("")) )
			{
				String riding_id = dto.getRiding_id();
				
				// 경유지 insert 하는 과정
				for (int i = 0; i < dto.getAddress().size(); i++)
				{
					if(!dto.getAddress().get(0).trim().equals(""))
					{
						String latitude = ((ArrayList<String>)dto.getLatitude()).get(i);
						String longitude = ((ArrayList<String>)dto.getLongitude()).get(i);
						String address = ((ArrayList<String>)dto.getAddress()).get(i);
						
						String detail_address = "없음";
						
						if (!dto.getDetail_address().get(i).trim().equals(""))
							detail_address = dto.getDetail_address().get(i);
						
						dao.insertRidingPoint(riding_id, latitude, longitude, address, detail_address);
					}				
				}
			}
			
			//System.out.println(dto.getCreated_date());
			
			// 방장 자신을 참여중인 명단에 추가
			dao.insertParticipatedMember(dto);
		}
		
		result = "redirect:main.action";
		
		return result;
	}
	
	// 라이딩 모임 수정 폼
	@RequestMapping(value = "/updateridingform.action", method = RequestMethod.GET )
	public String updateRidingForm(HttpServletRequest request, Model model, String riding_id)
	{
		String result = "";
		
		HttpSession session = request.getSession();
		
		String user_id= String.valueOf(session.getAttribute("user_id"));
		
		IRidingDAO dao = sqlSession.getMapper(IRidingDAO.class);
		
		RidingDTO dto = dao.ridingDetailList(Integer.parseInt(riding_id)).get(0);
		
		model.addAttribute("riding", dto);
		
		// 경유지 존재하면 가져오기
		if ( dao.checkRidingPoint(riding_id) > 0 )
			model.addAttribute("points", dao.ridingPointDetailList(riding_id));
		
		// 방장의 성별 조건, 나이 조건 가져오기
		Map<String, String> preference = dao.preference(user_id);
		
		// 방장의 성별 조건, 나이 조건 보내주기
		String sex = preference.get("sex");
		String age_p_id = preference.get("age_p_id");
		
		model.addAttribute("sex", sex);
		model.addAttribute("age_p_id", age_p_id);
		
		result = "/WEB-INF/riding/UpdateMeet.jsp";
		
		return result;
	}
	
	// 지도 검색 열기
	@RequestMapping(value = "/searchmap.action", method = RequestMethod.GET )
	public String searchMap(Model model, String openType)
	{
		String result = null;
		
		result = "/WEB-INF/mapapi/KakaoSearchMap.jsp";
		
		model.addAttribute("openType", openType);
		
		return result;
	}
	
	// 생성 폼에서 지점 지도 열기
	@RequestMapping(value = "/displaymap.action", method = RequestMethod.GET )
	public String displayMap()
	{
		String result = null;
		
		result = "/WEB-INF/mapapi/KakaoMap.jsp";
		
		return result;
	}
	
	// 모임 삭제하기
	@RequestMapping(value = "/deleteriding.action")
	public String deleteRiding(@RequestParam String riding_id)
	{
		String result = null;
		
		IInsertRidingDAO dao = sqlSession.getMapper(IInsertRidingDAO.class);
		
		dao.deleteRiding(riding_id);
		
		result = "ridinglist.action";
		
		return result;
	}
	
	// 모임 나가기
	@RequestMapping(value = "/exitriding.action")
	public String exitRiding(@RequestParam String riding_id, @RequestParam String user_id)
	{
		String result = null;
		
		IInsertRidingDAO dao = sqlSession.getMapper(IInsertRidingDAO.class);
		
		dao.exitRiding(user_id, riding_id);
		
		result = "ridinglist.action";
		
		return result;
	}
	
}
