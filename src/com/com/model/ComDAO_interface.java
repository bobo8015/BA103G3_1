package com.com.model;

import java.util.List;


public interface ComDAO_interface {
	public void insert(ComVO comVO);
	public void update(ComVO comVO);
	public ComVO findByPrimaryKey(String com_no);
	public List<ComVO> getAll();
}
