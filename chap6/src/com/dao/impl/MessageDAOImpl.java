package com.dao.impl;

import com.dao.IMessageDAO;
import com.dbc.ConnectionManager;
import com.vo.Message;
import org.junit.Test;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class MessageDAOImpl implements IMessageDAO {
    @Override
    @Test
    public String getMessageWriterByID(int messageId){
        String writer = null;
        Connection conn = ConnectionManager.getConnection();
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        String sql = "select writer from message where messageID=?";
        try {
            preparedStatement = conn.prepareStatement(sql);
            preparedStatement.setInt(1, messageId);
            resultSet = preparedStatement.executeQuery();

            if (resultSet.next()) {
                writer = resultSet.getString(1);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        } finally {
            ConnectionManager.closeResultSet(resultSet);
            ConnectionManager.closeStatement(preparedStatement);
            ConnectionManager.closeConnection(conn);
        }
        return writer;
    }

    public List<Message> getAllMessage(){
        List<Message> allMessage = new ArrayList<Message>();
        Connection con=null;
        PreparedStatement pStatement=null;
        ResultSet res=null;
        try {
            con = ConnectionManager.getConnection();//1.创建连接
            String sql = "select * from  message order by writeDate";
            pStatement = con.prepareStatement(sql);//2.创建预处理语句总管
            res = pStatement.executeQuery();//3.语句总管执行查询
            while (res.next()) {
                int messageId = res.getInt(1);
                String title = res.getString(2);
                String content = res.getString(3);
                String write = res.getString(4);
                Timestamp writeDate =  res.getTimestamp(5);
                int count = res.getInt(6);
                //构造方法组装成一个Students对象stu
                Message mes=new Message(messageId,title,content,write,writeDate,count);
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

    public boolean addMessage(Message message){
        Connection conn = ConnectionManager.getConnection();
        PreparedStatement preparedStatement = null;
        String sql = "insert into message(title, content, writer, writeDate, count) VALUES (?,?,?,?,?)";

        try {
            preparedStatement = conn.prepareStatement(sql);
            preparedStatement.setString(1, message.getTitle());
            preparedStatement.setString(2, message.getContent());
            preparedStatement.setString(3, message.getWriter());
            preparedStatement.setTimestamp(4, message.getWriteDate());
            preparedStatement.setInt(5, message.getCount());
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

    @Override
    public boolean deleteMessage(int messageId) {
        Connection conn = ConnectionManager.getConnection();
        PreparedStatement preparedStatement = null;
        String sql1 = "delete from revert where messageID=?";
        String sql2 = "delete from message where messageID=?";

        try {
            preparedStatement = conn.prepareStatement(sql1);
            preparedStatement.setInt(1, messageId);
            preparedStatement.executeUpdate();

            preparedStatement = conn.prepareStatement(sql2);
            preparedStatement.setInt(1, messageId);
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
    public static void main(String[] args){
        MessageDAOImpl messageDAO = new MessageDAOImpl();
        if(messageDAO.deleteMessage(2)){
            System.out.println(1);
        }
        else{
            System.out.println(2);
        }
    }
}
