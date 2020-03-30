package com.db;
import java.sql.*;
public class StudentsDB3 {
	public static void main(String[] args) {
		 Connection con = null;
		 PreparedStatement pStatement = null;
		 try {
		      con = ConnectionManager.getConnection();  //1.创建连接
		      String strSql = "delete from students where studentName=?";  
			  
		      pStatement = con.prepareStatement(strSql);  //2.创建预处理语句总管
		      pStatement.setString(1, "乾隆");
		      int row=pStatement.executeUpdate();  //3.语句总管执行SQL语句
		      System.out.println("成功删除"+row+"条数据！");   
		 } catch (SQLException sqlE) {
		       sqlE.printStackTrace();
		    } finally {
		       ConnectionManager.closeStatement(pStatement);//4.关闭语句总管、连接
		       ConnectionManager.closeConnection(con);
		    }
	}
}
