package com.test.mj;

public class RidingDTO
{
	//private int user_id;
	//private int mood_p_id, eat_p_id, dining_p_id, sex_p_id, age_p_id;
	
	// 다인라이딩
	private int user_id;
	private int mood_p_id, eat_p_id, dining_p_id, sex_p_id, age_p_id, step_id, speed_id;
	
	private String riding_id, leader_id, riding_name, start_date, end_date, created_date;
	private int e_grede_id, maximum, open;
	
	private String meet_lati, meet_longi, meet_detail, start_lati, start_longi, start_address
			, start_detail, end_lati, end_longi, end_address, end_detail, confirm_date, comments;
	
	// (다인라이딩) 참여한 회원정보
	private String p_member_id, partici_date;
	
	// 다인라이딩 경유지
	private String point_id, latitude, longitude, address, point_detail_address;
	
	// 라이딩 속성
	private String sp_content, ap_content, ep_content, dp_content, mp_content, step_type, speed_type;

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

	public int getStep_id()
	{
		return step_id;
	}

	public void setStep_id(int step_id)
	{
		this.step_id = step_id;
	}

	public int getSpeed_id()
	{
		return speed_id;
	}

	public void setSpeed_id(int speed_id)
	{
		this.speed_id = speed_id;
	}

	public String getRiding_id()
	{
		return riding_id;
	}

	public void setRiding_id(String riding_id)
	{
		this.riding_id = riding_id;
	}

	public String getLeader_id()
	{
		return leader_id;
	}

	public void setLeader_id(String leader_id)
	{
		this.leader_id = leader_id;
	}

	public String getRiding_name()
	{
		return riding_name;
	}

	public void setRiding_name(String riding_name)
	{
		this.riding_name = riding_name;
	}

	public String getStart_date()
	{
		return start_date;
	}

	public void setStart_date(String start_date)
	{
		this.start_date = start_date;
	}

	public String getEnd_date()
	{
		return end_date;
	}

	public void setEnd_date(String end_date)
	{
		this.end_date = end_date;
	}

	public String getCreated_date()
	{
		return created_date;
	}

	public void setCreated_date(String created_date)
	{
		this.created_date = created_date;
	}

	public int getE_grede_id()
	{
		return e_grede_id;
	}

	public void setE_grede_id(int e_grede_id)
	{
		this.e_grede_id = e_grede_id;
	}

	public int getMaximum()
	{
		return maximum;
	}

	public void setMaximum(int maximum)
	{
		this.maximum = maximum;
	}

	public int getOpen()
	{
		return open;
	}

	public void setOpen(int open)
	{
		this.open = open;
	}

	public String getMeet_lati()
	{
		return meet_lati;
	}

	public void setMeet_lati(String meet_lati)
	{
		this.meet_lati = meet_lati;
	}

	public String getMeet_longi()
	{
		return meet_longi;
	}

	public void setMeet_longi(String meet_longi)
	{
		this.meet_longi = meet_longi;
	}

	public String getMeet_detail()
	{
		return meet_detail;
	}

	public void setMeet_detail(String meet_detail)
	{
		this.meet_detail = meet_detail;
	}

	public String getStart_lati()
	{
		return start_lati;
	}

	public void setStart_lati(String start_lati)
	{
		this.start_lati = start_lati;
	}

	public String getStart_longi()
	{
		return start_longi;
	}

	public void setStart_longi(String start_longi)
	{
		this.start_longi = start_longi;
	}

	public String getStart_address()
	{
		return start_address;
	}

	public void setStart_address(String start_address)
	{
		this.start_address = start_address;
	}

	public String getStart_detail()
	{
		return start_detail;
	}

	public void setStart_detail(String start_detail)
	{
		this.start_detail = start_detail;
	}

	public String getEnd_lati()
	{
		return end_lati;
	}

	public void setEnd_lati(String end_lati)
	{
		this.end_lati = end_lati;
	}

	public String getEnd_longi()
	{
		return end_longi;
	}

	public void setEnd_longi(String end_longi)
	{
		this.end_longi = end_longi;
	}

	public String getEnd_address()
	{
		return end_address;
	}

	public void setEnd_address(String end_address)
	{
		this.end_address = end_address;
	}

	public String getEnd_detail()
	{
		return end_detail;
	}

	public void setEnd_detail(String end_detail)
	{
		this.end_detail = end_detail;
	}

	public String getConfirm_date()
	{
		return confirm_date;
	}

	public void setConfirm_date(String confirm_date)
	{
		this.confirm_date = confirm_date;
	}

	public String getComments()
	{
		return comments;
	}

	public void setComments(String comments)
	{
		this.comments = comments;
	}

	public String getP_member_id()
	{
		return p_member_id;
	}

	public void setP_member_id(String p_member_id)
	{
		this.p_member_id = p_member_id;
	}

	public String getPartici_date()
	{
		return partici_date;
	}

	public void setPartici_date(String partici_date)
	{
		this.partici_date = partici_date;
	}

	public String getPoint_id()
	{
		return point_id;
	}

	public void setPoint_id(String point_id)
	{
		this.point_id = point_id;
	}

	public String getLatitude()
	{
		return latitude;
	}

	public void setLatitude(String latitude)
	{
		this.latitude = latitude;
	}

	public String getLongitude()
	{
		return longitude;
	}

	public void setLongitude(String longitude)
	{
		this.longitude = longitude;
	}

	public String getAddress()
	{
		return address;
	}

	public void setAddress(String address)
	{
		this.address = address;
	}

	public String getDetail_address()
	{
		return point_detail_address;
	}

	public void setPoint_detail_address(String point_detail_address)
	{
		this.point_detail_address = point_detail_address;
	}

	public String getSp_content()
	{
		return sp_content;
	}

	public void setSp_content(String sp_content)
	{
		this.sp_content = sp_content;
	}

	public String getAp_content()
	{
		return ap_content;
	}

	public void setAp_content(String ap_content)
	{
		this.ap_content = ap_content;
	}

	public String getEp_content()
	{
		return ep_content;
	}

	public void setEp_content(String ep_content)
	{
		this.ep_content = ep_content;
	}

	public String getDp_content()
	{
		return dp_content;
	}

	public void setDp_content(String dp_content)
	{
		this.dp_content = dp_content;
	}

	public String getMp_content()
	{
		return mp_content;
	}

	public void setMp_content(String mp_content)
	{
		this.mp_content = mp_content;
	}

	public String getStep_type()
	{
		return step_type;
	}

	public void setStep_type(String step_type)
	{
		this.step_type = step_type;
	}

	public String getSpeed_type()
	{
		return speed_type;
	}

	public void setSpeed_type(String speed_type)
	{
		this.speed_type = speed_type;
	}
}
