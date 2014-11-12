package org.han.vo;


import java.sql.Date;

import org.springframework.stereotype.Service;

@Service
public class BbsVO {
	
	private String bno; 
	private String title; 
	private String userid; 
	private String cont; 
	private Date regdate; 
	private Integer vcount; 
	private Integer rcount; 
	private String contfile;
	private Integer cnt;
	private Integer rn;
	
	public String getBno() {
		return bno;
	}
	public void setBno(String bno) {
		this.bno = bno;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getCont() {
		return cont;
	}
	public void setCont(String cont) {
		this.cont = cont;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	public Integer getVcount() {
		return vcount;
	}
	public void setVcount(Integer vcount) {
		this.vcount = vcount;
	}
	public Integer getRcount() {
		return rcount;
	}
	public void setRcount(Integer rcount) {
		this.rcount = rcount;
	}
	public String getContfile() {
		return contfile;
	}
	public void setContfile(String contfile) {
		this.contfile = contfile;
	}
	public Integer getCnt() {
		return cnt;
	}
	public void setCnt(Integer cnt) {
		this.cnt = cnt;
	}
	public Integer getRn() {
		return rn;
	}
	public void setRn(Integer rn) {
		this.rn = rn;
	}
	@Override
	public String toString() {
		return "BbsVO [bno=" + bno + ", title=" + title + ", userid=" + userid
				+ ", cont=" + cont + ", regdate=" + regdate + ", vcount="
				+ vcount + ", rcount=" + rcount + ", contfile=" + contfile
				+ ", cnt=" + cnt + ", rn=" + rn + "]";
	}
	

}
