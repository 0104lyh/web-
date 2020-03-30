package com.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class StudentsDB4 {

	public static void main(String[] args) {
		 Connection con = null;
		 PreparedStatement pStatement = null;
		 try {
		      con = ConnectionManager.getConnection();  //1.��������
		      String strSql = "update students set studentName=? where studentId=?";  
		      pStatement = con.prepareStatement(strSql);  //2.����Ԥ��������ܹ�
		      pStatement.setString(1, "����");
		      pStatement.setString(2, "2013880123");
		      int row=pStatement.executeUpdate();  //3.����ܹ�ִ��SQL���
		      System.out.println("�ɹ��޸�"+row+"�����ݣ�");   
		 } catch (SQLException sqlE) {
		       sqlE.printStackTrace();
		    } finally {
		       ConnectionManager.closeStatement(pStatement);//4.�ر�����ܹܡ�����
		       ConnectionManager.closeConnection(con);
		    }
	}		

}
