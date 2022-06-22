package com.test.sm;

import java.util.Date;

public class FacilityDTO
{
	private String facility_id, f_type_id, req_user_id, admin_id, latitude, longitude, address, detail_addresss;
	private Date request_date, open_date, aceept_date;
	
	//getter / setter 
	public String getFacility_id() {
		return facility_id;
	}
	public void setFacility_id(String facility_id) {
		this.facility_id = facility_id;
	}
	public String getF_type_id() {
		return f_type_id;
	}
	public void setF_type_id(String f_type_id) {
		this.f_type_id = f_type_id;
	}
	public String getReq_user_id() {
		return req_user_id;
	}
	public void setReq_user_id(String req_user_id) {
		this.req_user_id = req_user_id;
	}
	public String getAdmin_id() {
		return admin_id;
	}
	public void setAdmin_id(String admin_id) {
		this.admin_id = admin_id;
	}
	public String getLatitude() {
		return latitude;
	}
	public void setLatitude(String latitude) {
		this.latitude = latitude;
	}
	public String getLongitude() {
		return longitude;
	}
	public void setLongitude(String longitude) {
		this.longitude = longitude;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getDetail_addresss() {
		return detail_addresss;
	}
	public void setDetail_addresss(String detail_addresss) {
		this.detail_addresss = detail_addresss;
	}
	public Date getRequest_date() {
		return request_date;
	}
	public void setRequest_date(Date request_date) {
		this.request_date = request_date;
	}
	public Date getOpen_date() {
		return open_date;
	}
	public void setOpen_date(Date open_date) {
		this.open_date = open_date;
	}
	public Date getAceept_date() {
		return aceept_date;
	}
	public void setAceept_date(Date aceept_date) {
		this.aceept_date = aceept_date;
	}
	
	
	
	
	
	
	
	
}
