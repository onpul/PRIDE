package com.test.choonghee;

import java.util.ArrayList;

public interface IFacilityFormDAO
{
	// 시설 종류
	public ArrayList<FacilityFormDTO> facilityTypeList();
	
	// 시설 정보 요청
	public ArrayList<FacilityFormDTO> facilityInfo();
	
	// 시설 등록 요청
	public int addFacility(FacilityFormDTO dto);
	
	// 시설 수정 요청
	public int modifyFacility(FacilityFormDTO dto);
	
	// 시설 삭제 요청
	public int removeFacility(FacilityFormDTO dto);
	
	
}
