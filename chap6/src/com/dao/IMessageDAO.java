package com.dao;

import com.vo.Message;

import java.util.List;

public interface IMessageDAO {
    public String getMessageWriterByID(int messageId);
    public List<Message> getAllMessage();
    public boolean addMessage(Message message);
    public boolean deleteMessage(int messageId);
}
