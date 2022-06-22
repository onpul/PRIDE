package com.test.main;

import java.util.Calendar;

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
public class MainController
{
	@Autowired
	private SqlSession sqlSession;
	
	// Main.jsp 요청(main.action)
	@RequestMapping(value = "/main.action", method = RequestMethod.GET)
	public String main()
	{
		String result = null;
		result = "/WEB-INF/main/Main.jsp";
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
}