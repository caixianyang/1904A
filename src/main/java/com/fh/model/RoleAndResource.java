package com.fh.model;

import com.baomidou.mybatisplus.annotation.TableName;

@TableName("cxy_RoleAndResource")
public class RoleAndResource {

    private Integer id;//
    private Integer roleId;//
    private Integer resourceId;//

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getRoleId() {
        return roleId;
    }

    public void setRoleId(Integer roleId) {
        this.roleId = roleId;
    }

    public Integer getResourceId() {
        return resourceId;
    }

    public void setResourceId(Integer resourceId) {
        this.resourceId = resourceId;
    }
}
