package com.test.login;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Calendar;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

@Controller
@SessionAttributes("user_id") // 세션 객체에 저장
public class mjController
{
	@Autowired
	private SqlSession sqlSession;
	
	// Main.jsp 요청(main.action)
	@RequestMapping(value = "/main.action", method = RequestMethod.GET)
	public String main()
	{
		String result = null;
		result = "WEB-INF/view/Main.jsp";
		return result;
	}
	
	// JoinForm.jsp 요청(joinform.action)
	@RequestMapping(value ="/joinform.action", method = RequestMethod.GET)
	public String joinForm()
	{
		String result = null;
		result = "WEB-INF/view/JoinForm.jsp";
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
	
	// 탈퇴회원 체크 시 요청(withdrawcheck.action)
	/*
	@RequestMapping(value="/withdrawcheck.action", method = RequestMethod.POST)
	@ResponseBody
	public String withdrawCheckAction(String email, String birthday)
	{
		System.out.println("withdrawCheckAction() 진입 ");
		System.out.println("email = " + email);
		System.out.println("birthday = " + birthday);
		
		// 0 : 회원가입 정상 처리
		// 1 : 탈퇴회원(3개월 이내, 가입 불가능)
		return "/join.action";
	}
	*/
	
	// 로그인 폼 요청(loginform.action)
	@RequestMapping(value = "/loginform.action", method = RequestMethod.GET)
	public String loginform()
	{
		String result = null;
		result = "WEB-INF/view/LoginForm.jsp";
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
		result = "WEB-INF/view/SearchIdForm.jsp";
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
		
		result = "WEB-INF/view/SearchPasswordForm.jsp";
		
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
	
	// 알림 불러오기 액션(notice.action)
	@RequestMapping(value = "/notice.action", method = RequestMethod.POST)
	@ResponseBody
	public void notice(NoticeDTO dto, HttpServletRequest request, HttpServletResponse response)
	{
		//System.out.println("-----notice() 진입 성공-----");
		
		String result = null;
		
		IRidingDAO dao = sqlSession.getMapper(IRidingDAO.class);
		
		HttpSession session = request.getSession();
		
		try
		{
			System.out.println("user_id = " + session.getAttribute("user_id"));
			
			int user_id = (int)session.getAttribute("user_id");
			
			ArrayList<NoticeDTO> noticeList = new ArrayList<NoticeDTO>(); 
			noticeList = dao.noticeList(user_id);
			
			//System.out.println(dto.getUser_id());
			//System.out.println(noticeList.get(0));
			
			result = "[";
			
			for (int i = 0; i < noticeList.size(); i++)
			{
				result += "{\"content\":" + "\"" + noticeList.get(i) + "\"}"; 
				
				//result += "{\"content\":" + noticeList.get(i) + "}";
				
				if (i!=noticeList.size()-1)
				{
					result += ",";
				}
			}
			result += "]";
			//System.out.println(result);
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		try
		{
			// 이거 없으면 ajax에서 한글 깨짐
			response.setContentType("text/html;charset=UTF-8");
			response.getWriter().print(result);
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
	}
	
	// 알림 개수 가져오기
	@RequestMapping(value="/noticeCount.action", method = RequestMethod.POST)
	@ResponseBody
	public String noticeCount(NoticeDTO dto, HttpServletRequest request)
	{
		System.out.println("-----noticeCount 진입-----");
		
		String result = "";
		
		HttpSession session = request.getSession();
		
		try
		{
			System.out.println("user_id = " + session.getAttribute("user_id"));
			
			int user_id = (Integer)session.getAttribute("user_id");
			
			IRidingDAO dao = sqlSession.getMapper(IRidingDAO.class);
			
			result = Integer.toString(dao.noticeCount(user_id));
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		
		//System.out.println("result = " + result);
		
		return result;
	}

	// 쪽지 개수 가져오기
	@RequestMapping(value="/messageCount.action", method = RequestMethod.POST)
	@ResponseBody
	public String messageCount(NoticeDTO dto, HttpServletRequest request)
	{
		//System.out.println("-----messageCount 진입-----");
		String result = "";
		HttpSession session = request.getSession();
		try
		{
			System.out.println("user_id = " + session.getAttribute("user_id"));
			
			int user_id = (int)session.getAttribute("user_id");
			
			IRidingDAO dao = sqlSession.getMapper(IRidingDAO.class);
			
			result = Integer.toString(dao.messageCount(user_id));
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		//System.out.println("user_id = " + dto.getUser_id());
		//System.out.println("result = " + result);
		
		return result;
	}
	
	// 메인 달력에 참여 가능한 모임 수 뿌리기
	@RequestMapping(value="/openRidingCount.action", method = RequestMethod.POST)
	@ResponseBody
	public String openRidingCount(String year, String month)
	{
		// ajax에 보낼 결과 담을 변수
		String result = "";
					
		try
		{
			// 받아온 월의 마지막 일 구하기 ------------------------
			Calendar cal = Calendar.getInstance();

			cal.set(Integer.parseInt(year), Integer.parseInt(month)-1, 1);

			// 마지막 일
			int daytemp = cal.getActualMaximum(Calendar.DAY_OF_MONTH);
			String day = "";
			if (daytemp < 9)
			{
				day = "0"+Integer.toString(daytemp);
			}
			else
				day = Integer.toString(daytemp);
			
			// 테스트
			//System.out.println("day = " + day);
			//------------------------------------------------------
			
			
			
			// dao 가져오자
			IRidingDAO dao = sqlSession.getMapper(IRidingDAO.class);
			
			// dao 결과 담을 임시 변수
			int temp;
			
			//String date = year+"-"+month+"-"+day;
			
			// dao 작동하는지 테스트
			//temp = dao.openRidingCount(date);
			//System.out.println("temp = " + temp);
			//temp = 0
			// 오늘 날짜의 모임 개수는 0
			
			// dao에 넣을 date
			String date = "";
			
			// JSON 형태의 str
			String str = "";
			
			// 데이터를 어떻게 파싱할 거냐면?
			/*
			[{"date":"2022-06-01","count":"1"},{"date":"2022-06-02","count":"1"}
			,···{"date":"2022-06-30","count":"1"}]
			*/
			str += "[";
			String tmp = "";
			for (int i = 1; i <= daytemp; i++)
			{
				if (i <= 9)
				{
					tmp = "0" + Integer.toString(i);
				}
				else
					tmp = Integer.toString(i);
			
				date = year+"-"+month+"-"+tmp;
			
				str += "{\"date\":\"" + date + "\",\"count\":\"";
				str += dao.openRidingCount(date);
				str += "\"}";
				
				if (i != daytemp)
				{
					str += ",";
				}
			}
			str+="]";
		
			//System.out.println(str);
			
			result = str;
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		// 테스트 ----------------------------------------------
		System.out.println("-----openRidingCount() 진입-----");
		//System.out.println("year = " + year);
		//System.out.println("month = " + month);
		//------------------------------------------------------
		
		// 리턴값		
		return result;
	}
	
	// 메인 달력에 완료된 모임 수 뿌리기
	@RequestMapping(value="/closeRidingCount.action", method = RequestMethod.POST)
	@ResponseBody
	public String closeRidingCount(String year, String month)
	{
		// 테스트 ----------------------------------------------
		//System.out.println("-----closeRidingCount() 진입-----");
		//System.out.println("year = " + year);
		//System.out.println("month = " + month);
		//------------------------------------------------------
		
		// ajax에 보낼 결과 담을 변수
		String result = "";
					
		try
		{
			// 받아온 월의 마지막 일 구하기 ------------------------
			Calendar cal = Calendar.getInstance();

			cal.set(Integer.parseInt(year), Integer.parseInt(month)-1, 1);

			// 마지막 일
			int daytemp = cal.getActualMaximum(Calendar.DAY_OF_MONTH);
			String day = "";
			if (daytemp < 9)
			{
				day = "0"+Integer.toString(daytemp);
			}
			else
				day = Integer.toString(daytemp);
			
			// 테스트
			//System.out.println("day = " + day);
			//------------------------------------------------------
			
			// dao 가져오자
			IRidingDAO dao = sqlSession.getMapper(IRidingDAO.class);
			
			// dao 결과 담을 임시 변수
			int temp;
			
			//String date = year+"-"+month+"-"+day;
			
			// dao 작동하는지 테스트
			//temp = dao.openRidingCount(date);
			//System.out.println("temp = " + temp);
			//temp = 0
			// 오늘 날짜의 모임 개수는 0
			
			// dao에 넣을 date
			String date = "";
			
			// JSON 형태의 str
			String str = "";
			
			// 데이터를 어떻게 파싱할 거냐면?
			/*
			[{"date":"2022-06-01","count":"1"},{"date":"2022-06-02","count":"1"}
			,···{"date":"2022-06-30","count":"1"}]
			*/
			str += "[";
			String tmp = "";
			for (int i = 1; i <= daytemp; i++)
			{
				if (i <= 9)
				{
					tmp = "0" + Integer.toString(i);
				}
				else
					tmp = Integer.toString(i);
			
				date = year+"-"+month+"-"+tmp;
			
				str += "{\"date\":\"" + date + "\",\"count\":\"";
				str += dao.closeRidingCount(date);
				str += "\"}";
				
				if (i != daytemp)
				{
					str += ",";
				}
			}
			str+="]";
		
			//System.out.println(str);
			
			result = str;
			
			
		} catch (Exception e)
		{
			// TODO: handle exception
		}
		// 리턴값		
		return result;
	}
	
	// 모임 생성 패널티 조회
	@RequestMapping(value = "/penaltycheck.action", method = RequestMethod.POST)
	@ResponseBody
	public String penaltyCheck(UserDTO dto)
	{
		System.out.println("-----penaltyCheck() 진입 성공-----");
		System.out.println("user_id = " + dto.getUser_id());
		
		String result = "";
		
		IRidingDAO dao = sqlSession.getMapper(IRidingDAO.class);
		
		try
		{
			String user_id = Integer.toString(dto.getUser_id());
			
			result = dao.penaltyCheck(user_id);
			
			System.out.println("result = " + result);
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		
		return result;
	}
	
	// 나의 라이딩 스타일 조회
	@RequestMapping(value = "/myRidingCheck.action", method = RequestMethod.POST)
	@ResponseBody
	public String myRidingStyle(RidingDTO dto, Model model, int user_id)
	{
		System.out.println("-----myRidingStyle() 진입 성공-----");
		
		IRidingDAO dao = sqlSession.getMapper(IRidingDAO.class);
		
		dto.setAge_p_id(dao.myRidingStyle(user_id).get(0).getAge_p_id());
		dto.setDining_p_id(dao.myRidingStyle(user_id).get(0).getDining_p_id());
		dto.setEat_p_id(dao.myRidingStyle(user_id).get(0).getEat_p_id());
		dto.setMood_p_id(dao.myRidingStyle(user_id).get(0).getMood_p_id());
		dto.setSex_p_id(dao.myRidingStyle(user_id).get(0).getSex_p_id());

		String age_p_id = Integer.toString(dto.getAge_p_id());
		String dining_p_id = Integer.toString(dto.getDining_p_id());
		String eat_p_id = Integer.toString(dto.getEat_p_id());
		String mood_p_id = Integer.toString(dto.getMood_p_id());
		String sex_p_id = Integer.toString(dto.getSex_p_id());
		
		String result = "";
		result += "[";
		
		result += "{\"age_p_id\":" + "\"" + age_p_id + "\"},";
		result += "{\"dining_p_id\":" + "\"" + dining_p_id + "\"},";
		result += "{\"eat_p_id\":" + "\"" + eat_p_id + "\"},";
		result += "{\"mood_p_id\":" + "\"" + mood_p_id + "\"},";
		result += "{\"sex_p_id\":" + "\"" + sex_p_id + "\"}";
	
		result += "]";
		System.out.println(result);
		
		return result;
	}
	
	// 라이딩 리스트 페이지 요청(ridinglist.action)
	@RequestMapping(value = "/ridinglist.action", method = RequestMethod.GET)
	public String ridingList()
	{
		String result = null;
		result = "WEB-INF/view/RidingList.jsp";
		return result;
	}
	
	// 라이딩 리스트 (분류 적용마다 호출되는 컨트롤러)
	@RequestMapping(value = "/ridinglistform.action")
	@ResponseBody
	public void ridingList(RidingDTO dto, HttpServletResponse response) throws IOException
	{	
		// 테스트
		System.out.println("-----ridinglist() 진입-----");
		System.out.println(dto.getSex_p_id());
		System.out.println(dto.getAge_p_id());
		System.out.println(dto.getSpeed_id());
		System.out.println(dto.getStep_id());
		System.out.println(dto.getEat_p_id());
		System.out.println(dto.getDining_p_id());
		System.out.println(dto.getMood_p_id());
		
		String result = "";
		
		int sex_p_id = dto.getSex_p_id();
		int age_p_id = dto.getAge_p_id();
		int speed_id = dto.getSpeed_id();
		int step_id = dto.getStep_id();
		int eat_p_id = dto.getEat_p_id();
		int dining_p_id = dto.getDining_p_id();
		int mood_p_id = dto.getMood_p_id();
		
		IRidingDAO dao = sqlSession.getMapper(IRidingDAO.class);
		ArrayList<RidingDTO> ridingList = new ArrayList<RidingDTO>();
		
		String where = "";
		String orderby = "";
		
		where += "WHERE RIDING_ID IS NOT NULL";
		if (sex_p_id != -1) // 전체 선택이 아니면
			where += " AND SEX_P_ID = " + sex_p_id;
		if (age_p_id != -1)
			where += " AND AGE_P_ID = " + age_p_id;
		if (speed_id != -1)
			where += " AND SPEED_ID = " + speed_id;
		if (step_id != -1)
			where += " AND STEP_ID = " + step_id;
		if (eat_p_id != -1)
			where += " AND EAT_P_ID = " + eat_p_id;
		if (dining_p_id != -1)
			where += " AND DINING_P_ID = " + dining_p_id;
		if (mood_p_id != -1)
			where += " AND MOOD_P_ID = " + mood_p_id;
		
		orderby = "ORDER BY START_DATE";
		
		ridingList = dao.ridingList(where, orderby);
		
		//System.out.println("where = " + where);
		
		//System.out.println("ridingList.size() = " + ridingList.size());
		
		result += "[";
		
		for(RidingDTO data : ridingList)
		{
			//System.out.println(data.getRiding_name());
			
			result += "{\"riding_name\":" + "\"" + data.getRiding_name() + "\"},";
			result += "{\"maximum\":" + "\"" + data.getMaximum() + "\"},";
			result += "{\"open\":" + "\"" + data.getOpen() + "\"},";
			result += "{\"start_date\":" + "\"" + data.getStart_date() + "\"},";
			result += "{\"end_date\":" + "\"" + data.getEnd_date() + "\"},";
			result += "{\"confirm_date\":" + "\"" + data.getConfirm_date() + "\"},";
			result += "{\"riding_id\":" + "\"" + data.getRiding_id() + "\"},";
		}
		
		result = result.replaceAll(",$","");
		
		result += "]";
		
		//System.out.println(result);
		
		response.setCharacterEncoding("UTF-8");
		response.getWriter().print(result);
		
		//return result;
	}
	
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
		
		result = "WEB-INF/view/RidingDetail.jsp";
		return result;
	}

}
