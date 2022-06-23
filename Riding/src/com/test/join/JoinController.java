package com.test.join;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.test.login.IRidingDAO;
import com.test.login.UserDTO;

@Controller
@SessionAttributes("user_id") // 세션 객체에 저장
public class JoinController
{
	@Autowired
	private SqlSession sqlSession;
	
	// JoinForm.jsp 요청(joinform.action)
	@RequestMapping(value ="/joinform.action", method = RequestMethod.GET)
	public String joinForm()
	{
		String result = null;
		result = "/WEB-INF/login/JoinForm.jsp";
		return result;
	}
	
	// 회원가입(join.action)
	@RequestMapping(value="/join.action")
	@ResponseBody
	public String join(UserDTO dto) 
	{
		System.out.println("---회원가입 컨트롤러 진입---");
		
		int result = 0;
		String resultstr = "0";
		IRidingDAO dao = sqlSession.getMapper(IRidingDAO.class);
		
		System.out.println(dto.getSex());
		
		try
		{
			// 탈퇴한 회원인지 체크
			result = dao.withdrawCheck(dto.getEmail(), dto.getBirthday());
			
			System.out.println("dao.withdrawCheck = " + result);
			
			// 탈퇴한 회원이라면
			if (result > 0)
			{
				System.out.println("result > 0");
				resultstr = "1";
				System.out.println("resultstr = " + resultstr);
			}
			else if (result <= 0) // 탈퇴한 회원이 아니라면 회원가입 진행
			{
				System.out.println("result <= 0");
				
				dao.join(dto);
				
				// 회원가입한 user_id 를 set
				dto.setUser_id(dao.getUser());
				
				// 개인정보 입력
				dao.profile(dto);
				
				resultstr = "0";
				System.out.println("resultstr = " + resultstr);
			}
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		
		System.out.println("resultstr = " + resultstr);
		return resultstr;
		
	}
	
	// 닉네임 중복체크 버튼 클릭 시 요청(nickcheck.action)
	@RequestMapping(value="/nickcheck.action", method = RequestMethod.POST)
	@ResponseBody
	public String duplicationNickCheckAction(String nickname)
	{
		System.out.println("duplicationNickCheckAction() 진입 ");
		System.out.println("nickname = " + nickname);
		
		IRidingDAO dao = sqlSession.getMapper(IRidingDAO.class);
		
		int result = 0;
		
		try
		{
			result = dao.duplicationNickCheck(nickname);
			
			if (result > 0)
			{
				result = 1;
			}
			else
				result = 0;
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		
		String resultstr = Integer.toString(result);
		
		return resultstr;
	}
}
