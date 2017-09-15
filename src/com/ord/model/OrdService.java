package com.ord.model;

import java.sql.Timestamp;
import java.util.List;

public class OrdService {

	private OrdDAO_interface dao;

	public OrdService() {
		dao = new OrdDAO();
	}

	public OrdVO addOrd( String mem_no, String str_no,
			Integer ord_ev, String ord_type, Double ord_pri, 
			Timestamp ord_date) {

		OrdVO ordVO = new OrdVO();

		ordVO.setMem_no(mem_no);
		ordVO.setStr_no(str_no);
		ordVO.setOrd_ev(ord_ev);
		ordVO.setOrd_type(ord_type);
		ordVO.setOrd_pri(ord_pri);
		ordVO.setOrd_date(ord_date);
		dao.insert(ordVO);

		return ordVO;
	}

	public OrdVO updateOrd(Integer ord_ev, String ord_eva, String ord_no) {

		OrdVO ordVO = new OrdVO();
		ordVO.setOrd_ev(ord_ev);
		ordVO.setOrd_eva(ord_eva);
		ordVO.setOrd_no(ord_no);
		dao.update(ordVO);

		return ordVO;
	}

	public void deleteOrd(String ord_no) {
		dao.delete(ord_no);
	}

	public OrdVO getOneOrd(String ord_no) {
		return dao.findByPrimaryKey(ord_no);
	}

	public List<OrdVO> getAll() {
		return dao.getAll();
	}
	
}
