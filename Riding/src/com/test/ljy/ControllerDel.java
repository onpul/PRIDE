package com.test.ljy;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class ControllerDel
{

	private static final NoticeDTO NoticeDTO = null;
	//SqlSession 을 활용하여 마이바티스 객체 의존성 (자동) 주입
	@Autowired
	private SqlSession sqlSession;
	
	
	@RequestMapping(value = "/Notice_del.action" , method = RequestMethod.GET)
	public String Notice_delete(NoticeDTO m)
	{
		NoticeDAO dao = sqlSession.getMapper(NoticeDAO.class);
		dao.delete(m);
		
		return "redirect:Notice.action";
	}
}
