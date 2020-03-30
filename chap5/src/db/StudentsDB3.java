package com.db;
import java.sql.*;
public class StudentsDB3 {
	public static void main(String[] args) {
		 Connection con = null;
		 PreparedStatement pStatement = null;
		 try {
		      con = ConnectionManager.getConnection();  //1.��������
		      String strSql = "delete from students where studentName=?";  
			  
		      pStatement = con.prepareStatement(strSql);  //2.����Ԥ��������ܹ�
		      pStatement.setString(1, "Ǭ¡");
		      int row=pStatement.executeUpdate();  //3.����ܹ�ִ��SQL���
		      System.out.println("�ɹ�ɾ��"+row+"�����ݣ�");   
		 } catch (SQLException sqlE) {
		       sqlE.printStackTrace();
		    } finally {
		       ConnectionManager.closeStatement(pStatement);//4.�ر�����ܹܡ�����
		       ConnectionManager.closeConnection(con);
		    }
	}
}
