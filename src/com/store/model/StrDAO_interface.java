package com.store.model;

import java.util.List;

public interface StrDAO_interface {
	
	public void insert(StrVO strVO);
	public void update(StrVO strVO);
	public void updateInfo(StrVO strVO);
	public void updateInfo_Img(StrVO strVO);
	public void updatePas(String str_no, String str_pas);
	public void updateStatus(String str_no, String str_stat);
	public StrVO findByPrimaryKey(String str_no);
	public List<StrVO> getAll();
	public List<StrVO> findByArea(String area);
	public List<StrVO> findByStoca(String stoca_no);
	

}
