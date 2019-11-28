package com.fh.ProductSearchParm;

import com.fh.model.Page;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

public class ProductSearchParm extends Page {
    private String name;//
    private String productName;
    private Integer brandId;
    private Double minPrice;
    private Double maxPrice;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date maxTime;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date minTime;
    private String motion;//
    private Integer status;//

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public Integer getBrandId() {
        return brandId;
    }

    public void setBrandId(Integer brandId) {
        this.brandId = brandId;
    }

    public Double getMinPrice() {
        return minPrice;
    }

    public void setMinPrice(Double minPrice) {
        this.minPrice = minPrice;
    }

    public Double getMaxPrice() {
        return maxPrice;
    }

    public void setMaxPrice(Double maxPrice) {
        this.maxPrice = maxPrice;
    }

    public Date getMaxTime() {
        return maxTime;
    }

    public void setMaxTime(Date maxTime) {
        this.maxTime = maxTime;
    }

    public Date getMinTime() {
        return minTime;
    }

    public void setMinTime(Date minTime) {
        this.minTime = minTime;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getMotion() {
        return motion;
    }

    public void setMotion(String motion) {
        this.motion = motion;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }
}
