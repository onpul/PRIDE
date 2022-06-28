package com.test.riding;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.test.login.IRidingDAO;
import com.test.login.UserDTO;

@Controller
@SessionAttributes("user_id") // 세션 객체에 저장
public class RidingDetailController
{
	@Autowired
	private SqlSession sqlSession;
	
	// 라이딩 상세보기 페이지 요청(ridingdetail.action) 
	@RequestMapping(value = "/ridingdetail.action", method = RequestMethod.GET)
	public String ridingDetail(Model model, RidingDTO dto, UserDTO udto)
	{
		String result = "";
		
		IRidingDAO dao = sqlSession.getMapper(IRidingDAO.class);
		
		model.addAttribute("ridingDetailList", dao.ridingDetailList(Integer.parseInt(dto.getRiding_id())));
		
		//System.out.println("dto.getRiding_id() = " + dto.getRiding_id());
		
		// 경유지 존재한다면 경유지 리스트 뽑아오기
		if ( dao.checkRidingPoint(dto.getRiding_id()) > 0 )
			model.addAttribute("ridingPoint", dao.ridingPointDetailList( dto.getRiding_id() ));
		
		//System.out.println(dao.ridingPointDetailList( dto.getRiding_id() ));
		
		// 참여한 회원 user_id 명단
		ArrayList<RidingDTO> ridingMember = new ArrayList<RidingDTO>();
		ridingMember = dao.ridingMember(Integer.parseInt(dto.getRiding_id()));
		ArrayList<UserDTO> memberProfile = new ArrayList<UserDTO>();
		//memberProfile = dao.memberProfile(user_id);
		
		//System.out.println("ridingMember.size() = " + ridingMember.size());
		
		result += "[";
		for (int i = 0; i < ridingMember.size(); i++)
		{
			
			
			result += "{\"user_id\":\"" + ridingMember.get(i).getUser_id() + "\",";
			
			memberProfile = dao.memberProfile(ridingMember.get(i).getUser_id());
			//System.out.println("memberProfile.size() = " + memberProfile.size());
			
			result += "\"pi_address\":\"" + memberProfile.get(0).getPi_address() + "\",";
			result += "\"nickname\":\"" + memberProfile.get(0).getNickname() + "\",";
			result += "\"introduce\":\"" + memberProfile.get(0).getIntroduce() + "\",";
			result += "\"sex\":\"" + memberProfile.get(0).getSex() + "\",";
			result += "\"agegroup\":\"" + memberProfile.get(0).getAgegroup() + "\"}";
			
			if (i != ridingMember.size()-1)
			{
				result += ",";
			}
		
			
		}
		result += "]";
		//System.out.println(result);
		model.addAttribute("memberList", result);
		
		String url = "WEB-INF/riding/RidingDetail.jsp";
		
		return url;
	}
}
