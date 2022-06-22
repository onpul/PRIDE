package com.test.login;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

@Controller
@SessionAttributes("user_id") // 세션 객체에 저장
public class loginController
{
	@Autowired
	private SqlSession sqlSession;
	
	// 로그인 폼 요청(loginform.action)
	@RequestMapping(value = "/loginform.action", method = RequestMethod.GET)
	public String loginform()
	{
		String result = null;
		result = "WEB-INF/login/LoginForm.jsp";
		return result;
	}
	
	// 로그인 액션(login.action)
	@RequestMapping(value = "/login.action", method = RequestMethod.POST)
	@ResponseBody
	public String loginAction(String email, String password, HttpServletRequest request)
	{
		// 테스트
		System.out.println("--------------------loginAction 진입--------------------");
		System.out.println("email = " + email);
		System.out.println("password = " + password);
		
		String result = null;
		
		try
		{
			int login = 0;
			
			IRidingDAO dao = sqlSession.getMapper(IRidingDAO.class);
			
			login = dao.login(email, password);
			
			System.out.println("login = " + login);

			if (login > 0) // 로그인 정상 처리
			{
				// 로그인 한 회원의 user_id 알아내기
				int user_id = dao.getUserId(email);
				System.out.println("user_id = " + user_id);

				if (dao.usageRestrictions(user_id)!=0)
				{
					System.out.println("---사이트 이용제한 회원임---");
					result = "2"; // 사이트 이용제한 회원일 경우
				}
				else
				{
					System.out.println("---사이트 이용제한 회원 아님---");
					// 세션 구성
					HttpSession session = request.getSession();
					session.setAttribute("user_id", user_id);
					
					System.out.println("세션 구성 확인");
					System.out.println("세션 = " + session.getAttribute("user_id"));
					result =  "0"; // 정상적으로 로그인 처리
				}
			}
			else // 일치하는 회원 정보 없음(로그인 실패)
			{
				System.out.println("---일치하는 회원 정보 없음---");
				result =  "1";
			}
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		
		return result;
	}
	
	// 아이디 찾기 폼 요청(searchidform.action)
	@RequestMapping(value = "/searchidform.action", method = RequestMethod.GET)
	public String searchIdForm()
	{
		String result = null;
		result = "WEB-INF/login/SearchIdForm.jsp";
		return result;
	}
	
	// 아이디 찾기 액션(searchid.action)
	@RequestMapping(value = "searchid.action", method = RequestMethod.POST)
	@ResponseBody
	public String searchIdAction(String nickname, String birthday)
	{
		String result = null;
		
		try
		{
			System.out.println("---searchIdAction() 진입 성공---");
			System.out.println("nickname = " + nickname);
			System.out.println("birthday = " + birthday);
			
			IRidingDAO dao = sqlSession.getMapper(IRidingDAO.class);
			
			result = dao.searchId(nickname, birthday);
			System.out.println("result = " + result);
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		
		return result;
	}
	
	// 비밀번호 찾기 폼 요청(searchpasswordform.action)
	@RequestMapping(value = "/searchpasswordform.action", method = RequestMethod.GET)
	public String searchPasswordForm()
	{
		String result = null;
		
		result = "WEB-INF/login/SearchPasswordForm.jsp";
		
		return result;
	}
	
	// 비밀번호 찾기 액션(searchpassword.action)
	@RequestMapping(value = "/searchpassword.action", method = RequestMethod.POST)
	@ResponseBody
	public String searchPasswordAction(String email, String birthday)
	{
		System.out.println("---searchPasswordAction() 진입 성공---");
		System.out.println("email = " + email);
		System.out.println("birthday = " + birthday);
		
		IRidingDAO dao = sqlSession.getMapper(IRidingDAO.class);
		
		String result = null;
		
		try
		{
			result = dao.searchPassword(email, birthday);
			System.out.println("result = " + result);
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		
		return result;
	}
	
	// 로그아웃 액션(logout.action)
	@RequestMapping(value = "/logout.action", method = RequestMethod.GET)
	public ModelAndView logout(HttpServletRequest request, HttpServletResponse response)
	{
		ModelAndView mav = new ModelAndView();
		
		HttpSession session = request.getSession();
		
		session.removeAttribute("user_id");
		
		mav.setViewName("redirect:main.action");
		
		return mav;
	}
	
	// 로그인 상태인 회원의 성별 체크 액션(gendercheck.action)
	@RequestMapping(value = "/gendercheck.action", method = RequestMethod.POST)
	@ResponseBody
	public String genderCheck(String userId)
	{
		System.out.println("genderCheck() 진입 성공");
		String result = null;
		result = "female";
		return result;
	}
}
