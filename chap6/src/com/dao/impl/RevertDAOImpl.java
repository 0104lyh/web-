package com.dao.impl;

import com.dao.IRevertDAO;
import com.dbc.ConnectionManager;
import com.vo.Revert;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;


public class RevertDAOImpl implements IRevertDAO {

    @Override
    public List<Revert> getRevertByMessageID(int messageId) {
        List<Revert> Reverts = new ArrayList<Revert>();
        String writer = null;
        Connection conn = ConnectionManager.getConnection();
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        String sql = "select * from revert where messageID=? order by writeDate desc";
        try {
            preparedStatement = conn.prepareStatement(sql);
            preparedStatement.setInt(1, messageId);
            resultSet = preparedStatement.executeQuery();
            while(resultSet.next()){
                int revertId = resultSet.getInt(1);
                int mesId = resultSet.getInt(2);
                String content = resultSet.getString(3);
                String write = resultSet.getString(4);
                Timestamp writeDate =  resultSet.getTimestamp(5);
                Revert revert = new Revert(revertId,mesId,content,writer,writeDate);
                Reverts.add(revert);

            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        } finally {
            ConnectionManager.closeResultSet(resultSet);
            ConnectionManager.closeStatement(preparedStatement);
            ConnectionManager.closeConnection(conn);
        }
        return Reverts;
    }


    public List<Revert> getAllRevert(){
        List<Revert> allMessage = new ArrayList<Revert>();
        Connection con=null;
        PreparedStatement pStatement=null;
        ResultSet res=null;
        try {
            con = ConnectionManager.getConnection();//1.创建连接
            String sql = "select * from  revert order by writeDate";
            pStatement = con.prepareStatement(sql);//2.创建预处理语句总管
            res = pStatement.executeQuery();//3.语句总管执行查询
            while (res.next()) {
                int revertId = res.getInt(1);
                int messageId = res.getInt(2);
                String content = res.getString(3);
                String write = res.getString(4);
                Timestamp writeDate =  res.getTimestamp(5);
                //int count = res.getInt(6);
                //构造方法组装成一个Students对象stu
                Revert mes=new Revert(revertId,messageId,content,write,writeDate);
                allMessage.add(mes);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }finally{
            ConnectionManager.closeResultSet(res);//5.关闭结果集 对象、语句总管、连接
            ConnectionManager.closeStatement(pStatement);
            ConnectionManager.closeConnection(con);
        }
        return allMessage;
    }
    @Override
    public boolean addRevert(Revert revert){
        Connection conn = ConnectionManager.getConnection();
        PreparedStatement preparedStatement = null;
        String sql = "insert into revert(messageID, content, writer, writeDate) VALUES (?,?,?,?)";

        try {
            preparedStatement = conn.prepareStatement(sql);
            preparedStatement.setInt(1, revert.getMessageID());
            preparedStatement.setString(2, revert.getContent());
            preparedStatement.setString(3, revert.getWriter());
            preparedStatement.setTimestamp(4, revert.getWriteDate());
            if (preparedStatement.executeUpdate() > 0) {
                return true;
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        } finally {
            ConnectionManager.closeStatement(preparedStatement);
            ConnectionManager.closeConnection(conn);
        }
        return false;
    }
}
