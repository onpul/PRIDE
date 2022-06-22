package com.test.eh;

import java.sql.SQLException;
import java.util.ArrayList;

public interface IMyPageMainDAO
{
	public ArrayList<MyPageMainDTO> memberList(String user_id) throws ClassNotFoundException, SQLException;
}
