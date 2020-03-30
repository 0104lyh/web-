package com.db;

import java.util.*;
import java.sql.*;

import com.vo.Students;

public class StudentsDB6 {
	
    public List<Students> getAllStudents(){
    	List<Students> allStudents=new ArrayList<Students>();
    	Connection con=null;
    	PreparedStatement pStatement=null;
    	ResultSet res=null;
    	try {
			con = ConnectionManager.getConnection();//1.创建连接
			String sql = "select * from Students";
			pStatement = con.prepareStatement(sql);//2.创建预处理语句总管
			res = pStatement.executeQuery();//3.语句总管执行查询
			while (res.next()) {
				String studentId = res.getString(1);
				String studentName = res.getString("studentName");
				String studentPwd = res.getString(3);
				String sex = res.getString("sex");
				int classId = res.getInt(5);
				//构造方法组装成一个Students对象stu
				Students stu = new Students(studentId, studentName, studentPwd,
						sex, classId);
				allStudents.add(stu);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
		    ConnectionManager.closeResultSet(res);//5.关闭结果集 对象、语句总管、连接
		    ConnectionManager.closeStatement(pStatement);
		    ConnectionManager.closeConnection(con); 		
		}
    	return allStudents;
    	
    }
    
    public int insertStudents(Students stu){
    	int flag=0;
        Connection con = null;
	    PreparedStatement pStatement = null;
	    try {
	      con = ConnectionManager.getConnection();  //1.创建连接
	      String strSql = "insert into students values(?,?,?,?,?)";  
	      pStatement = con.prepareStatement(strSql);  //2.创建预处理语句总管
	      pStatement.setString(1, stu.getStudentId());
	      pStatement.setString(2, stu.getStudentName());
	      pStatement.setString(3, stu.getStudentPwd());
	      pStatement.setString(4, stu.getSex());
	      pStatement.setInt(5, stu.getClassId());
	      flag=pStatement.executeUpdate();  //3.语句总管执行SQL语句
	    } catch (SQLException sqlE) {
	       sqlE.printStackTrace();
	    } finally {
	       ConnectionManager.closeStatement(pStatement);//4.关闭语句总管、连接
	       ConnectionManager.closeConnection(con);
	    }
	    return flag;
    }
    
    public int updateStudents(Students stu){
    	int row=0;
    	Connection con = null;
		 PreparedStatement pStatement = null;
		 try {
		      con = ConnectionManager.getConnection();  //1.创建连接
		      String strSql = "update students set studentName=?,studentPwd=?,sex=?,classId=? where studentId=?";  
		      pStatement = con.prepareStatement(strSql);  //2.创建预处理语句总管
		      pStatement.setString(1, stu.getStudentName());
		      pStatement.setString(2, stu.getStudentPwd());
		      pStatement.setString(3, stu.getSex());
		      pStatement.setInt(4, stu.getClassId());
		      pStatement.setString(5,stu.getStudentId());
		      row=pStatement.executeUpdate();  //3.语句总管执行SQL语句 
		 } catch (SQLException sqlE) {
		       sqlE.printStackTrace();
		    } finally {
		       ConnectionManager.closeStatement(pStatement);//4.关闭语句总管、连接
		       ConnectionManager.closeConnection(con);
		    }
		 return row;
    }
    
    public Students getStuById(String studentId){
    	 Students stu=null;
		 Connection con = null;
		 PreparedStatement pStatement = null;
		 ResultSet resSet=null;
		 try {
		      con = ConnectionManager.getConnection();  //1.创建连接
		      String strSql = "select * from students where studentId=?";  
		      pStatement = con.prepareStatement(strSql);  //2.创建预处理语句总管
		      pStatement.setString(1, studentId);
		      resSet=pStatement.executeQuery();  //3.语句总管执行SQL语句
		      if(resSet.next()){
		    	 String studentName=resSet.getString(2);
		    	 String studentPwd=resSet.getString(3);
		    	 String sex=resSet.getString(4);
		    	 int classId=resSet.getInt(5);
		    	 stu=new Students(studentId,studentName,studentPwd,sex,classId);
		      }   
		 } catch (SQLException sqlE) {
		       sqlE.printStackTrace();
		    } finally {
		       ConnectionManager.closeStatement(pStatement);//4.关闭语句总管、连接
		       ConnectionManager.closeConnection(con);
		    }
    	return stu;
    }
	public static void main(String[] args) {
		StudentsDB6 db6=new StudentsDB6();
/*		List<Students> all=db6.getAllStudents();
		for(int i=0;i<all.size();i++){
		     Students stu=(Students)all.get(i);
		     System.out.println(stu);
		}*/
		Students stu=new Students("2008130173","罗维林","123","男",10201542);
		int flag=db6.updateStudents(stu);
		System.out.println("abc"+flag);
	}
}
