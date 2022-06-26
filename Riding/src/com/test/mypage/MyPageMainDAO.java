package com.test.mypage;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.test.util.DBConn;

public class MyPageMainDAO implements IMyPageMainDAO
{
	private Connection conn;
	
	
	@Override
	public ArrayList<MyPageMainDTO> memberList(String user_id) throws ClassNotFoundException, SQLException
	{
		System.out.println("어디서 문제인가요 ? 진입은 하시나요 ? " + user_id);
		conn = DBConn.getConnection();
		ArrayList<MyPageMainDTO> result = new ArrayList<MyPageMainDTO>();
		
		
		String sql = "SELECT USER_ID,EMAIL,NICKNAME,ONEWORD,PI_ADDRESS\r\n" + 
				"FROM VIEW_MYPAGEMAIN\r\n" + 
				"WHERE USER_ID = ?";
		
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		try
		{
			pstmt.setString(1, user_id);
			ResultSet rs = pstmt.executeQuery();

			if (rs.next())
			{
				MyPageMainDTO dto = new MyPageMainDTO();
				dto.setUser_id(rs.getString("USER_ID"));
				dto.setEmail(rs.getString("EMAIL"));
				dto.setNickname(rs.getString("NICKNAME"));
				dto.setOneword(rs.getString("ONEWORD"));
				dto.setPi_address(rs.getString("PI_ADDRESS"));
				
				result.add(dto);
			}
			
			rs.close();
			pstmt.close();
			DBConn.close();
			
		} catch (Exception e)
		{
			System.out.println("MyPageMainDAO.java" + e.toString());
		}
		return result;
	}

}
