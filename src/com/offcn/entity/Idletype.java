package com.offcn.entity;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

/**
 * Idletype entity. @author MyEclipse Persistence Tools
 */

public class Idletype{

	// Fields

	private Integer tid;
	private String typename;
	private String enumerate;
	private Timestamp creationDate;
	
	private List<Idle> idles = new ArrayList<Idle>();

	// Constructors

	/** default constructor */
	public Idletype() {
	}

	/** minimal constructor */
	public Idletype(Timestamp creationDate) {
		this.creationDate = creationDate;
	}

	/** full constructor */
	public Idletype(String typename, String enumerate, Timestamp creationDate,
			List<Idle> idles) {
		super();
		this.typename = typename;
		this.enumerate = enumerate;
		this.creationDate = creationDate;
		this.idles = idles;
	}

	// Property accessors

	public Integer getTid() {
		return this.tid;
	}


	public void setTid(Integer tid) {
		this.tid = tid;
	}

	public String getTypename() {
		return this.typename;
	}

	public void setTypename(String typename) {
		this.typename = typename;
	}

	public String getEnumerate() {
		return this.enumerate;
	}

	public void setEnumerate(String enumerate) {
		this.enumerate = enumerate;
	}

	public Timestamp getCreationDate() {
		return this.creationDate;
	}

	public void setCreationDate(Timestamp creationDate) {
		this.creationDate = creationDate;
	}

	public List<Idle> getIdles() {
		return idles;
	}

	public void setIdles(List<Idle> idles) {
		this.idles = idles;
	}

}