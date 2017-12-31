package com.offcn.entity;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

public class User {

	// Fields
	private Integer uid;
	private String userName;
	private String phone;
	private String password;
	private Timestamp birthday;
	private String headphoto;
	private String account;

	private Integer[] dateArr;
	private String dateStr;
	
	private List<Idle> idles = new ArrayList<Idle>();
	// Constructors

	/** default constructor */
	public User() {
	}

	// Property accessors

	public Integer getUid() {
		return this.uid;
	}

	public void setUid(Integer uid) {
		this.uid = uid;
	}

	public String getUserName() {
		return this.userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getPhone() {
		return this.phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getPassword() {
		return this.password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public Timestamp getBirthday() {
		return this.birthday;
	}

	public void setBirthday(Timestamp birthday) {
		this.birthday = birthday;
	}

	public String getHeadphoto() {
		return this.headphoto;
	}

	public void setHeadphoto(String headphoto) {
		this.headphoto = headphoto;
	}

	public String getAccount() {
		return this.account;
	}

	public void setAccount(String account) {
		this.account = account;
	}
	
	public Integer[] getDateArr() {
		return dateArr;
	}

	public void setDateArr(Integer[] dateArr) {
		this.dateArr = dateArr;
	}

	public String getDateStr() {
		return dateStr;
	}

	public void setDateStr(String dateStr) {
		this.dateStr = dateStr;
	}
	
	public List<Idle> getIdles() {
		return idles;
	}

	public void setIdles(List<Idle> idles) {
		this.idles = idles;
	}

	@Override
	public String toString() {
		return "User [uid=" + uid + ", userName=" + userName + ", phone="
				+ phone + ", password=" + password + ", birthday=" + birthday
				+ ", headphoto=" + headphoto + ", account=" + account + "]";
	}
	
}