package com.db;
import java.sql.*;
public class StudentsDB2 {

	public static void main(String[] args) {
        Connection con = null;
	    PreparedStatement pStatement = null;
	    try {
	      con = ConnectionManager.getConnection();  //1.��������
	      String strSql = "insert into students values(?,?,?,?,?)";  
	      pStatement = con.prepareStatement(strSql);  //2.����Ԥ��������ܹ�
	      pStatement.setString(1, "2008110106");
	      pStatement.setString(2, "Ǭ¡");
	      pStatement.setString(3, "2008");
	      pStatement.setString(4, "��");
	      pStatement.setInt(5, 10201541);
	      pStatement.executeUpdate();  //3.����ܹ�ִ��SQL���
	    } catch (SQLException sqlE) {
	       sqlE.printStackTrace();
	    } finally {
	       ConnectionManager.closeStatement(pStatement);//4.�ر�����ܹܡ�����
	       ConnectionManager.closeConnection(con);
	    }
	}

}
