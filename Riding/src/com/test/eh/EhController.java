package com.test.eh;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class EhController
{
	// 마이페이지메인 뷰 --> 따로 컨트롤러 만듬.
	/*
	@RequestMapping(value = "/mypagemain.action", method = RequestMethod.GET)
	public String myPageMainView()
	{
		String view = "/WEB-INF/eh/MyPageMain.jsp";
		return view;
	}
	*/
	
	@Autowired
	private SqlSession sqlSession;
	
	// 마이페이지 --> 
	
	
	
	// 마이페이지 --> 평가페이지 
	// 조건.
	@RequestMapping(value = "/evaldate_ok.action", method = RequestMethod.GET)
	@ResponseBody
	public String evaDataCheck(EvaluationDTO dto)
	{
		String result = "";
		
		IEvaluationDAO dao = sqlSession.getMapper(IEvaluationDAO.class);
		
		
		//지금 유저 아이디 확인(넘어온)
		System.out.println("넘어온 유저아이디 : " + dto.getUser_id());
		
		
		// 1. 평가기간인 모임id 출력
		String riding_id = dao.searchCurrRidingId(dto.getUser_id());
		//System.out.println("모임id 는 : " + riding_id);
		
		
		// 2. 방장인지 아닌지 체크 (1 방장이다 / 0 참여자이다.)
		int leaderCheck = dao.leaderFlagList(dto.getUser_id());
		//System.out.println("리더라면 1 반환 :" +leaderCheck);
		
		
		// 3. 제출했는지 안했는지 체크 (1 제출함 / 0 제출안함)
		int answerCheck = dao.answerFlag(dto.getUser_id());
		//System.out.println("제출했으면 1 반환 : "+ answerCheck );
		
		
		if(riding_id != null)
		{
			//System.out.println("들어오나");
			if (answerCheck==0)
			{
				if (leaderCheck==1)
				{
					// 평가기간에 속하고 제출안한 방장
					result = Integer.toString(1);
				}
				else if(leaderCheck==0)
				{
					// 평가기간에 속하고 제출안한 참여자
					result = Integer.toString(2);
				}
			}
			else if (answerCheck ==1)
			{
				// 이미 평가지를 제출했음.
				result = Integer.toString(3);
			}
		}
		else
		{
			// 평가기간에 속하는 모임이 없음
			result = Integer.toString(4);
		}
		
		
		return result;
		
	}
	
	// 개인정보수정폼 뷰
	@RequestMapping(value = "/myinfoupdateform.action", method = RequestMethod.GET)
	public String myInfoUpdateForm()
	{
		String view = "/WEB-INF/eh/MyInfoUpdateForm.jsp";
		return view;
	}
	
	// 개인정보수정폼 뷰 - 닉네임 변경
	@RequestMapping(value = "/nicknameupdateform.action", method = RequestMethod.GET)
	public String nickNameUpdateForm()
	{
		String view = "/WEB-INF/eh/NickNameUpdateForm.jsp";
		return view;
	}
	
	// 개인정보수정폼 뷰 - 한마디 변경
	@RequestMapping(value = "/onewordupdateform.action", method = RequestMethod.GET)
	public String oneWordUpdateForm()
	{
		String view = "/WEB-INF/eh/OneWordUpdateForm.jsp";
		return view;
	}
	
	// 개인정보수정폼 뷰 - 프로필 사진 변경
	@RequestMapping(value = "/profilephotoupdateform.action", method = RequestMethod.GET)
	public String profilePhotoUpdateForm()
	{
		String view = "/WEB-INF/eh/ProfilePhotoUpdateForm.jsp";
		return view;
	}
	
	
	//라이딩스타일조회및수정폼 뷰
	@RequestMapping(value = "/ridingstylelistupdateform.action", method = RequestMethod.GET)
	public String ridingStyleListUpdateForm()
	{
		String view = "/WEB-INF/eh/RidingStyleListUpdateForm.jsp";
		return view;
	}
	
	
	//참여중인라이딩모임조회 뷰
	@RequestMapping(value = "/participateridinglist.action", method = RequestMethod.GET)
	public String participateRidingList()
	{
		String view = "/WEB-INF/eh/ParticipateRidingList.jsp";
		return view;
	}
	
	
	//평가(방장) 뷰
	@RequestMapping(value = "/evaluationleaderform.action", method = RequestMethod.GET)
	public String evaluationLeaderForm(EvaluationDTO dto ,Model model,HttpServletRequest request, HttpServletResponse response)
	{
		// 처음 조회할 때
		// 모임명 / 작성자 닉네임 / 참여자 명단 / 문항 / 가져오기
		//String user_id = "40";
		//System.out.println(dto.getUser_id());
		
		HttpSession session = request.getSession();
		dto.setUser_id(Integer.toString((Integer)session.getAttribute("user_id")));
		
		
		
		String view = "/WEB-INF/eh/EvaluationLeaderForm.jsp";
		//마이바티스 방법으로 dao 인스턴스 생성
		IEvaluationDAO dao = sqlSession.getMapper(IEvaluationDAO.class);
		
		// 해당 사용자가 속한 평가기간에 맞는 모임 조회
		//int dateFlag = dao.evalDateFlagList(user_id);
		//System.out.println("dateFlag : " + dateFlag);
		//model.addAttribute("dateFlag", dateFlag);
		
		//모임 조회
		dto.setRiding_id(dao.searchCurrRidingId(dto.getUser_id()));
		System.out.println("모임아이디는???????" + dto.getRiding_id());
		
		// 해당 사용자가 방장인지 조회
		//int leaderFlag = dao.leaderFlagList(user_id);
		//System.out.println("leaderFlag"+leaderFlag);
		//model.addAttribute("leaderFlag", leaderFlag);
		
		// 문항 조회 
		ArrayList<EvaluationDTO> leaderQuestionList = new ArrayList<EvaluationDTO>();
		leaderQuestionList = dao.leaderQuestionList();
		model.addAttribute("leaderQuestionList",leaderQuestionList);
		
		
		for (int i = 0; i < leaderQuestionList.size(); i++)
		{
			
			 System.out.println("문항 id: " + leaderQuestionList.get(i).getQuestion_id());
			 System.out.println("leaderQuestion"+i); 
			 System.out.println("문항 내용: " + leaderQuestionList.get(i).getQu_content());
			 /*
			    문항 id: 1
		        leaderQuestion0
				문항 내용: 가장 친절한 사람은 누구인가요?
				문항 id: 2
				leaderQuestion1
				문항 내용: 가장 불친절한 사람은 누구인가요?
				문항 id: 3
				leaderQuestion2
				문항 내용: 위험하게 라이딩한 사람은 누구인가요?
				문항 id: 7
				leaderQuestion3
				문항 내용: 완주하지 못한 사람은 누구인가요?
				문항 id: 8
				leaderQuestion4
				문항 내용: 실제 난이도에 못 미친 사람은 누구인가요?
			 */
			//model.addAttribute("leaderQuestion"+i,leaderQuestionList.get(i).getQ_content());
		}
		
		
		
		// 모임명 조회
		System.out.println("라이딩id"+dto.getRiding_id());
		dto.setRiding_name(dao.ridingNameList(dto.getRiding_id()));
		
		model.addAttribute("riding_name", dto.getRiding_name());
		model.addAttribute("riding_id", dto.getRiding_id());
		
		//System.out.println("라이딩모임id : " + riding.getRiding_id());
		//System.out.println("라이딩모임명 : " + riding.getRiding_name());
		
		
		// 작성자 조회(닉네임)
		dto.setNickName(dao.userNickNameList(dto.getUser_id()));
		System.out.println("작성자 닉네임 : "+dto.getNickName());
		//System.out.println("참여자 이름 : " + userDto.getNickName());
		//System.out.println("참여자 이름 : " + userDto.getUser_id());
		model.addAttribute("nickName", dto.getNickName());
		model.addAttribute("user_id", dto.getUser_id());
		
		
		//현재 속한 모임 id 찾기
		//dto.setRiding_id(dao.searchCurrRidingId(dto.getUser_id()));
		
		// 참여자 명단 조회
		ArrayList<EvaluationDTO> memberList = new ArrayList<EvaluationDTO>(); 
		memberList = dao.memberList(dto.getRiding_id());
		model.addAttribute("memberList",memberList);
		/*
		System.out.println(memberList.size());
		for (int i = 0; i < memberList.size(); i++)
		{
			System.out.println("참여자명단(닉네임) :" + memberList.get(i).getNickName());
			System.out.println("참여자명단(id) :" + memberList.get(i).getUser_id());
		}
		*/
		
		// 제출 여부 판단 조회
		//int answerFlag = dao.answerFlag(dto.getUser_id());
		//model.addAttribute("answerFlag",answerFlag);
		//System.out.println("제출여부 : " + answerFlag);
		
		
		return view;
	}
	
	//평가지(방장)폼에서 입력 받은 값 insert 시키기.
	@RequestMapping(value = "/evaluationinsertleader.action",method = RequestMethod.GET)
	public String evalAdd(EvaluationDTO dto)
	{
		String view = "redirect:mypagemain.action";
		//String user_id = "40";
		//String riding_id = "4";
		//dto.setUser_id();
		//dto.setRiding_id(riding_id);
		
		IEvaluationDAO dao = sqlSession.getMapper(IEvaluationDAO.class);
		
		System.out.println("결석자 id : " + dto.getAttendance());
		System.out.println("친절한 사람 id : " + dto.getKindness());
		System.out.println("불친절한 id : " + dto.getNotKindness());
		System.out.println("위험한 라이딩 id : " + dto.getDangerRiding());
		System.out.println("완주 ㄴㄴ id : " + dto.getNotCompletion());
		System.out.println("실제숙련도와다른사람 id : " + dto.getDifferent());
		
		dto.setP_member_id(dao.searchPMemberId(dto.getUser_id()));
		dao.answerInsert(dto);
		
		System.out.println("어딘데 ㅠㅠㅠㅠ ");
		
		//넘어온 값이 not 이면 실행 안시킴
		//checkInsert , searchCheckId
		if (!dto.getAttendance().equals("not"))
		{
			dto.setP_member_id(dao.searchPMemberId(dto.getUser_id()));
			
			dao.checkInsert(dto);	//--SEQ , 제출자의 P_MEMBER_ID / 날짜
			
			//2. 출석체크 응답내용 insert
			//-- seq , check_atte_id,결석지목받은사람 p_member_id
			
			dto.setCheck_atte_id(dao.searchCheckId(dto.getUser_id()));//--제출자의 check_atte_id
			dto.setP_member_id(dao.searchPMemberId(dto.getAttendance())); //--결석자의 p_member_id
			dao.checkDetailInsert(dto);
			//-- 여기까진 ㅇㅋㅇㅋ
		}
		int leaderCheck = dao.leaderFlagList(dto.getUser_id());
		//-- 리더 1 참여자 0 
		if (leaderCheck == 0)
		{
			System.out.println("당신은 참여자입니다.");
			if (!dto.getLeaderCheck().equals("not"))
			{
				//1. 작성자의 answer_id
				dto.setAnswer_id(dao.searchAnswerId(dto.getUser_id()));
				//2. question_id --> 넘어오는건 q_content 
				//   q_content로 question_id 찾기
				//4 / 5 /6
				
				//quesiont_id 4 /5/ 6
				System.out.println("큐 콘텐트가 뭔데 :" +dto.getQu_content());
				dto.setQuestion_id(dao.searchQuestionId(dto.getQu_content()));
				System.out.println("제발제발");
				
				dao.leadershipDetailInsert(dto);
			}
		}
		System.out.println("어딘데tqtq ㅠㅠㅠㅠ ");
		
		// answerDetailInsert 메소드
		// ANSWER_DETAIL 테이블
		// SEQ , 응답 ID(answer_id), 질문ID(QUESTION_ID),지목받은사람(P_MEMBER_ID)
		
		// 친절한 사람이 NOT (없음 체크)라면 실행 X
		if (!dto.getKindness().equals("not"))
		{
			//System.out.println(dto.getQuestion_id());
			//--null
			//answer_id(작성자 id)
			dto.setAnswer_id(dao.searchAnswerId(dto.getUser_id()));
			// question_id
			dto.setQuestion_id("1");
			// 지목받은 사람 p_member_id
			dto.setP_member_id(dao.searchPMemberId(dto.getKindness()));
			
			//insert 실행
			dao.answerDetailInsert(dto);
			
		}
		// 불친절 
		if (!dto.getNotKindness().equals("not"))
		{
			//answer_id(작성자 id)
			dto.setAnswer_id(dao.searchAnswerId(dto.getUser_id()));
			// question_id
			dto.setQuestion_id("2");
			// 지목받은 사람 p_member_id
			dto.setP_member_id(dao.searchPMemberId(dto.getNotKindness()));
			
			//insert 실행
			dao.answerDetailInsert(dto);
			
		}
		// 위험한 라이딩
		if (!dto.getDangerRiding().equals("not"))
		{
			//answer_id(작성자 id)
			dto.setAnswer_id(dao.searchAnswerId(dto.getUser_id()));
			// question_id
			dto.setQuestion_id("3");
			// 지목받은 사람 p_member_id
			dto.setP_member_id(dao.searchPMemberId(dto.getDangerRiding()));
			
			//insert 실행
			dao.answerDetailInsert(dto);
		}
		// 완주못한
		if (!dto.getNotCompletion().equals("not"))
		{
			//answer_id(작성자 id)
			dto.setAnswer_id(dao.searchAnswerId(dto.getUser_id()));
			// question_id
			dto.setQuestion_id("7");
			// 지목받은 사람 p_member_id
			dto.setP_member_id(dao.searchPMemberId(dto.getNotCompletion()));
			
			//insert 실행
			dao.answerDetailInsert(dto);
		}
		// 실제다른
		if (!dto.getDifferent().equals("not"))
		{
			//answer_id(작성자 id)
			dto.setAnswer_id(dao.searchAnswerId(dto.getUser_id()));
			// question_id
			dto.setQuestion_id("8");
			// 지목받은 사람 p_member_id
			dto.setP_member_id(dao.searchPMemberId(dto.getDifferent()));
			
			//insert 실행
			dao.answerDetailInsert(dto);
		}
		System.out.println("어딘데 fffffffffffffㅠㅠㅠㅠ ");
		return view;
	}			
	
	//평가(참여자)뷰
	@RequestMapping(value = "/evaluationmemberform.action", method = RequestMethod.GET)
	public String evaluationMemberForm(EvaluationDTO dto, Model model,HttpServletRequest request, HttpServletResponse response)
	{
		// 처음 조회할 때
		// 모임명 / 작성자 닉네임 / 참여자 명단 / 문항 / 가져오기
		//String user_id = "40";
		//System.out.println(dto.getUser_id());
		//String riding_id = "4";
		//System.out.println(dto.getRiding_id());
		HttpSession session = request.getSession();
		dto.setUser_id(Integer.toString((Integer)session.getAttribute("user_id")));
		
		
		String view = "/WEB-INF/eh/EvaluationMemberForm.jsp";
		//마이바티스 방법으로 dao 인스턴스 생성
		IEvaluationDAO dao = sqlSession.getMapper(IEvaluationDAO.class);
		
		//모임 찾기
		dto.setRiding_id(dao.searchCurrRidingId(dto.getUser_id()));
		
		
		// 문항 조회 
		ArrayList<EvaluationDTO> leaderQuestionList = new ArrayList<EvaluationDTO>();
		leaderQuestionList = dao.leaderQuestionList();
		model.addAttribute("leaderQuestionList",leaderQuestionList);
		
		
		
		for (int i = 0; i < leaderQuestionList.size(); i++)
		{
			
			 System.out.println("문항 id: " + leaderQuestionList.get(i).getQuestion_id());
			 System.out.println("leaderQuestion"+i); 
			 System.out.println("문항 내용: " + leaderQuestionList.get(i).getQu_content());
			 
		}
		
		System.out.println("모임 아이디 뭔데 ? " + dto.getRiding_id());
		
		// 모임명 조회
		//EvaluationDTO riding = dao.ridingNameList(dto.getUser_id());
		dto.setRiding_name(dao.ridingNameList(dto.getRiding_id()));
		//model.addAttribute("riding",riding);
		
		System.out.println("모임명 뭔데 ㅅㅂ : " + dto.getRiding_name());
		System.out.println("모임 아이디 뭔데 ? " + dto.getRiding_id());
		
		//System.out.println("라이딩모임id : " + riding.getRiding_id());
		//System.out.println("라이딩모임명 : " + riding.getRiding_name());
		model.addAttribute("riding_id", dto.getRiding_id());
		model.addAttribute("riding_name", dto.getRiding_name());
		
		
		// 작성자 조회(닉네임)
		//EvaluationDTO userDto = dao.userNickNameList(dto.getUser_id());
		//model.addAttribute("userDto",userDto);
		dto.setNickName(dao.userNickNameList(dto.getUser_id()));
		
		//System.out.println("참여자 이름 : " + userDto.getNickName());
		//System.out.println("참여자 이름 : " + userDto.getUser_id());
		System.out.println("작성자 닉네임 : " + dto.getNickName());
		
		model.addAttribute("user_id", dto.getUser_id());
		model.addAttribute("nickName",dto.getNickName());
		
		// 참여자 명단 조회
		ArrayList<EvaluationDTO> memberList = new ArrayList<EvaluationDTO>(); 
		memberList = dao.memberList(dto.getRiding_id());
		model.addAttribute("memberList",memberList);
		/*
		System.out.println(memberList.size());
		for (int i = 0; i < memberList.size(); i++)
		{
			System.out.println("참여자명단(닉네임) :" + memberList.get(i).getNickName());
			System.out.println("참여자명단(id) :" + memberList.get(i).getUser_id());
		}
		*/
		
		// 제출 여부 판단 조회
		int answerFlag = dao.answerFlag(dto.getUser_id());
		model.addAttribute("answerFlag",answerFlag);
		//System.out.println("제출여부 : " + answerFlag);
		
		
		return view;
	}
		
	
	//라이딩기록조회 뷰
	@RequestMapping(value = "/myridingrecordlist.action", method = RequestMethod.GET)
	public String myRidingRecordList()
	{
		String view = "/WEB-INF/eh/MyRidingRecordList.jsp";
		return view;
	}
	
	//라이딩기록조회 뷰 - 상세보기
	@RequestMapping(value = "/myridingrecord.action", method = RequestMethod.GET)
	public String myRidingRecord()
	{
		String view = "/WEB-INF/eh/MyRidingRecord.jsp";
		return view;
	}
	
	
	//나의등급조회 뷰
	@RequestMapping(value = "/myrationandscorelist.action", method = RequestMethod.GET)
	public String myRationAndScoreList()
	{
		String view = "/WEB-INF/eh/MyRationAndScoreList.jsp";
		return view;
	}
	
	
	//내가작성한게시글조회 뷰
	@RequestMapping(value = "/myreviewlist.action", method = RequestMethod.GET)
	public String myReviewList()
	{
		String view = "/WEB-INF/eh/MyReviewList.jsp";
		return view;
	}
	
	
	//패널티조회 뷰
	@RequestMapping(value = "/mypenaltylist.action", method = RequestMethod.GET)
	public String myPenaltyList()
	{
		String view = "/WEB-INF/eh/MyPenaltyList.jsp";
		return view;
	}
	
	
	//회원탈퇴 뷰
	@RequestMapping(value = "/membersecession.action", method = RequestMethod.GET)
	public String memberSecession()
	{
		String view = "/WEB-INF/eh/MemberSecession.jsp";
		return view;
	}
	
	//쪽지 뷰
	@RequestMapping(value = "/letter.action", method = RequestMethod.GET)
	public String letter()
	{
		String view = "/WEB-INF/eh/Letter.jsp";
		return view;
	}
	
	//쪽지 뷰
	@RequestMapping(value = "/letterlist.action", method = RequestMethod.GET)
	public String letterList()
	{
		String view = "/WEB-INF/eh/LetterList.jsp";
		return view;
	}
	
	//쪽지 뷰
	@RequestMapping(value = "/letterresendform.action", method = RequestMethod.GET)
	public String letterReSendForm()
	{
		String view = "/WEB-INF/eh/LetterReSendForm.jsp";
		return view;
	}
	
	//쪽지 뷰
	@RequestMapping(value = "/lettersendform.action", method = RequestMethod.GET)
	public String letterSendForm()
	{
		String view = "/WEB-INF/eh/LetterSendForm.jsp";
		return view;
	}
	
	//쪽지 뷰
	@RequestMapping(value = "/lettersendform2.action", method = RequestMethod.GET)
	public String letterSendForm2()
	{
		String view = "/WEB-INF/eh/LetterSendForm2.jsp";
		return view;
	}
}
