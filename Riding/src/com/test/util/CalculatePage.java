package com.test.util;

public class CalculatePage
{
	// totalData: 불러와야 할 총 데이터 개수
	// requestPageNum: 요청하는 페이지 번호
	// numPerPage: 한 페이지에 노출되는 데이터 개수 ( 한 페이지에 10개, 5개....)
	public static int[] calStartAndEnd(int totalData, int requestPageNum, int numPerPage)
	{
		// start: 총 데이터 개수 중에서 시작 번호
		// end: 총 데이터 개수 중에서 끝 번호
		// 1개에 한 페이지. 3페이지 요청이면. 31~40 이런 식 
		int start = (requestPageNum-1) * numPerPage + 1;
		int end = (start + (numPerPage-1)) <= totalData
					? start + (numPerPage-1) : totalData;
		
		return new int[]{start, end};
	}
	
	// 페이지 장 수 계산
	// unitPage: 페이지에서 노출되는 페이지 목록 수.
	// 예를 들어 footer 1~5페이지 이동 버튼
	// 또는 6~10 페이지 이동 버튼. 이 경우 unitPage: 5
	public static int[] calPages(int totalData, int requestPageNum, int unitPage)
	{
		// totalPages: 필요한 총 페이지 수
		int totalPages;
		if (totalData % unitPage == 0)
			totalPages = totalData / unitPage;
		else
			totalPages = totalData / unitPage +1;
		
		if (requestPageNum > totalPages)
			requestPageNum = totalPages;
		
		// 노출된 페이지 목록 중 가장 첫 번째
		int startPage = (requestPageNum / unitPage)*unitPage + 1;
		
		// 23 페이지에서 11페이지로 가거나 35페이지에서 21페이지로 가는 페이지		
		int prevPage = startPage - unitPage;
		if (prevPage < 0)
			prevPage = 1;
		
		// 노출된 페이지 목록 중 가장 마지막
		int endPage = startPage + (unitPage - 1);
		// 23페이지에서 31페이지로 가거나 35페이에서 41페이지로 가는 페이지
		int nextPage = endPage + 1;
		if (endPage >=  totalPages)
		{
			endPage = totalPages;
			nextPage = totalPages;
		}
		
		return new int[] {totalPages, startPage, endPage, prevPage, nextPage};
	}
	
	public static String[] pageCondition(String status, String type, String order)
	{
		String orderBy = "";		
		String where = "";
		if ( !status.equals("none") && type.equals("none"))
		{
			where = "WHERE STATUS_ID='" + status + "'";	
		}		
		else if ( status.equals("none") && !type.equals("none"))
		{
			where = "WHERE REPORT_TYPE='" + type + "'";	
		}
		
		else if ( !status.equals("none") && !type.equals("none") )
		{
			where = "WHERE STATUS_ID='" + status + "' AND REPORT_TYPE='" + type + "'";
			
		}
		
		if (order.equals("none"))
			orderBy = "";
		else
			orderBy = "ORDER BY REPORT_DATE " + order;
		
		return new String[]{where, orderBy};
		
	}
}
