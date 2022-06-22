package com.test.mj;

public class MemberDTO
{
	// PROFILE_ID, USER_ID, MOOD_P_ID, EAT_P_ID, PIMG_ID, DINING_P_ID, 
	// SEX_P_ID, AGE_P_ID, EMAIL, BIRTHDAY, SEX, PASSWORD, NICKNAME
	
	// 주요 속성 구성
	private int profile_id, user_id, mood_p_id, eat_p_id, pimg_id, dining_p_id,
	            sex_p_id, age_p_id;
	private String email, birthday, sex, password, nickname;
	
	// getter / setter 구성
	public int getProfile_id()
	{
		return profile_id;
	}
	public void setProfile_id(int profile_id)
	{
		this.profile_id = profile_id;
	}
	public int getUser_id()
	{
		return user_id;
	}
	public void setUser_id(int user_id)
	{
		this.user_id = user_id;
	}
	public int getMood_p_id()
	{
		return mood_p_id;
	}
	public void setMood_p_id(int mood_p_id)
	{
		this.mood_p_id = mood_p_id;
	}
	public int getEat_p_id()
	{
		return eat_p_id;
	}
	public void setEat_p_id(int eat_p_id)
	{
		this.eat_p_id = eat_p_id;
	}
	public int getPimg_id()
	{
		return pimg_id;
	}
	public void setPimg_id(int pimg_id)
	{
		this.pimg_id = pimg_id;
	}
	public int getDining_p_id()
	{
		return dining_p_id;
	}
	public void setDining_p_id(int dining_p_id)
	{
		this.dining_p_id = dining_p_id;
	}
	public int getSex_p_id()
	{
		return sex_p_id;
	}
	public void setSex_p_id(int sex_p_id)
	{
		this.sex_p_id = sex_p_id;
	}
	public int getAge_p_id()
	{
		return age_p_id;
	}
	public void setAge_p_id(int age_p_id)
	{
		this.age_p_id = age_p_id;
	}
	public String getEmail()
	{
		return email;
	}
	public void setEmail(String email)
	{
		this.email = email;
	}
	public String getBirthday()
	{
		return birthday;
	}
	public void setBirthday(String birthday)
	{
		this.birthday = birthday;
	}
	public String getSex()
	{
		return sex;
	}
	public void setSex(String sex)
	{
		this.sex = sex;
	}
	public String getPassword()
	{
		return password;
	}
	public void setPassword(String password)
	{
		this.password = password;
	}
	public String getNickname()
	{
		return nickname;
	}
	public void setNickname(String nickname)
	{
		this.nickname = nickname;
	}
}
