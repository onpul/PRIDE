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


// 컨트롤러 등록
@Controller
public class InsertRidingController
{
	@Autowired
	private SqlSession sqlSession;
	
	// 라이딩 모임 생성 폼
	@RequestMapping(value = "/insertridingform.action", method = RequestMethod.GET )
	public String createMeetForm()
	{
		String result = null;
				
		result = "/choonghee/CreateMeet.jsp";
		
		return result;
	}
	
	// 라이딩 모임 생성
	@RequestMapping(value = "/insertriding.action", method = RequestMethod.POST)
	public String createMeet(HttpServletRequest request, InsertRidingDTO dto)
	{
		String result = null;
		
		HttpSession session = request.getSession();
		
		int userId = (Integer) session.getAttribute("user_id");
		
		
		String user_id =  Integer.toString(userId);
		
		System.out.println(user_id);
		
		// 세션에 아이디가 없다면... 임시..
		if(user_id == null)
			user_id = "2";
		
		
		
		IInsertRidingDAO dao = sqlSession.getMapper(IInsertRidingDAO.class);
		
		if (dto.getMeet_detail().equals(""))
			dto.setMeet_detail("없음");
		if (dto.getStart_detail().equals(""))
			dto.setStart_detail("없음");
		if (dto.getEnd_detail().equals(""))
			dto.setEnd_detail("없음");
		if (dto.getComments().equals(""))
			dto.setComments("없음");
		
		
		// 모임 insert 후, 경유지도 insert
		if (dao.insertRiding(dto) > 0)
		{
			System.out.println(dto.getRiding_id());
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
						
						if (!dto.getDetail_address().get(i).equals(""))
							detail_address = dto.getDetail_address().get(i);
						
						dao.insertRidingPoint(riding_id, latitude, longitude, address, detail_address);
					}				
				}
			}
		}
		
		result = "redirect:main.action";
		
		return result;
	}
	
	
	// 지도 열기
	@RequestMapping(value = "/searchmap.action", method = RequestMethod.GET )
	public String searchMap(Model model, String openType)
	{
		String result = null;
		
		result = "/choonghee/KakaoSearchMap.jsp";
		
		model.addAttribute("openType", openType);
		
		return result;
	}
}
