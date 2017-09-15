package com.ordit.model;

import java.util.List;

public class OrditService {

	private OrditDAO_interface dao;

	public OrditService() {
		dao = new OrditDAO();
	}

	public OrditVO addOrdit(String ord_no, String dish_no,Integer ordit_qua,
			Integer ordit_pri) {

		OrditVO orditVO = new OrditVO();

		orditVO.setOrd_no(ord_no);
		orditVO.setDish_no(dish_no);
		orditVO.setOrdit_qua(ordit_qua);
		orditVO.setOrdit_pri(ordit_pri);
		dao.insert(orditVO);

		return orditVO;
	}

	public OrditVO updateOrdit(String ord_no, String dish_no, Integer ordit_qua,
			Integer ordit_pri) {

		OrditVO orditVO = new OrditVO();
		orditVO.setOrd_no(ord_no);
		orditVO.setDish_no(dish_no);
		orditVO.setOrdit_qua(ordit_qua);
		orditVO.setOrdit_pri(ordit_pri);
		dao.update(orditVO);

		return orditVO;
	
	}

	public void deleteOrdit(String ord_no, String dish_no) {
		dao.delete(ord_no,dish_no);
	}

	public OrditVO getOneOrdit(String ord_no, String dish_no) {
		return dao.findByPrimaryKey(ord_no,dish_no);
	}

	public List<OrditVO> getAll() {
		return dao.getAll();
	}
	
}
