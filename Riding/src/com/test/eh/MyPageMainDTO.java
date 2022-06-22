package com.test.eh;

public class MyPageMainDTO
{
	// 마이페이지 상단에 출력하는 정보들
	
	// (회원아이디), 이메일, 닉네임, 한마디, 프로필아이콘 img 주소
	private String user_id, email, nickname, oneword,pi_address;

	
	//getter / setter
	public String getUser_id()
	{
		return user_id;
	}

	public void setUser_id(String user_id)
	{
		this.user_id = user_id;
	}

	public String getEmail()
	{
		return email;
	}

	public void setEmail(String email)
	{
		this.email = email;
	}

	public String getNickname()
	{
		return nickname;
	}

	public void setNickname(String nickname)
	{
		this.nickname = nickname;
	}

	public String getOneword()
	{
		return oneword;
	}

	public void setOneword(String oneword)
	{
		this.oneword = oneword;
	}

	public String getPi_address()
	{
		return pi_address;
	}

	public void setPi_address(String pi_address)
	{
		this.pi_address = pi_address;
	}
	
	

}
