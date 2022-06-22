/*
FRIEND.java 
*/
package com.test.ljy;

import java.util.ArrayList;

public interface FriDAO
{
	 // 친구 리스트 
	public ArrayList<FriDTO> list_Fri();
	
	public int count_Fri();
}
