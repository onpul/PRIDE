// 평가페이지 DTO
package com.test.eh;

public class EvaluationDTO
{
	
	// dto 는 form 에서 넘어오는 name 과 같아야 자동 getter / setter 된다.
	
	private String nickName, user_id;
	private String riding_id, riding_name;
	private String question_id, qu_content;
	private String attendance, kindness, notKindness,dangerRiding, notCompletion, different;
	private String p_member_id, check_atte_id, answer_id;
	private String leaderCheck;
	public String getNickName()
	{
		return nickName;
	}
	public void setNickName(String nickName)
	{
		this.nickName = nickName;
	}
	public String getUser_id()
	{
		return user_id;
	}
	public void setUser_id(String user_id)
	{
		this.user_id = user_id;
	}
	public String getRiding_id()
	{
		return riding_id;
	}
	public void setRiding_id(String riding_id)
	{
		this.riding_id = riding_id;
	}
	public String getRiding_name()
	{
		return riding_name;
	}
	public void setRiding_name(String riding_name)
	{
		this.riding_name = riding_name;
	}
	public String getQuestion_id()
	{
		return question_id;
	}
	public void setQuestion_id(String question_id)
	{
		this.question_id = question_id;
	}
	public String getQu_content()
	{
		return qu_content;
	}
	public void setQu_content(String qu_content)
	{
		this.qu_content = qu_content;
	}
	public String getAttendance()
	{
		return attendance;
	}
	public void setAttendance(String attendance)
	{
		this.attendance = attendance;
	}
	public String getKindness()
	{
		return kindness;
	}
	public void setKindness(String kindness)
	{
		this.kindness = kindness;
	}
	public String getNotKindness()
	{
		return notKindness;
	}
	public void setNotKindness(String notKindness)
	{
		this.notKindness = notKindness;
	}
	public String getDangerRiding()
	{
		return dangerRiding;
	}
	public void setDangerRiding(String dangerRiding)
	{
		this.dangerRiding = dangerRiding;
	}
	public String getNotCompletion()
	{
		return notCompletion;
	}
	public void setNotCompletion(String notCompletion)
	{
		this.notCompletion = notCompletion;
	}
	public String getDifferent()
	{
		return different;
	}
	public void setDifferent(String different)
	{
		this.different = different;
	}
	public String getP_member_id()
	{
		return p_member_id;
	}
	public void setP_member_id(String p_member_id)
	{
		this.p_member_id = p_member_id;
	}
	public String getCheck_atte_id()
	{
		return check_atte_id;
	}
	public void setCheck_atte_id(String check_atte_id)
	{
		this.check_atte_id = check_atte_id;
	}
	public String getAnswer_id()
	{
		return answer_id;
	}
	public void setAnswer_id(String answer_id)
	{
		this.answer_id = answer_id;
	}
	public String getLeaderCheck()
	{
		return leaderCheck;
	}
	public void setLeaderCheck(String leaderCheck)
	{
		this.leaderCheck = leaderCheck;
	}
	
	
	

}
