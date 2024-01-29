package com.basket;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.user.SignUpDTO;

public class BasketDAO {



	private Connection conn;

	public BasketDAO(Connection conn) {

		this.conn= conn;
	}


	public int basketGetMaxNum() {

		int maxNum = 0;

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;

		try {

			sql = "select nvl(max(num),0) from basket";

			pstmt = conn.prepareStatement(sql);

			rs = pstmt.executeQuery();

			if(rs.next()) {

				maxNum = rs.getInt(1);

			}

			rs.close();
			pstmt.close();


		} catch (Exception e) {
			System.out.println(e.toString());
		}

		return maxNum;
	}

	public int basketGetDataCount(String userId) {

		int dataCount = 0;

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;

		try {

			sql = "select nvl(count(*),0) from basket where userid=?";

			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1,userId);

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



	public int basketInsertData(BasketDTO dto) {


		int result = 0;


		PreparedStatement pstmt = null;
		String sql;

		try {



			sql = "insert into basket (userId,userName,productName,price,productNum,num,saveFileName,quantity,created) ";
			sql+= "values (?,?,?,?,?,?,?,?,sysdate)";




			pstmt = conn.prepareStatement(sql); //        Ϻ       ˻   


			pstmt.setString(1, dto.getUserId());
			pstmt.setString(2, dto.getUserName());
			pstmt.setString(3, dto.getProductName());
			pstmt.setInt(4, dto.getPrice());
			pstmt.setInt(5, dto.getProductNum());
			pstmt.setInt(6, dto.getNum());
			pstmt.setString(7, dto.getSaveFileName());
			
			pstmt.setInt(8, dto.getQuantity());
			

			result = pstmt.executeUpdate();

			pstmt.close();




		} catch (Exception e) {
			System.out.println(e.toString());
		}


		return result;

	}

	public List<BasketDTO> basketGetList(int start,int end ,String userId){


		List<BasketDTO> lists = new ArrayList<BasketDTO>();


		PreparedStatement pstmt = null;

		ResultSet rs = null;

		String sql;

		try {


			sql ="select * from (";
			sql+="select rownum rnum, data.* from(";
			sql+="select num,userId,userName,productName,productNum,price,saveFileName,quantity,created from basket where userid=? order by num desc) data) ";
			sql+="where rnum>=? and rnum<=?";

			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, userId);
			pstmt.setInt(2, start);
			pstmt.setInt(3, end);

			rs = pstmt.executeQuery();


			while(rs.next()) {

				BasketDTO dto = new BasketDTO();

				dto.setRnum(rs.getInt("rnum"));
				dto.setNum(rs.getInt("num"));
				dto.setUserId(rs.getString("userId"));
				dto.setUserName(rs.getString("userName"));
				dto.setProductName(rs.getString("productName"));
				dto.setProductNum(rs.getInt("productNum"));			
				dto.setPrice(rs.getInt("price"));
				dto.setSaveFileName(rs.getString("saveFileName"));
				dto.setQuantity(rs.getInt("quantity"));
				dto.setCreated(rs.getString("created"));


				lists.add(dto);			

			}

			pstmt.close();
			rs.close();



		} catch (Exception e) {
			System.out.println(e.toString());
		}

		return lists;
	}

	public int basketDeleteData(int num) {

		int result = 0;

		PreparedStatement pstmt = null;

		String sql;

		try {

			sql = "delete basket where num=?";

			pstmt = conn.prepareStatement(sql);

			pstmt.setInt(1, num);

			result = pstmt.executeUpdate();

			pstmt.close();


		} catch (Exception e) {
			System.out.println(e.toString());
		}

		return result;

	}


}
