package com.test.sm;

import java.util.ArrayList;

public interface IStoreDAO 
{
	//가게 수 확인
	public int count(); 
	
	//가게 리스트(목록) 확인
	public ArrayList<StoreDTO> list();
	
	//가게 데이터 추가
	public int add(StoreDTO s);
	
	//가게 데이터 검색
	public StoreDTO search(String restaurant_id);
	
	
}
