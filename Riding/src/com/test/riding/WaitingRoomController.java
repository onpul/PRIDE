package com.test.riding;

import java.util.ArrayList;

import org.apache.catalina.servlet4preview.http.HttpServletRequest;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.test.login.IRidingDAO;
import com.test.login.UserDTO;

@Controller
@SessionAttributes("user_id") // 세션 객체에 저장
public class WaitingRoomController
{
	@Autowired
	private SqlSession sqlSession;
	
	// 라이딩 대기실 페이지 요청(waitingroom.action) 
	@RequestMapping(value = "/waitingroom.action", method = RequestMethod.GET)
	public String ridingDetail(Model model, @RequestParam("user_id")int user_id, @RequestParam("riding_id")int riding_id)
	{
		String result = "";
		
		IRidingDAO dao = sqlSession.getMapper(IRidingDAO.class);
		
		model.addAttribute("ridingDetailList", dao.ridingDetailList(riding_id));
		
		//System.out.println("dto.getRiding_id() = " + riding_id);
		
		// 경유지 존재한다면 경유지 리스트 뽑아오기
		if ( dao.checkRidingPoint(String.valueOf(riding_id)) > 0 )
			model.addAttribute("ridingPoint", dao.ridingPointDetailList( String.valueOf(riding_id) ));
		
		// 해당 모임의 준비 완료 여부
		// 0 이면 준비 X, 1이면 준비 O
		model.addAttribute("checkReady", dao.checkReady(riding_id, user_id));
		
		
		// 참여한 회원 user_id 명단
		// 우선 참여한 회원 명단에서, 특정 riding_id 모임에 참여한 유저 id를 뽑아옴. 이 때 partici_date도 뽑아옴
		ArrayList<RidingDTO> ridingMember = new ArrayList<RidingDTO>();
		ridingMember = dao.ridingMember(riding_id);
		
		ArrayList<UserDTO> memberProfile = new ArrayList<UserDTO>();
		//memberProfile = dao.memberProfile(user_id);
		
		//System.out.println("ridingMember.size() = " + ridingMember.size());
		
		result += "[";
		for (int i = 0; i < ridingMember.size(); i++)
		{
			result += "{\"user_id\":\"" + ridingMember.get(i).getUser_id() + "\",";
			
			//해당 user의 profile 정보 가져오기.
			memberProfile = dao.memberProfile(ridingMember.get(i).getUser_id());
			//System.out.println("memberProfile.size() = " + memberProfile.size());
			
			// 해당 user 프로필 정보
			result += "\"pi_address\":\"" + memberProfile.get(0).getPi_address() + "\",";
			result += "\"nickname\":\"" + memberProfile.get(0).getNickname() + "\",";
			result += "\"introduce\":\"" + memberProfile.get(0).getIntroduce() + "\",";
			result += "\"sex\":\"" + memberProfile.get(0).getSex() + "\",";
			// 참여한 날짜도 뽑아줌
			result += "\"partici_date\":\"" + ridingMember.get(i).getPartici_date() + "\",";
			
			result += "\"agegroup\":\"" + memberProfile.get(0).getAgegroup() + "\"}";
			
			if (i != ridingMember.size()-1)
			{
				result += ",";
			}
		}
		result += "]";
		//System.out.println(result);
		model.addAttribute("memberList", result);
		
		String url = "WEB-INF/riding/WaitingRoom.jsp";
		
		return url;
	}
	
	// 준비 완료 or 준비 취소 AJAX
	@RequestMapping(value = "getready.action", method= RequestMethod.GET)
	@ResponseBody
	public String getReady(String ready, String user_id)
	{
		String result = "";
		
		IRidingDAO dao = sqlSession.getMapper(IRidingDAO.class);
		
		result = String.valueOf(dao.getReady(ready, user_id));
		
		System.out.println(result);
		
		return result;
	}
}
