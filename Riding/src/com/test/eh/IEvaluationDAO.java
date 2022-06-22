package com.test.eh;

import java.util.ArrayList;

public interface IEvaluationDAO
{
	
	// 1. 평가기간인 모임이 있는지 조회하는 메소드
	//    T : 있음 / F : 없음.
	public String evalDateFlagList(String user_id);
	
	// 2. 방장인지 아닌지 조회하는 메소드 → 방장과 참여자가 요청하는 페이지가 달라짐.
	//    T : 방장임 / F : 방장 아님.(참여자임)
	public int leaderFlagList(String user_id);
	
	// 3-1. 문항 조회 메소드 → 방장
	//      테스트 진행 중에는 방장꺼만 실행 예정.
	public ArrayList<EvaluationDTO> leaderQuestionList();
	
	// 3-2. 문항 조회 메소드 → 참여자 일 때는 리더십에 관한 문항 추가.
	public ArrayList<EvaluationDTO> memberQuestionList();
	
	// 4. 모임명 조회 메소드
	public String ridingNameList(String riding_id);
	
	// 5. 평가지 작성자 정보 조회 / 닉네임만 뿌릴 예정	→ dto에 nickName, user_id
	public String userNickNameList(String user_id);
	
	// 6. 참여자 명단 조회 메소드	/ 닉네임만 뿌릴 예정
	public ArrayList<EvaluationDTO> memberList(String riding_id);		
	
	// 7. 제출했는지 판단하는 메소드
	//    T : 제출함 / F : 제출안함.
	public int answerFlag(String user_id);
	
	
	
	//8-1. 8-2 수행 전, 작성자가 참여자 테이블에서 가지는 P_MEMBER_ID 를 반환
	//     --- P_MEMBER_ID 로 입력해야 해서.ㅇㅋ
	public String searchPMemberId(String user_id);
	
	// 8-2. 평가지 제출 시, 응답 테이블에 insert 하는 메소드 ㅇㅋ
	// → dto에 attendance, kindness, notKindness,dangerRiding, notCompletion, different 
	public int answerInsert(EvaluationDTO dto);		
	
	// 9. 평가지 제출 시, 출석체크 테이블에 insert 하는 메소드ㅇㅋ
	public int checkInsert(EvaluationDTO dto);
	
	// 10-1. 10-2 insert 전 , USER_ID로 CHECK_ATTE_ID 찾기(P_MEMBER_ID는 폼에서 넘겨받은 결석지목받은 사람)
	//		 ---- CHECK_ATTE_ID가 필요하다.ㅇㅋ
	public String searchCheckId(String user_id);
	
	// 10-2. 평가지 제출 시, 출석체크응답내용 테이블에 insert 하는 메소드
	public int checkDetailInsert(EvaluationDTO dto);
	
	// 11. 평가지 제출 시, 응답내용 테이블에 insert 하는 메소드
	public int answerDetailInsert(EvaluationDTO dto);
	
	// 12. 응답 ID 찾기
	public String searchAnswerId(String user_id);
	
	
	// 13. user_id 로 현재 속한 riding_id 찾기
	public String searchCurrRidingId(String user_id);
	
	// 14. 질문 ID 조회하기 Q_CONTENT 로
	public String searchQuestionId(String q_content);
	
	
	// 15. 참여자들  ANSWER_DETAIL_LEADERSHIP 테이블 insert
	public int leadershipDetailInsert(EvaluationDTO dto);
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	/*
	// 1. 평가페이지 출력하기 위해 조건
	//    클릭했을 때, 현재 참여중인 모임이 평가기간일 때
	//    페이지 진입 가능하도록
	
	
	// 2. 평가페이지 처음 출력할 때
	//라이딩평가 문항 조회
	public ArrayList<EvaluationDTO> questionList();
	
	//작성자 닉네임가져오기
	public String nickNameList(String user_id);
	
	//00 참여자가 참여한 라이딩 모임 이름 알아오기
	public String ridingName(String user_id);
	
	//00 모임의 참여자명단 닉네임 가져오기
	public ArrayList<EvaluationDTO> particiMemberList(String riding_id);
	
	
	// 3. 평가페이지에서 제출할때 insert
	public int evalutionInsert(EvaluationDTO dto);
	*/
}
