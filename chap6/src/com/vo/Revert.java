package com.vo;
import java.util.*;
import java.sql.*;
public class Revert {
    private int revertID;
    private int messageID;
    private String content;
    private String writer;
    private Timestamp writeDate;

    public int getRevertID() {
        return revertID;
    }

    public void setRevertID(int revertID) {
        this.revertID = revertID;
    }

    public int getMessageID() {
        return messageID;
    }

    public void setMessageID(int messageID) {
        this.messageID = messageID;
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

    public Revert(int revertID, int messageID, String content, String writer, Timestamp writeDate) {
        this.revertID = revertID;
        this.messageID = messageID;
        this.content = content;
        this.writer = writer;
        this.writeDate = writeDate;
    }

    @Override
    public String toString() {
        return new StringJoiner(", ", Revert.class.getSimpleName() + "[", "]")
                .add("revertID=" + revertID)
                .add("messageID=" + messageID)
                .add("content='" + content + "'")
                .add("writer='" + writer + "'")
                .add("writeDate=" + writeDate)
                .toString();
    }
}
