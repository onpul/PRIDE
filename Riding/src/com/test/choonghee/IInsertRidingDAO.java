package com.test.choonghee;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

public interface IInsertRidingDAO
{
	public int insertRiding(InsertRidingDTO dto);
	
	public int insertRidingPoint(@Param("riding_id")String riding_id
			, @Param("latitude")String latitude, @Param("longitude")String longitude
			, @Param("address")String address, @Param("detail_address")String detail_address);
}
