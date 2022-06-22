package com.test.eh;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class MyPageMainDAO implements IMyPageMainDAO
{
	private Connection conn;
	@Override
	public ArrayList<MyPageMainDTO> memberList(String user_id) throws ClassNotFoundException, SQLException
	{
		conn = DBConn.getConnection();
		ArrayList<MyPageMainDTO> result = new ArrayList<MyPageMainDTO>();
		
		//System.out.println("넘어오는 user_id 값 " + user_id );
		
		String sql = "SELECT USER_ID,EMAIL,NICKNAME,ONEWORD,PI_ADDRESS\r\n" + 
				"FROM VIEW_MYPAGEMAIN\r\n" + 
				"WHERE USER_ID = ?";
		
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		try
		{
			//int user_id_number = Integer.parseInt(user_id);
			
			//pstmt.setInt(1, user_id_number);
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
