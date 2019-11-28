package com.fh.model;

import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

public class Log {

    private Integer id;

    private String userName;

    private String paramContent;// 操作内容

    private int status;//状态  0:成功  1：失败

    private String info;//参数

    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date createTime;//创建时间

    private String motion;//动作




    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public String getParamContent() {
        return paramContent;
    }

    public void setParamContent(String paramContent) {
        this.paramContent = paramContent;
    }

    public String getInfo() {
        return info;
    }

    public void setInfo(String info) {
        this.info = info;
    }

    public String getMotion() {
        return motion;
    }

    public void setMotion(String motion) {
        this.motion = motion;
    }
}
