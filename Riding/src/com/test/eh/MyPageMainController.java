package com.test.eh;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import org.apache.ibatis.session.SqlSession;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

public class MyPageMainController implements Controller
{
	private IMyPageMainDAO dao;
	
	// 사용자 정의 생성자는 기본 생성자도 만들어줘야함!!
	public void setDao(IMyPageMainDAO dao)
	{
		this.dao = dao;
	}

	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		ModelAndView mav = new ModelAndView();
		
		ArrayList<MyPageMainDTO> result = new ArrayList<MyPageMainDTO>();
		
		//이전페이지로부터 user_id 수신
		//String user_id = request.getParameter("user_id");
		
		// 세션 받기
		HttpSession session = request.getSession();
		//session.getAttribute("user_id");
		System.out.println("세션으로 받은 user_id : " + session.getAttribute("user_id"));
		
		
		String user_id = Integer.toString((Integer)session.getAttribute("user_id"));
		
		
		
		
		//System.out.println("왜 뷰는 안보여줘");
		// !! 현재는 임시 session 사용전!
		//String user_id = "83";
		//String user_id ="82";
		
		//result = dao.memberList((String)session.getAttribute("user_id"));
		
		
		result = dao.memberList(user_id);
		
		
		
		// 뷰 에게 넘겨줄 데이터
		
		String email = "";
		String nickname = "";
		String oneword="";
		String pi_address="";
		
		//System.out.println(result.size());
		for (MyPageMainDTO dto : result)
		{
			email = dto.getEmail();
			nickname = dto.getNickname();
			oneword = dto.getOneword();
			pi_address = dto.getPi_address();
		}
		mav.addObject("user_id", user_id);
		//System.out.println(user_id);
		mav.addObject("email", email);
		//System.out.println(email);
		mav.addObject("nickname", nickname);
		mav.addObject("oneword", oneword);
		mav.addObject("pi_address", pi_address);
		System.out.println("잠시만여");
		mav.setViewName("/WEB-INF/eh/MyPageMain.jsp");
		return mav;
	}
	
}
