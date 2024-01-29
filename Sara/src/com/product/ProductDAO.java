package com.product;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;


public class ProductDAO {

	private Connection conn = null;

	public ProductDAO(Connection conn) {
		this.conn = conn;
	}

	public int getMaxNum() {

		int maxNum = 0;

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;

		try {
			sql = "select nvl(max(productNum),0) from Product";
			pstmt = conn.prepareStatement(sql);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				maxNum = rs.getInt(1);
			}

			rs.close();
			pstmt.close();

		} catch (Exception e) {
			System.out.println(e.toString());
		}

		return maxNum;

	}

	public int insertData(ProductDTO dto) {

		int result = 0;

		PreparedStatement pstmt = null;
		String sql;

		try {
			sql = "insert into Product (productNum, productName, productSubject, saveFileName, originalFileName, ";
			sql += "category, price, quantity) ";
			sql += "values (?,?,?,?,?,?,?,?)";

			pstmt = conn.prepareStatement(sql);

			pstmt.setInt(1, dto.getProductNum());
			pstmt.setString(2, dto.getProductName());
			pstmt.setString(3, dto.getProductSubject());
			pstmt.setString(4, dto.getSaveFileName());
			pstmt.setString(5, dto.getOriginalFileName());
			pstmt.setString(6, dto.getCategory());
			pstmt.setInt(7, dto.getPrice());
			pstmt.setInt(8, dto.getQuantity());

			
			result = pstmt.executeUpdate();

			pstmt.close();

		} catch (Exception e) {
			System.out.println(e.toString());
		}

		return result;

	}
	
	public List<ProductDTO> getList(int start, int end, String category) {
		
		List<ProductDTO> lists = new ArrayList<ProductDTO>();
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;
		
		try {
			
			sql = "select * from (";
			sql += "select rownum rnum, data.* from (";
			sql += "select productNum, productName, productSubject, saveFileName, originalFileName, ";
			sql += "category, price, quantity from Product where category = ? order by productNum desc";
			sql += ") data) where rnum >= ? and rnum <= ?";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, category);
			pstmt.setInt(2, start);
			pstmt.setInt(3, end);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				
				ProductDTO dto = new ProductDTO();
				
				dto.setProductNum(rs.getInt("productNum"));
				dto.setProductName(rs.getString("productName"));
				dto.setProductSubject(rs.getString("productSubject"));
				dto.setSaveFileName(rs.getString("saveFileName"));
				dto.setOriginalFileName(rs.getString("originalFileName"));
				
				dto.setCategory(rs.getString("category"));
				dto.setPrice(rs.getInt("price"));
				dto.setQuantity(rs.getInt("quantity"));
				
				lists.add(dto);
			}
			pstmt.close();
			rs.close();
			
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		return lists;
	}
	
	public int getDataCount(String category) {

		int dataCount = 0;

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;

		try {
			sql = "select nvl(count(*),0) from Product";
			pstmt = conn.prepareStatement(sql);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				dataCount = rs.getInt(1);
			}

			rs.close();
			pstmt.close();

		} catch (Exception e) {
			System.out.println(e.toString());
		}

		return dataCount;

	}
	
		//                  
		public ProductDTO getReadData(int productNum) {
		
		ProductDTO dto = null;
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;
		
		try {
			
			sql = "select productNum, productName, productSubject, saveFileName, originalFileName, ";
			sql += "category, price, quantity from Product where productNum = ?";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, productNum);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				
				dto = new ProductDTO();
				
				dto.setProductNum(rs.getInt("productNum"));
				dto.setProductName(rs.getString("productName"));
				dto.setProductSubject(rs.getString("productSubject"));
				dto.setSaveFileName(rs.getString("saveFileName"));
				dto.setOriginalFileName(rs.getString("originalFileName"));
				
				dto.setCategory(rs.getString("category"));
				dto.setPrice(rs.getInt("price"));
				dto.setQuantity(rs.getInt("quantity"));
			}
			pstmt.close();
			rs.close();
			
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return dto;
	}
	
		// DB          
	
	public int deleteData(int productNum) {
		
		int result = 0;
		
		PreparedStatement pstmt = null;
		String sql;
		
		try {
			
			sql = "delete from Product where productNum = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, productNum);
			result = pstmt.executeUpdate();
			pstmt.close();
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}
	
	public int updateHitCount(int productNum) {

		int result = 0;

		PreparedStatement pstmt = null;

		String sql;

		try {

			sql= "update product set hitCount=NVL(hitCount, 0)+1 where productNum=?";

			pstmt = conn.prepareStatement(sql);

			pstmt.setInt(1, productNum);

			result = pstmt.executeUpdate();

			pstmt.close();

		} catch (Exception e) {
			System.out.println(e.toString());
		}

		return result;
	}
	
	
	public int searchGetDataCount(String searchKey, String searchValue) {

		int dataCount = 0;

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;

		try {

			searchValue = "%" + searchValue + "%";

			sql = "select nvl(count(*),0) from product ";
			sql+="where " + searchKey + " like ?";

			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1,searchValue);

			rs = pstmt.executeQuery();

			if(rs.next()) {				
				dataCount = rs.getInt(1);
			}


			rs.close();
			pstmt.close();


		} catch (Exception e) {
			System.out.println(e.toString());
		}



		return dataCount;





	}

	//전체데이터
	public List<ProductDTO> serchGetLists(int start,int end, String searchKey, String searchValue){

		List<ProductDTO> lists = new ArrayList<ProductDTO>();

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;

		try {

			searchValue = "%" + searchValue + "%";

			sql="select * from (";
			sql+="select rownum rnum,data.* from (";
			sql+="select productNum, productName, productSubject, saveFileName, originalFileName,";
			sql+="category, price, quantity,hitcount from product where " + searchKey + " like ? ";
			sql+="order by productNum desc) data)";
			sql+="where rnum>=? and rnum<=?";

			pstmt = conn.prepareStatement(sql);


			pstmt.setString(1, searchValue);
			pstmt.setInt(2, start);
			pstmt.setInt(3, end);



			rs = pstmt.executeQuery();

			while(rs.next()) {

				ProductDTO dto = new ProductDTO();

				dto.setProductNum(rs.getInt("productNum"));
				dto.setProductName(rs.getString("productName"));
				dto.setProductSubject(rs.getString("productSubject"));
				dto.setSaveFileName(rs.getString("saveFileName"));
				dto.setOriginalFileName(rs.getString("originalFileName"));

				dto.setCategory(rs.getString("category"));
				dto.setPrice(rs.getInt("price"));
				dto.setQuantity(rs.getInt("quantity"));
				dto.setHitCount(rs.getInt("hitcount"));

				lists.add(dto);


			}

			rs.close();
			pstmt.close();



		} catch (Exception e) {
			System.out.println(e.toString());
		}


		return lists;

	}
	
	public List<ProductDTO> highGetLists(int start,int end, String searchKey, String searchValue){

		List<ProductDTO> lists = new ArrayList<ProductDTO>();

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;

		try {

			searchValue = "%" + searchValue + "%";

			sql="select * from (";
			sql+="select rownum rnum,data.* from (";
			sql+="select productNum, productName, productSubject, saveFileName, originalFileName,";
			sql+="category, price, quantity,hitcount from product where " + searchKey + " like ? ";
			sql+="order by price desc) data)";
			sql+="where rnum>=? and rnum<=?";

			pstmt = conn.prepareStatement(sql);


			pstmt.setString(1, searchValue);
			pstmt.setInt(2, start);
			pstmt.setInt(3, end);



			rs = pstmt.executeQuery();

			while(rs.next()) {

				ProductDTO dto = new ProductDTO();

				dto.setProductNum(rs.getInt("productNum"));
				dto.setProductName(rs.getString("productName"));
				dto.setProductSubject(rs.getString("productSubject"));
				dto.setSaveFileName(rs.getString("saveFileName"));
				dto.setOriginalFileName(rs.getString("originalFileName"));

				dto.setCategory(rs.getString("category"));
				dto.setPrice(rs.getInt("price"));
				dto.setQuantity(rs.getInt("quantity"));
				dto.setHitCount(rs.getInt("hitcount"));

				lists.add(dto);


			}

			rs.close();
			pstmt.close();



		} catch (Exception e) {
			System.out.println(e.toString());
		}


		return lists;

	}
	
	public List<ProductDTO> lowGetLists(int start,int end, String searchKey, String searchValue){

		List<ProductDTO> lists = new ArrayList<ProductDTO>();

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;

		try {

			searchValue = "%" + searchValue + "%";

			sql="select * from (";
			sql+="select rownum rnum,data.* from (";
			sql+="select productNum, productName, productSubject, saveFileName, originalFileName,";
			sql+="category, price, quantity,hitcount from product where " + searchKey + " like ? ";
			sql+="order by price asc) data)";
			sql+="where rnum>=? and rnum<=?";

			pstmt = conn.prepareStatement(sql);


			pstmt.setString(1, searchValue);
			pstmt.setInt(2, start);
			pstmt.setInt(3, end);



			rs = pstmt.executeQuery();

			while(rs.next()) {

				ProductDTO dto = new ProductDTO();

				dto.setProductNum(rs.getInt("productNum"));
				dto.setProductName(rs.getString("productName"));
				dto.setProductSubject(rs.getString("productSubject"));
				dto.setSaveFileName(rs.getString("saveFileName"));
				dto.setOriginalFileName(rs.getString("originalFileName"));

				dto.setCategory(rs.getString("category"));
				dto.setPrice(rs.getInt("price"));
				dto.setQuantity(rs.getInt("quantity"));
				dto.setHitCount(rs.getInt("hitcount"));

				lists.add(dto);


			}

			rs.close();
			pstmt.close();



		} catch (Exception e) {
			System.out.println(e.toString());
		}


		return lists;

	}
	
	public List<ProductDTO> hitGetLists(int start,int end, String searchKey, String searchValue){

		List<ProductDTO> lists = new ArrayList<ProductDTO>();

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;

		try {

			searchValue = "%" + searchValue + "%";

			sql="select * from (";
			sql+="select rownum rnum,data.* from (";
			sql+="select productNum, productName, productSubject, saveFileName, originalFileName,";
			sql+="category, price, quantity,hitcount from product where " + searchKey + " like ? ";
			sql+="order by hitcount desc) data)";
			sql+="where rnum>=? and rnum<=?";

			pstmt = conn.prepareStatement(sql);


			pstmt.setString(1, searchValue);
			pstmt.setInt(2, start);
			pstmt.setInt(3, end);



			rs = pstmt.executeQuery();

			while(rs.next()) {

				ProductDTO dto = new ProductDTO();

				dto.setProductNum(rs.getInt("productNum"));
				dto.setProductName(rs.getString("productName"));
				dto.setProductSubject(rs.getString("productSubject"));
				dto.setSaveFileName(rs.getString("saveFileName"));
				dto.setOriginalFileName(rs.getString("originalFileName"));

				dto.setCategory(rs.getString("category"));
				dto.setPrice(rs.getInt("price"));
				dto.setQuantity(rs.getInt("quantity"));
				dto.setHitCount(rs.getInt("hitcount"));

				lists.add(dto);


			}

			rs.close();
			pstmt.close();



		} catch (Exception e) {
			System.out.println(e.toString());
		}


		return lists;

	}
}
