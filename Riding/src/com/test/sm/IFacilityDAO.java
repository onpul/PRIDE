package com.test.sm;

import java.util.ArrayList;

public interface IFacilityDAO
{
	//시설 수 확인
	public int count();
	
	//시설 리스트(목록) 확인
	public ArrayList<FacilityDTO> list();
	
	//시설 데이터 추가
	public int add(FacilityDTO f);
	
	//시설 데이터 검색
	public FacilityDTO search(String facility_id);
}


