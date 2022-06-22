package com.test.sm;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class StoreController 
{
	@Autowired
	private SqlSession sqlSession;
	
	//가게 데이터 리스트 폼
	@RequestMapping(value = "/storelist.action", method=RequestMethod.GET)
	public String storeList(Model model)
	{
		String result = null;
		//String result = "WEB-INF/view/";
		
		IStoreDAO dao = sqlSession.getMapper(IStoreDAO.class);
		
		model.addAttribute("count", dao.count());
		model.addAttribute("list", dao.list());
		
		result = "StoreMap.jsp";
		
		return result;
		
		
	}
	
	
	//가게 데이터 입력 폼
	@RequestMapping(value = "/storeinsertform.action", method=RequestMethod.GET)
	public String storeInsertForm()
	{
		String result = null;
		
		//String result = "WEB-INF/";
		
		result = "RegisterStore.jsp";
		
		return result;
	}
	
	
	//가게 데이터 폼
	@RequestMapping(value = "/storeinsert.action", method=RequestMethod.POST)
	public String storeInsert(StoreDTO store)
	{
		String result = null;
		
		IStoreDAO dao = sqlSession.getMapper(IStoreDAO.class);
		
		dao.add(store);
		result += "redirect:storelist.action";
		
		return result;
	}	
	
	
	
	
	
	

}
