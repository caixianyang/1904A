package com.fh.util;

import java.util.ArrayList;
import java.util.List;

public class Fenye<E>{
	private int dqy=1;
	private int myts=3;
	private long zys;
	private long zts;
	private int ksxb;
	private List<E> list=new ArrayList<E>();
	public Fenye() {
		// TODO Auto-generated constructor stub
	}

	public int getDqy() {
		return dqy;
	}

	public void setDqy(int dqy) {
		this.dqy = dqy;
	}

	public int getMyts() {
		return myts;
	}

	public void setMyts(int myts) {
		this.myts = myts;
	}

	public long getZys() {
		return zys;
	}

	public void setZys(long zys) {
		this.zys = zys;
	}

	public long getZts() {
		return zts;
	}

	public void setZts(long zts) {
		this.zts = zts;
		this.zys=this.zts%this.myts==0?this.zts/this.myts:this.zts/this.myts+1;
	}

	public int getKsxb() {
		return ksxb;
	}

	public void setKsxb(int ksxb) {
		this.ksxb = ksxb;
	}

	public Fenye(int dqy, int myts, long zys, long zts, int ksxb) {
		super();
		this.dqy = dqy;
		this.myts = myts;
		this.zys = zys;
		this.zts = zts;
		this.ksxb = ksxb;
	}

	public Fenye(int dqy, int myts) {
		super();
		this.dqy = dqy;
		this.myts = myts;
		this.ksxb = (dqy-1)*myts;
	}

	public List<E> getList() {
		return list;
	}

	public void setList(List<E> list) {
		this.list = list;
	}
	
}
