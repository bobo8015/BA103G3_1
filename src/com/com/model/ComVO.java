package com.com.model;



public class ComVO implements java.io.Serializable{
	public String getCom_no() {
		return com_no;
	}
	public void setCom_no(String com_no) {
		this.com_no = com_no;
	}
	public String getMem_no() {
		return mem_no;
	}
	public void setMem_no(String mem_no) {
		this.mem_no = mem_no;
	}
	public String getStr_no() {
		return str_no;
	}
	public void setStr_no(String str_no) {
		this.str_no = str_no;
	}
	public String getCom_txt() {
		return com_txt;
	}
	public void setCom_txt(String com_txt) {
		this.com_txt = com_txt;
	}
	private String com_no;
	private String mem_no;
	private String str_no;
	private String com_txt;		
	
}
