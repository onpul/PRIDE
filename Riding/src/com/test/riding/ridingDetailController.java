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
import com.test.login.RidingDTO;
import com.test.login.UserDTO;

@Controller
@SessionAttributes("user_id") // 세션 객체에 저장
public class ridingDetailController
{
	@Autowired
	private SqlSession sqlSession;
	
	// 라이딩 상세보기 페이지 요청(ridingdetail.action) 
	@RequestMapping(value = "/ridingdetail.action", method = RequestMethod.GET)
	public String ridingDetail(Model model, RidingDTO dto, UserDTO udto)
	{
		String result = null;
		
		IRidingDAO dao = sqlSession.getMapper(IRidingDAO.class);
		
		model.addAttribute("ridingDetailList", dao.ridingDetailList(Integer.parseInt(dto.getRiding_id())));
		
		//System.out.println("dto.getRiding_id() = " + dto.getRiding_id());
		
		// 참여한 회원 user_id 명단
		ArrayList<RidingDTO> ridingMember = new ArrayList<RidingDTO>();
		ridingMember = dao.ridingMember(Integer.parseInt(dto.getRiding_id()));
		
		for (int i = 0; i < ridingMember.size(); i++)
		{
			System.out.println(i + " = " + ridingMember.get(i).getUser_id());
		}
		
		result = "WEB-INF/riding/RidingDetail.jsp";
		return result;
	}
}
