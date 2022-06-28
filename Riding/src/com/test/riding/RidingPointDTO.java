package com.test.riding;

import java.util.ArrayList;

// 경유지 DTO
public class RidingPointDTO
{
	private String point_id, riding_id, latitude, longitude, address, detail_address;

	public String getPoint_id()
	{
		return point_id;
	}

	public void setPoint_id(String point_id)
	{
		this.point_id = point_id;
	}

	public String getRiding_id()
	{
		return riding_id;
	}

	public void setRiding_id(String riding_id)
	{
		this.riding_id = riding_id;
	}

	public String getLatitude()
	{
		return latitude;
	}

	public void setLatitude(String latitude)
	{
		this.latitude = latitude;
	}

	public String getLongitude()
	{
		return longitude;
	}

	public void setLongitude(String longitude)
	{
		this.longitude = longitude;
	}

	public String getAddress()
	{
		return address;
	}

	public void setAddress(String address)
	{
		this.address = address;
	}

	public String getDetail_address()
	{
		return detail_address;
	}

	public void setDetail_address(String detail_address)
	{
		this.detail_address = detail_address;
	}
	
	
	
}
