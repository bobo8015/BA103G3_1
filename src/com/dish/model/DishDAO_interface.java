package com.dish.model;

import java.util.List;

public interface DishDAO_interface {
	
	public void insert(DishVO dishVO);
	public void update(DishVO dishVO);
	public DishVO findByDishNo(String dish_no);
	public List<DishVO> findByDishClass(String dcla_no);
	public List<DishVO> findByStore(String str_no);
	public List<DishVO> findByPrice(Double minPrice, Double maxPrice);
	public List<DishVO> findByArea(String area);
	public List<DishVO> getALL();
	public List<DishVO> getDishClassForStr(String str_no);
	

} 
