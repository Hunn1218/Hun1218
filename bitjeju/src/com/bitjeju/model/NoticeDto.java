package com.bitjeju.model;

import java.sql.Date;

public class NoticeDto {

	int ntnum,num;
	String title,name,content;
	Date wtime;
	
	public NoticeDto(){
		
	}
	
	public NoticeDto(int ntnum, int num, String title, String name,
			String content, Date wtime) {
		super();
		this.ntnum = ntnum;
		this.num = num;
		this.title = title;
		this.name = name;
		this.content = content;
		this.wtime = wtime;
	}

	
	public NoticeDto(int int1, String string, String string2, int int2,
			Date date, String string3) {
		// TODO Auto-generated constructor stub
	}
	@Override
	public String toString() {
		return "NoticeDto [ntnum=" + ntnum + ", num=" + num + ", title="
				+ title + ", name=" + name + ", content=" + content
				+ ", wtime=" + wtime + "]";
	}
	
	public int getNtnum() {
		return ntnum;
	}
	public void setNtnum(int ntnum) {
		this.ntnum = ntnum;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getWtime() {
		return wtime;
	}
	public void setWtime(Date wtime) {
		this.wtime = wtime;
	}
	
	
}
