package com.test.sm;

import java.util.ArrayList;

public interface ICreateDAO 
{
	
	//모임수 확인
	public int count(); 
		
	//모임 리스트(목록) 확인
	public ArrayList<CreateDTO> list();
		
	//모임 데이터 추가
	public int add(CreateDTO c);
		
	//모임 데이터 검색
	public CreateDTO search(String riding_id);
	
	
	

}
