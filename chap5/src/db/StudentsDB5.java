package com.db;
import java.sql.*;

public class StudentsDB5 {

	public static void main(String[] args) {
		 Connection con = null;
		 PreparedStatement pStatement = null;
		 ResultSet resSet=null;
		 try {
		      con = ConnectionManager.getConnection();  //1.创建连接
		      String strSql = "select * from students where studentName=?";  
		      pStatement = con.prepareStatement(strSql);  //2.创建预处理语句总管
		      pStatement.setString(1, "谢亚飞");
		      resSet=pStatement.executeQuery();  //3.语句总管执行SQL语句
		      if(resSet.next()){
		    	 System.out.println("学号为："+resSet.getString(1)); 
		    	 System.out.println("姓名为："+resSet.getString(2)); 
		    	 System.out.println("密码为："+resSet.getString(3)); 
		    	 System.out.println("性别为："+resSet.getString(4)); 
		    	 System.out.println("班级号为："+resSet.getInt(5)); 	    	 
		      }   
		 } catch (SQLException sqlE) {
		       sqlE.printStackTrace();
		    } finally {
		       ConnectionManager.closeStatement(pStatement);//4.关闭语句总管、连接
		       ConnectionManager.closeConnection(con);
		    }
	}		
}
