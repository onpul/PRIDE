package com.test.sm;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class CreateController 
{
	@Autowired
	private SqlSession sqlSession;
	
	//���� ������ ����Ʈ ��
	@RequestMapping(value = "/createlist.action", method=RequestMethod.GET)
	public String createList(Model model)
	{
		String result = null;
		//String result = "WEB-INF/view/";
		
		ICreateDAO dao = sqlSession.getMapper(ICreateDAO.class);
		
		model.addAttribute("count", dao.count());
		model.addAttribute("list", dao.list());
		
		result = "MeetRoom.jsp";
		
		return result;
	
	}
	
	//���� ������ �Է� ��
	@RequestMapping(value = "/createinsertform.action", method=RequestMethod.GET)
	public String createInsertForm()
	{
		String result = null;
		//String result = "WEB-INF/";
			
		result = "CreateMeet.jsp";
			
		return result;
		
	}
		
		
	//���� ������ ��
	@RequestMapping(value = "/createinsert.action", method=RequestMethod.POST)
	public String createInsert(CreateDTO create)
	{
		String result = null;
			
		ICreateDAO dao = sqlSession.getMapper(ICreateDAO.class);
			
		dao.add(create);
		result += "redirect:createlist.action";
			
		return result;
	
	}	
		
		
		
		
		
		

	}

	
