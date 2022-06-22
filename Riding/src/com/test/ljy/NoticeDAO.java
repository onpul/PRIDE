/*
Notice.java 
*/
package com.test.ljy;

import java.util.ArrayList;

public interface NoticeDAO
{
	 // 알림 리스트 
	public ArrayList<NoticeDTO> list_Notice();
	
	public int delete(NoticeDTO m);
	public int delete_read(NoticeDTO m);
}
