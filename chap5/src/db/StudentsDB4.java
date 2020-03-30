package com.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class StudentsDB4 {

	public static void main(String[] args) {
		 Connection con = null;
		 PreparedStatement pStatement = null;
		 try {
		      con = ConnectionManager.getConnection();  //1.创建连接
		      String strSql = "update students set studentName=? where studentId=?";  
		      pStatement = con.prepareStatement(strSql);  //2.创建预处理语句总管
		      pStatement.setString(1, "玄烨");
		      pStatement.setString(2, "2013880123");
		      int row=pStatement.executeUpdate();  //3.语句总管执行SQL语句
		      System.out.println("成功修改"+row+"条数据！");   
		 } catch (SQLException sqlE) {
		       sqlE.printStackTrace();
		    } finally {
		       ConnectionManager.closeStatement(pStatement);//4.关闭语句总管、连接
		       ConnectionManager.closeConnection(con);
		    }
	}		

}
