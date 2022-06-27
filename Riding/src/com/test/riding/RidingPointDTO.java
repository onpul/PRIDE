package com.test.riding;

import java.util.ArrayList;

// 경유지 DTO
public class RidingPointDTO
{
	ArrayList<String> point_id, riding_id, latitude, longitude, address, detail_address;

	public ArrayList<String> getPoint_id()
	{
		return point_id;
	}

	public void setPoint_id(ArrayList<String> point_id)
	{
		this.point_id = point_id;
	}

	public ArrayList<String> getRiding_id()
	{
		return riding_id;
	}

	public void setRiding_id(ArrayList<String> riding_id)
	{
		this.riding_id = riding_id;
	}

	public ArrayList<String> getLatitude()
	{
		return latitude;
	}

	public void setLatitude(ArrayList<String> latitude)
	{
		this.latitude = latitude;
	}

	public ArrayList<String> getLongitude()
	{
		return longitude;
	}

	public void setLongitude(ArrayList<String> longitude)
	{
		this.longitude = longitude;
	}

	public ArrayList<String> getAddress()
	{
		return address;
	}

	public void setAddress(ArrayList<String> address)
	{
		this.address = address;
	}

	public ArrayList<String> getDetail_address()
	{
		return detail_address;
	}

	public void setDetail_address(ArrayList<String> detail_address)
	{
		this.detail_address = detail_address;
	}
		
	
}
