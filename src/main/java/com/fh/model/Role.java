package com.fh.model;

import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

public class Role{

    /** 唯一标识*/
    private Integer id;
    /** 角色名*/
    private String roleName;
    /** 角色描述*/
    private String remark;
    /** 录入时间*/
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date insertDate;
    /** 更新时间*/
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date updateDate;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getRoleName() {
        return roleName;
    }

    public void setRoleName(String roleName) {
        this.roleName = roleName;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    public Date getInsertDate() {
        return insertDate;
    }

    public void setInsertDate(Date insertDate) {
        this.insertDate = insertDate;
    }

    public Date getUpdateDate() {
        return updateDate;
    }

    public void setUpdateDate(Date updateDate) {
        this.updateDate = updateDate;
    }
}
