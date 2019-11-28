package com.fh.model;

public class Prop {

    private Integer id;

    private String name;//道具名称

    private String propImgUrl;//道具图片

    private Double propPrice;//道具价格

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

    public String getPropImgUrl() {
        return propImgUrl;
    }

    public void setPropImgUrl(String propImgUrl) {
        this.propImgUrl = propImgUrl;
    }

    public Double getPropPrice() {
        return propPrice;
    }

    public void setPropPrice(Double propPrice) {
        this.propPrice = propPrice;
    }
}
