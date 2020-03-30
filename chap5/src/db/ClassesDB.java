package com.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.junit.Test;

import com.vo.Classes;

public class ClassesDB {
	@Test
	public List<Classes> getAllClasses(){
    	List<Classes> allClasses=new ArrayList<Classes>();
    	Connection con=null;
    	PreparedStatement pStatement=null;
    	ResultSet res=null;
    	try {
			con = ConnectionManager.getConnection();//1.��������
			String sql = "select * from classes";
			pStatement = con.prepareStatement(sql);//2.����Ԥ��������ܹ�
			res = pStatement.executeQuery();//3.����ܹ�ִ�в�ѯ
			while (res.next()) {
				int classId = res.getInt(1);
				String className = res.getString(2);
				//���췽����װ��һ��Classes����cla
				Classes cla = new Classes(classId,className);
				allClasses.add(cla);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
		    ConnectionManager.closeResultSet(res);//5.�رս���� ��������ܹܡ�����
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

