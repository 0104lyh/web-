package com.db;
import java.sql.*;
public class StudentsDB1 {

	public static void main(String[] args) {
		Connection con=null;
		Statement statement=null;
		try {
			con = ConnectionManager.getConnection();
			String strSql = "insert into Students values('2013880123','康熙','1234','男',10201541)";
			statement = con.createStatement();
			statement.execute(strSql);
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			ConnectionManager.closeStatement(statement);
			ConnectionManager.closeConnection(con);
		}
	}
}
