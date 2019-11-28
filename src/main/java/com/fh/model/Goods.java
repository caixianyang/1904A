package com.fh.model;


import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

public class Goods extends PageEntity {
	private Integer id;
	private String name;
	private Double price;
	private Long subTotalCount;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date time;
	private Brand brand;
	private  String filePath;//
	private String brandName;//
	private Integer status;//
	private Integer graed;//
	private Integer graedTime;//

	private String category;//
	private Integer category1;//
	private Integer category2;//
	private Integer category3;//


	private Integer brand_id;//

	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Double getPrice() {
		return price;
	}

	public void setPrice(Double price) {
		this.price = price;
	}

	public Date getTime() {
		return time;
	}

	public void setTime(Date time) {
		this.time = time;
	}

	public Brand getBrand() {
		return brand;
	}

	public void setBrand(Brand brand) {
		this.brand = brand;
	}

	public Integer getBrand_id() {
		return brand_id;
	}

	public void setBrand_id(Integer brand_id) {
		this.brand_id = brand_id;
	}

	public String getFilePath() {
		return filePath;
	}

	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public Integer getCategory1() {
		return category1;
	}

	public void setCategory1(Integer category1) {
		this.category1 = category1;
	}

	public Integer getCategory2() {
		return category2;
	}

	public void setCategory2(Integer category2) {
		this.category2 = category2;
	}

	public Integer getCategory3() {
		return category3;
	}

	public void setCategory3(Integer category3) {
		this.category3 = category3;
	}

	public String getBrandName() {
		return brandName;
	}

	public void setBrandName(String brandName) {
		this.brandName = brandName;
	}

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	public Long getSubTotalCount() {
		return subTotalCount;
	}

	public void setSubTotalCount(Long subTotalCount) {
		this.subTotalCount = subTotalCount;
	}

	public Integer getGraed() {
		return graed;
	}

	public void setGraed(Integer graed) {
		this.graed = graed;
	}

	public Integer getGraedTime() {
		return graedTime;
	}

	public void setGraedTime(Integer graedTime) {
		this.graedTime = graedTime;
	}
}
