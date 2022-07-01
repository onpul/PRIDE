package com.test.riding;


import java.util.Map;

import org.apache.ibatis.annotations.Param;

public interface IInsertRidingDAO
{
	public int insertRiding(InsertRidingDTO dto);
	
	public int insertRidingPoint(@Param("riding_id")String riding_id
			, @Param("latitude")String latitude, @Param("longitude")String longitude
			, @Param("address")String address, @Param("detail_address")String detail_address);
	
	public int insertParticipatedMember(InsertRidingDTO dto);
	
	public Map<String, String> preference(String user_id);
	
	// 모임 삭제하기
	public int deleteRiding(@Param("riding_id")String riding_id);
	
	// 모임 나가기
	public int exitRiding(@Param("user_id")String user_id, @Param("riding_id")String riding_id);
}
