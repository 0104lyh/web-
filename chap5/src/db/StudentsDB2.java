package com.db;
import java.sql.*;
public class StudentsDB2 {

	public static void main(String[] args) {
        Connection con = null;
	    PreparedStatement pStatement = null;
	    try {
	      con = ConnectionManager.getConnection();  //1.创建连接
	      String strSql = "insert into students values(?,?,?,?,?)";  
	      pStatement = con.prepareStatement(strSql);  //2.创建预处理语句总管
	      pStatement.setString(1, "2008110106");
	      pStatement.setString(2, "乾隆");
	      pStatement.setString(3, "2008");
	      pStatement.setString(4, "男");
	      pStatement.setInt(5, 10201541);
	      pStatement.executeUpdate();  //3.语句总管执行SQL语句
	    } catch (SQLException sqlE) {
	       sqlE.printStackTrace();
	    } finally {
	       ConnectionManager.closeStatement(pStatement);//4.关闭语句总管、连接
	       ConnectionManager.closeConnection(con);
	    }
	}

}
