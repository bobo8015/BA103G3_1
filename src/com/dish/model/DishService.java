package com.dish.model;

import java.util.List;

public class DishService {
	
	private DishDAO_interface dao;
	
	public DishService() {
		dao = new DishDAO();
	}
	
	public DishVO addDish(String dish_name, Double dish_price, String dcla_no, String str_no, String dish_status, 
			byte[] dish_img, String dish_note) {
		DishVO dishVO = new DishVO();
		dishVO.setDish_name(dish_name);
		dishVO.setDish_price(dish_price);
		dishVO.setDcla_no(dcla_no);
		dishVO.setStr_no(str_no);
		dishVO.setDish_status(dish_status);
		dishVO.setDish_img(dish_img);
		dishVO.setDish_note(dish_note);
		dao.insert(dishVO);
		return dishVO;
	}
	
	public DishVO update(String dish_no, String dish_name, Double dish_price, String dish_status, byte[] dish_img, String dish_note) {
		DishVO dishVO = new DishVO();
		dishVO.setDish_no(dish_note);
		dishVO.setDish_name(dish_name);
		dishVO.setDish_price(dish_price);
		dishVO.setDish_status(dish_status);
		dishVO.setDish_img(dish_img);
		dishVO.setDish_note(dish_note);
		dao.update(dishVO);
		return dishVO;
		
	}
	
	public DishVO getOneDish(String dish_no) {
		return dao.findByDishNo(dish_no);
	}
	
	public List<DishVO> getDclaDish(String dcla_no) {
		return dao.findByDishClass(dcla_no);
	}
	
	public List<DishVO> getStoreDish(String str_no) {
		return dao.findByStore(str_no);
	}
	
	public List<DishVO> getPriceLevelDish(Double minPrice, Double maxPrice) {
		return dao.findByPrice(minPrice, maxPrice);
	}
	
	public List<DishVO> getAreaDish(String area) {
		return dao.findByArea(area);
	}
	
	public List<DishVO> getAll() {
		return dao.getALL();
	}
	
	
}
