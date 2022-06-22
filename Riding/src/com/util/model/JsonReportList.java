package com.util.model;

import java.util.ArrayList;

import com.test.choonghee.ViewReportListDTO;

public class JsonReportList
{
	
	public String toJson(ArrayList<ViewReportListDTO> list)
	{
		String result = "";
		
		StringBuffer sb = new StringBuffer();
		sb.append("[");
		for (ViewReportListDTO i : list)
		{
			sb.append("{");
			sb.append("\"r_id\":\"" + i.getR_id() + "\",");
			sb.append("\"user_id\":\"" + i.getUser_id() + "\",");
			sb.append("\"nickname\":\"" + i.getReport_date() + "\",");
			sb.append("\"status\":\"" + i.getStatus() + "\",");
			sb.append("\"status_id\":\"" + i.getStatus_id() + "\",");
			sb.append("\"report_type\":\"" + i.getReport_type() + "\",");
			sb.append("\"content\":\"" + i.getContent() + "\",");
			sb.append("\"num\":\"" + i.getNum() + "\"");
			sb.append("},");
		}
		result = sb.toString();
		
		result = result.substring(0, result.length()-1);
		result += result + "]";
		return result;
	}
}
