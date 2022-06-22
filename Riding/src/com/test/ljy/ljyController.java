/*Controller.java*/
package com.test.ljy;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


	//컨트롤러 등록
@Controller
public class ljyController
{
	private static final NoticeDTO NoticeDTO = null;
	//SqlSession 을 활용하여 마이바티스 객체 의존성 (자동) 주입
	@Autowired
	private SqlSession sqlSession;
	
	@RequestMapping(value = "/Notice.action" , method = RequestMethod.GET)
	public String Notice(Model model)
	{
		String result = null;
	
		NoticeDAO dao = sqlSession.getMapper(NoticeDAO.class);
		
		model.addAttribute("list", dao.list_Notice());
		
		result="/WEB-INF/view/Notice.jsp";
		return result;
	}
	
	@RequestMapping(value = "/Notice_Del.action" , method = RequestMethod.GET)
	public String Notice(NoticeDTO m)
	{
		NoticeDAO dao = sqlSession.getMapper(NoticeDAO.class);
		dao.delete(m);
		
		return "redirect:Notice.action";
	}
	/*
	 * @RequestMapping(value = "/Notice_Del_all.action" , method =
	 * RequestMethod.GET) public String Delete_all(NoticeDTO m) { NoticeDAO dao =
	 * sqlSession.getMapper(NoticeDAO.class); dao.delete(m);
	 * 
	 * return "redirect:Notice.action"; }
	 * 
	 * @RequestMapping(value = "/Notice_Del_read.action" , method =
	 * RequestMethod.GET) public String Delete_read(NoticeDTO n) { NoticeDAO dao =
	 * sqlSession.getMapper(NoticeDAO.class); dao.delete(n);
	 * 
	 * return "redirect:Notice.action"; }
	 */
	
	@RequestMapping(value = "/Inv_Del.action" , method = RequestMethod.GET)
	public String Invite(InvDTO i)
	{
		InvDAO dao = sqlSession.getMapper(InvDAO.class);
		dao.delete(i);
		
		return "redirect:Invite_list.action";
	}

	
	@RequestMapping(value = "/Invite.action" , method = RequestMethod.GET)
	public String Invitation_Create(Model model)
	{
		String result = null;
	
		InvDAO dao = sqlSession.getMapper(InvDAO.class);
		
		model.addAttribute("list", dao.list_INV());
		
		result="/WEB-INF/view/Invitation_Create.jsp";
		return result;
	}
	@RequestMapping(value = "/Invite_list.action" , method = RequestMethod.GET)
	public String Invite(Model model)
	{
		String result = null;
	
		InvDAO dao = sqlSession.getMapper(InvDAO.class);
		
		model.addAttribute("list", dao.list_INV());
		
		result="/WEB-INF/view/Invite.jsp";
		return result;
	}
	@RequestMapping(value = "/Invite_FRIEND.action" , method = RequestMethod.GET)
	public String Invite_FRI(Model model)
	{
		String result = null;
	
		InvDAO dao = sqlSession.getMapper(InvDAO.class);
		
		model.addAttribute("list", dao.list_INV());
		
		result="/WEB-INF/view/Inv_FriSend.jsp";
		return result;
	}
	@RequestMapping(value = "/Friend.action" , method = RequestMethod.GET)
	public String Friend(Model model)
	{
		String result = null;
	
		FriDAO dao = sqlSession.getMapper(FriDAO.class);
		
		model.addAttribute("list", dao.list_Fri());
		
		result="/WEB-INF/view/Friend.jsp";
		return result;
	}
	

	
	@RequestMapping(value = "/Friend_Request.action" , method = RequestMethod.GET)
	public String Friend_req(Model model)
	{
		String result = null;
	
		FriDAO dao = sqlSession.getMapper(FriDAO.class);
		
		model.addAttribute("list", dao.list_Fri());
		
		result="/WEB-INF/view/Friend_Request.jsp";
		return result;	  
	  
	  
	}
	  @RequestMapping(value = "/Report.action", method = RequestMethod.GET)
		public String Report()
		{
			String result = null;
			
			 result="/WEB-INF/view/Report.jsp";
			  return result; 
		}
	  
	  @RequestMapping(value = "/Inquiry.action", method = RequestMethod.GET)
		public String Inquiry()
		{
			String result = null;
			
			 result="/WEB-INF/view/Inquiry.jsp";
			  return result; 
		}
	  @RequestMapping(value = "/Manager.action" , method = RequestMethod.GET)
		public String Manager()
		{
			String result = null;
		
			result="/WEB-INF/view/Manager.jsp";
			return result;	  
		  
		  
		}
	  //---------------------------------------------------------------//
	  
	
}

