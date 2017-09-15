package com.ordit.model;

import java.util.List;



public interface OrditDAO_interface {

	public void insert(OrditVO orditVO);

	public void update(OrditVO orditVO);

	public void delete(String ord_no, String dish_no);

	public OrditVO findByPrimaryKey(String ord_no, String dish_no);

	public List<OrditVO> getAll();
	
}
