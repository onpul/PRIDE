package com.test.choonghee;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

public interface IViewReportListDAO
{
	// 신고 내역 조회. 최초 요청
	public ArrayList<ViewReportListDTO> list(@Param("num")int num);
	
	// 신고 내역 조회 - 상세 내역
	public ArrayList<ViewReportListDTO> listDetail(@Param("where")String where); 
	
	// 신고 내역 조회 페이지 조건 추가. AJAX 용
	public ArrayList<ViewReportListDTO> listPage(@Param("where")String where, @Param("orderBy")String orderBy
			, @Param("start")int start, @Param("end")int end);
	
	// 해당 조건 신고 내역 수
	public int count(@Param("where")String where);
	
	// 맛집 후기 게시글 조회
	public String reviewContent(@Param("r_id")String r_id);
	
	// 신고 처리 - 후기
	public int insertReviewProcess(@Param("r_id")String r_id, @Param("admin_id")String admin_id, @Param("status")String status);
	
	// 신고 처리 - 참여자
	public int insertParticiProcess(@Param("r_id")String r_id, @Param("admin_id")String admin_id, @Param("status")String status);
}
