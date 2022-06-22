// 신고 내역을 위한 DTO

package com.test.choonghee;

public class ViewReportListDTO
{
	String r_id, user_id, nickname, report_date, status
	, status_id, report_type, content, reported_user_id, r_user_nickname, num;
		
	public String getR_user_nickname()
	{
		return r_user_nickname;
	}

	public void setR_user_nickname(String r_user_nickname)
	{
		this.r_user_nickname = r_user_nickname;
	}

	public String getReported_user_id()
	{
		return reported_user_id;
	}

	public void setReported_user_id(String reported_user_id)
	{
		this.reported_user_id = reported_user_id;
	}

	public String getStatus_id()
	{
		return status_id;
	}

	public void setStatus_id(String status_id)
	{
		this.status_id = status_id;
	}

	public String getR_id()
	{
		return r_id;
	}

	public void setR_id(String r_id)
	{
		this.r_id = r_id;
	}

	public String getUser_id()
	{
		return user_id;
	}

	public void setUser_id(String user_id)
	{
		this.user_id = user_id;
	}

	public String getNickname()
	{
		return nickname;
	}

	public void setNickname(String nickname)
	{
		this.nickname = nickname;
	}

	public String getReport_date()
	{
		return report_date;
	}

	public void setReport_date(String report_date)
	{
		this.report_date = report_date;
	}

	public String getStatus()
	{
		return status;
	}

	public void setStatus(String status)
	{
		this.status = status;
	}

	public String getReport_type()
	{
		return report_type;
	}

	public void setReport_type(String report_type)
	{
		this.report_type = report_type;
	}

	public String getContent()
	{
		return content;
	}

	public void setContent(String content)
	{
		this.content = content;
	}

	public String getNum()
	{
		return num;
	}

	public void setNum(String num)
	{
		this.num = num;
	}
	
	
}
