package com.fh.model;

import com.baomidou.mybatisplus.annotation.TableField;

public class Resource {

    private Integer id;//

    private String name;//

    private Integer Pid;//

    private String url;//

    private Integer type;//

    @TableField(exist = false)
    private Boolean checked =false;

    public Integer getType() {
        return type;
    }

    public void setType(Integer type) {
        this.type = type;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Integer getPid() {
        return Pid;
    }

    public void setPid(Integer pid) {
        Pid = pid;
    }

    public Boolean getChecked() {
        return checked;
    }

    public void setChecked(Boolean checked) {
        this.checked = checked;
    }

    @Override
    public String toString() {
        return "Resource{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", Pid=" + Pid +
                ", url='" + url + '\'' +
                ", type=" + type +
                ", checked=" + checked +
                '}';
    }
}
