package com.test.eh;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class EhModelController
{
	//평가지(방장)폼에서 입력 받은 값 insert 시키기.
	//@RequestMapping(value = "/evaluationinsertleader.action",method = RequestMethod.GET)
	public String evalAdd(EvaluationDTO dto)
	{
		String view = "redirect:evaluationleaderform.action";
		//넘어오는 애들
		//작성자 --> 세션
		//모임id --> 
		//attendance 결석자
		//kindness 가장 친절한사람
		//notKindness 가장 불친절
		//dangerRiding 위험한 라이딩
		//notCompletion 완주 못한사람
		//different 실제 다른사람
		//게터세터 넘어오는 name 과 같아야 함.
		//즉 위 애들로 속성값 다시 정의
		
		
		return view;
	}
}
