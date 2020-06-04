package com.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.*;

import org.junit.Test;

import com.vo.Classes;

public class ClassesDB {
	@Test

	public Map<Integer,String> getClassesMap(){
		Map<Integer,String> classesMap = new HashMap();
		Connection con=null;
		PreparedStatement pStatement=null;
		ResultSet res=null;
		try {
			con = ConnectionManager.getConnection();//1.创建连接
			String sql = "select * from classes";
			pStatement = con.prepareStatement(sql);//2.创建预处理语句总管
			res = pStatement.executeQuery();//3.语句总管执行查询
			while (res.next()) {
				int classId = res.getInt(1);
				String className = res.getString(2);
				//构造方法组装成一个Classes对象cla
				classesMap.put(classId,className);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			ConnectionManager.closeResultSet(res);//5.关闭结果集 对象、语句总管、连接
			ConnectionManager.closeStatement(pStatement);
			ConnectionManager.closeConnection(con);
		}
		return classesMap;
	}
	public List<Classes> getAllClasses(){
    	List<Classes> allClasses=new ArrayList<Classes>();
    	Connection con=null;
    	PreparedStatement pStatement=null;
    	ResultSet res=null;
    	try {
			con = ConnectionManager.getConnection();//1.创建连接
			String sql = "select * from classes";
			pStatement = con.prepareStatement(sql);//2.创建预处理语句总管
			res = pStatement.executeQuery();//3.语句总管执行查询
			while (res.next()) {
				int classId = res.getInt(1);
				String className = res.getString(2);
				//构造方法组装成一个Classes对象cla
				Classes cla = new Classes(classId,className);
				allClasses.add(cla);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
		    ConnectionManager.closeResultSet(res);//5.关闭结果集 对象、语句总管、连接
		    ConnectionManager.closeStatement(pStatement);
		    ConnectionManager.closeConnection(con); 		
		}
    	return allClasses;	
    }
	public static void main(String[] args) {
		ClassesDB cdb=new ClassesDB();
		List<Classes> all=cdb.getAllClasses();
		for(int i=0;i<all.size();i++){
		     Classes cla=(Classes)all.get(i);
		     System.out.println(cla);
		}
	}
}

