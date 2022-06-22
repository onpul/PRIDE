package com.test.sm;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class FacilityController 
{
	@Autowired
	private SqlSession sqlSession;
	
	//�ü� ������ ����Ʈ ��
	@RequestMapping(value = "/facilitylist.action", method=RequestMethod.GET)
	public String storeList(Model model)
	{
		String result = null;
		//String result = "WEB-INF/view/";
		
		IFacilityDAO dao = sqlSession.getMapper(IFacilityDAO.class);
		
		model.addAttribute("count", dao.count());
		model.addAttribute("list", dao.list());
		
		result = "/FacilityMap.jsp";
		
		return result;
	
	
	}
	
	
	//�ü� ������ �Է� ��
	@RequestMapping(value = "/facilityinsertform.action", method=RequestMethod.GET)
	public String facilityInsertForm()
	{
		
		String result = null;
		//String result = "WEB-INF/view/";
		
		result = "RegisterFacility.jsp";
		
		return result;
	}
		
	
	
	//�ü� ������ ��
	@RequestMapping(value = "/facilityinsert.action", method=RequestMethod.POST)
	public String facilityInsert(FacilityDTO fac)
	{
		String result = null;
		
		IFacilityDAO dao = sqlSession.getMapper(IFacilityDAO.class);
		
		dao.add(fac);
		result += "redirect:facilitylist.action";
		
		return result;
	}	
	
	

	
}
