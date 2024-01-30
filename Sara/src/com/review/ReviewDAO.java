package com.review;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;


public class ReviewDAO {
	
	
	private Connection conn;

	public ReviewDAO(Connection conn) {

		this.conn= conn;
	}

	
	
	
	public int reviewGetDataCount(int productNum) {

		int dataCount = 0;

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;

		try {

			sql = "select nvl(count(*),0) from review where productNum=?";

			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1,productNum);

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
	
	

	public int reviewInsertData(ReviewDTO dto) {


		int result = 0;


		PreparedStatement pstmt = null;
		String sql;

		try {
		
			
            
			sql = "insert into review (userId,userName,content,created,rev,productNum) ";
			sql+= "values (?,?,?,sysdate,?,?)";
 			
 			
			
 			
			pstmt = conn.prepareStatement(sql); //        Ϻ       ˻   

			
			pstmt.setString(1, dto.getUserId());
			pstmt.setString(2, dto.getUserName());
			pstmt.setString(3, dto.getContent());
			pstmt.setInt(4, dto.getRev());
			pstmt.setInt(5, dto.getProductNum());
			
			
			result = pstmt.executeUpdate();

			pstmt.close();




		} catch (Exception e) {
			System.out.println(e.toString());
		}


		return result;

	}
	
	public List<ReviewDTO> reviewGetList(int start,int end ,int productNum){


		List<ReviewDTO> lists = new ArrayList<ReviewDTO>();


		PreparedStatement pstmt = null;

		ResultSet rs = null;

		String sql;

		try {


			sql ="select * from (";
			sql+="select rownum rnum, data.* from(";
			sql+="select userid,username,content,created,rev,productNum from review where productNum=? order by created desc) data) ";
			sql+="where rnum>=? and rnum<=?";

			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, productNum);
			pstmt.setInt(2, start);
			pstmt.setInt(3, end);

			rs = pstmt.executeQuery();


			while(rs.next()) {

				ReviewDTO dto = new ReviewDTO();
				
				dto.setUserId(rs.getString("userId"));
				dto.setUserName(rs.getString("userName"));
				dto.setContent(rs.getString("content"));
				dto.setCreated(rs.getString("created"));			
				dto.setRev(rs.getInt("rev"));
				dto.setProductNum(rs.getInt("productNum"));
				

				lists.add(dto);			

			}

			pstmt.close();
			rs.close();



		} catch (Exception e) {
			System.out.println(e.toString());
		}

		return lists;
	}
	
	public int revAverage(int productNum) {

		int average = 0;
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;

		try {
			sql = "SELECT NVL(ROUND(AVG(rev)),0) AS rev FROM review WHERE productnum = ?";
			pstmt = conn.prepareStatement(sql);

			pstmt.setInt(1,productNum);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				average = rs.getInt(1);
			}

			rs.close();
			pstmt.close();

		} catch (Exception e) {
			System.out.println(e.toString());
		}

		return average;

	}
	
	
	



}
