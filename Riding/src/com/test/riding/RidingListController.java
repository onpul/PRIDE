package com.test.riding;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.test.login.IRidingDAO;
import com.test.login.RidingDTO;

@Controller
@SessionAttributes("user_id") // 세션 객체에 저장
public class RidingListController
{
	@Autowired
	private SqlSession sqlSession;
	
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
		result = "/WEB-INF/riding/RidingList.jsp";
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
}