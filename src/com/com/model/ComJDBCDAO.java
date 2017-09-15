package com.com.model;

import java.io.BufferedReader;
import java.io.IOException;
import java.sql.Clob;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;




public class ComJDBCDAO implements ComDAO_interface{

	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:XE";
	String userid = "easyfood";
	String passwd = "easyfood";
	
	private static final String INSERT_STMT =
		"INSERT INTO COMMUNICATION (COM_NO,MEM_NO,STR_NO,COM_TXT) "
		+ "VALUES ('COM_'||LPAD(TO_CHAR(COM_SQ.NEXTVAL),4,'0'),?,?,?)";
	
	private static final String GET_ALL_STMT =
		"SELECT COM_NO,MEM_NO,STR_NO,COM_TXT FROM COMMUNICATION order by COM_NO";
	
	private static final String GET_ONE_STMT =
		"SELECT COM_NO,MEM_NO,STR_NO,COM_TXT FROM COMMUNICATION where COM_NO = ?";
	
	private static final String UPDATE =
			"UPDATE COMMUNICATION set COM_TXT=? where COM_NO = ?";
		
	
	

	@Override
	public void insert(ComVO comVO) {
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(INSERT_STMT);
			
						
			pstmt.setString(1,comVO.getMem_no());
			pstmt.setString(2,comVO.getStr_no());			
			pstmt.setString(3, comVO.getCom_txt());
			
			pstmt.executeUpdate();
			
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		 catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (Exception e) {
					e.printStackTrace(System.err);
				}
			}
		}
		
	}

	@Override
	public void update(ComVO comVO) {
		
		Connection con = null;
		PreparedStatement pstmt = null;
				
		
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(UPDATE);
					
			pstmt.setString(1,comVO.getCom_txt());
			
			java.sql.Clob clob =con.createClob();
			String str = comVO.getCom_txt();
			clob.setString(1, str); // position
			pstmt.setClob(1, clob);
			
			pstmt.setString(2, comVO.getCom_no());
			
			pstmt.executeUpdate();
			
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}		
		 catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (Exception e) {
					e.printStackTrace(System.err);
				}
			}
		}
	}


	@Override
	public ComVO findByPrimaryKey(String com_no) {
		
		ComVO comVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(GET_ONE_STMT);
			
			pstmt.setString(1,com_no);

			rs = pstmt.executeQuery();
			
			while(rs.next()){
				comVO = new ComVO();
				comVO.setCom_no(rs.getString("com_no"));
				comVO.setMem_no(rs.getString("mem_no"));
				comVO.setStr_no(rs.getString("str_no"));
				comVO.setCom_txt(readString(rs.getClob("com_txt")));
				
					
				 
			}
			
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
		finally {
			
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (Exception e) {
					e.printStackTrace(System.err);
				}
			}
		
		}
		return comVO;
	}

	@Override
	public List<ComVO> getAll() {
		List<ComVO> list = new ArrayList<ComVO>();
		ComVO comVO = null;
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(GET_ALL_STMT);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				// empVO 也稱為 Domain objects
				comVO = new ComVO();
				comVO.setCom_no(rs.getString("com_no"));
				comVO.setMem_no(rs.getString("mem_no"));
				comVO.setStr_no(rs.getString("str_no"));
				comVO.setCom_txt(readString(rs.getClob("com_txt")));
				list.add(comVO); // Store the row in the list
			}

			// Handle any driver errors
		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. "
					+ e.getMessage());
			// Handle any SQL errors
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. "
					+ se.getMessage());
			// Clean up JDBC resources
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (Exception e) {
					e.printStackTrace(System.err);
				}
			}
		}
		
		
		
		return list;
	}
	
	public static String readString(Clob clob) throws IOException, SQLException {
		StringBuilder sb = new StringBuilder();
		BufferedReader br = new BufferedReader(clob.getCharacterStream());
		String str;
		while((str = br.readLine()) != null) {
			sb.append(str);
		}
		br.close();

		return sb.toString();
	}

	
	
	public static void main(String[] args) {
		
		ComJDBCDAO dao = new ComJDBCDAO();
//		
//		ComVO comVO1 = new ComVO();
//		comVO1.setMem_no("MEM_0004");
//		comVO1.setStr_no("STR_0001");
//		comVO1.setCom_txt("你實在很笨5632");
//		dao.insert(comVO1);
		
//		ComVO comVO2 = new ComVO();
//		comVO2.setCom_no("COM_0002");
//		comVO2.setCom_txt("妳才是笨蛋");
//		dao.update(comVO1);
		
		ComVO comVO3 = dao.findByPrimaryKey("COM_0004");
		System.out.print(comVO3.getCom_no() + ",");
		System.out.print(comVO3.getMem_no() + ",");
		System.out.print(comVO3.getStr_no() + ",");
		System.out.print(comVO3.getCom_txt() + ",");
		System.out.println("---------------------");
		
		
		List<ComVO> list = dao.getAll();
		for (ComVO aCom : list) {
			System.out.print(aCom.getCom_no() + ",");
			System.out.print(aCom.getMem_no() + ",");
			System.out.print(aCom.getStr_no() + ",");
			System.out.print(aCom.getCom_txt() + ",");
			System.out.println("---------------------");
		}
		
		
	}
	
	
	
}
