package com.fh.model;

import java.util.ArrayList;
import java.util.List;

public class PageEntity<T> {
      private Integer pageNum = 1; //当前页
      private Integer pageSize  =3;//每页展示几条
      private long  totalCount ;//总条数
      private long totalPage; //总页数 
      private int start;//起始下标
      private  List<T> list = new ArrayList<T>();
      
      
	public PageEntity(Integer pageNum, Integer pageSize) {
		super();
		if(pageNum !=null && pageNum !=0){
			this.pageNum = pageNum;
		}
		if(pageSize != null && pageSize !=0){
			this.pageSize= pageSize;
			
		}
		this.start  = (this.pageNum -1 )*this.pageSize;
	}
	public PageEntity() {
		super();
		// TODO Auto-generated constructor stub
	}
	public int getPageNum() {
		return pageNum;
	}
	public void setPageNum(int pageNum) {
		this.pageNum = pageNum;
	}
	public int getPageSize() {
		return pageSize;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	public long getTotalCount() {
		return totalCount;
	}
	public void setTotalCount(long totalCount) {
		this.totalCount = totalCount;
		this.totalPage = totalCount%pageSize==0?totalCount/pageSize:totalCount/pageSize+1;
	}
	public long getTotalPage() {
		return totalPage;
	}
	public void setTotalPage(long totalPage) {
		this.totalPage = totalPage;
	}
	public int getStart() {
		return start;
	}
	public void setStart(int start) {
		this.start = start;
	}
	public List<T> getList() {
		return list;
	}
	public void setList(List<T> list) {
		this.list = list;
	}
      
	

}
