package com.offcn.entity;

import java.sql.Date;

public class Idle {

	// Fields

	private Integer idleid;
	private String idlename;
	private String idleImg;
	private Integer amount;
	private String location;
	private Date purchasing_date;
	private Double purchasing_price;
	private Integer transfer_mode;
	private Integer transfer_state;
	private Integer percentage;

	private String date;
	private Integer[] ways;
	
	private Idletype idletype;
	private User user;
	
	private String typename;
	
	// Constructors

	/** default constructor */
	public Idle() {
	}


	// Property accessors
	public Integer getIdleid() {
		return idleid;
	}

	public void setIdleid(Integer idleid) {
		this.idleid = idleid;
	}

	public Idletype getIdletype() {
		return this.idletype;
	}

	public void setIdletype(Idletype idletype) {
		this.idletype = idletype;
	}

	public User getUser() {
		return this.user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public String getIdlename() {
		return this.idlename;
	}

	public void setIdlename(String idlename) {
		this.idlename = idlename;
	}

	public String getIdleImg() {
		return this.idleImg;
	}

	public void setIdleImg(String idleImg) {
		this.idleImg = idleImg;
	}

	public Integer getAmount() {
		return this.amount;
	}

	public void setAmount(Integer amount) {
		this.amount = amount;
	}

	public String getLocation() {
		return this.location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public Integer getPercentage() {
		return this.percentage;
	}

	public void setPercentage(Integer percentage) {
		this.percentage = percentage;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public Integer[] getWays() {
		return ways;
	}

	public void setWays(Integer[] ways) {
		this.ways = ways;
	}


	public Date getPurchasing_date() {
		return purchasing_date;
	}


	public void setPurchasing_date(Date purchasing_date) {
		this.purchasing_date = purchasing_date;
	}


	public Double getPurchasing_price() {
		return purchasing_price;
	}


	public void setPurchasing_price(Double purchasing_price) {
		this.purchasing_price = purchasing_price;
	}


	public Integer getTransfer_mode() {
		return transfer_mode;
	}


	public void setTransfer_mode(Integer transfer_mode) {
		this.transfer_mode = transfer_mode;
	}


	public Integer getTransfer_state() {
		return transfer_state;
	}


	public void setTransfer_state(Integer transfer_state) {
		this.transfer_state = transfer_state;
	}


	public String getTypename() {
		return typename;
	}


	public void setTypename(String typename) {
		this.typename = typename;
	}
	
}