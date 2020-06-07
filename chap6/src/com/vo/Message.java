package com.vo;
import java.util.*;
import java.sql.*;
public class Message {
    private int messageID;
    private String title;
    private String content;
    private String writer;
    private Timestamp writeDate;
    private Integer count;

    public int getMessageID() {
        return messageID;
    }

    public void setMessageID(int messageID) {
        this.messageID = messageID;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getWriter() {
        return writer;
    }

    public void setWriter(String writer) {
        this.writer = writer;
    }

    public Timestamp getWriteDate() {
        return writeDate;
    }

    public void setWriteDate(Timestamp writeDate) {
        this.writeDate = writeDate;
    }

    public Integer getCount() {
        return count;
    }

    public void setCount(Integer count) {
        this.count = count;
    }

    public Message(int messageID, String title, String content, String writer, Timestamp writeDate, Integer count) {
        this.messageID = messageID;
        this.title = title;
        this.content = content;
        this.writer = writer;
        this.writeDate = writeDate;
        this.count = count;
    }

    @Override
    public String toString() {
        return "Message{" +
                "messageID=" + messageID +
                ", title='" + title + '\'' +
                ", content='" + content + '\'' +
                ", writer='" + writer + '\'' +
                ", writeDate=" + writeDate +
                ", count=" + count +
                '}';
    }
}
