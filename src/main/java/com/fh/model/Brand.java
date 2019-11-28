package com.fh.model;

import java.util.Date;

public class Brand {
    private Integer id;
    private String name;
    private Date time;
    private Integer graed;//

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

    public Date getTime() {
        return time;
    }

    public void setTime(Date time) {
        this.time = time;
    }

    public Integer getGraed() {
        return graed;
    }

    public void setGraed(Integer graed) {
        this.graed = graed;
    }
}
