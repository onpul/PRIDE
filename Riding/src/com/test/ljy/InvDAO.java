/*
.java 
*/
package com.test.ljy;

import java.util.ArrayList;

public interface InvDAO
{
	// 초대장 리스트
	public ArrayList<InvDTO> list_INV();

	public int delete(InvDTO i);
}
