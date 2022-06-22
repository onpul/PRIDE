/*
StudentDTO.java
*/

package com.test.ljy;


public class NoticeDTO
{
	private String notice_id ,user_id,n_content_id,send_date,open_date;

	public String getNotice_id()
	{
		return notice_id;
	}

	public void setNotice_id(String notice_id)
	{
		this.notice_id = notice_id;
	}

	public String getUser_id()
	{
		return user_id;
	}

	public void setUser_id(String user_id)
	{
		this.user_id = user_id;
	}

	public String getN_content_id()
	{
		return n_content_id;
	}

	public void setN_content_id(String n_content_id)
	{
		this.n_content_id = n_content_id;
	}

	public String getSend_date()
	{
		return send_date;
	}

	public void setSend_date(String send_date)
	{
		this.send_date = send_date;
	}

	public String getOpen_date()
	{
		return open_date;
	}

	public void setOpen_date(String open_date)
	{
		this.open_date = open_date;
	}
	
	
}
