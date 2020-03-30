package com.db;
import java.sql.*;

public class StudentsDB5 {

	public static void main(String[] args) {
		 Connection con = null;
		 PreparedStatement pStatement = null;
		 ResultSet resSet=null;
		 try {
		      con = ConnectionManager.getConnection();  //1.��������
		      String strSql = "select * from students where studentName=?";  
		      pStatement = con.prepareStatement(strSql);  //2.����Ԥ��������ܹ�
		      pStatement.setString(1, "л�Ƿ�");
		      resSet=pStatement.executeQuery();  //3.����ܹ�ִ��SQL���
		      if(resSet.next()){
		    	 System.out.println("ѧ��Ϊ��"+resSet.getString(1)); 
		    	 System.out.println("����Ϊ��"+resSet.getString(2)); 
		    	 System.out.println("����Ϊ��"+resSet.getString(3)); 
		    	 System.out.println("�Ա�Ϊ��"+resSet.getString(4)); 
		    	 System.out.println("�༶��Ϊ��"+resSet.getInt(5)); 	    	 
		      }   
		 } catch (SQLException sqlE) {
		       sqlE.printStackTrace();
		    } finally {
		       ConnectionManager.closeStatement(pStatement);//4.�ر�����ܹܡ�����
		       ConnectionManager.closeConnection(con);
		    }
	}		
}
