package com.user;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.util.DBConn;

public class SignUpDAO {


	private Connection conn;

	public SignUpDAO(Connection conn) {

		this.conn= conn;
	}

	public int insertData(SignUpDTO dto) {

		int result = 0;

		PreparedStatement pstmt = null;
		String sql;

		try {

			sql = "insert into signup (userId,userPwd,userName,tel1,tel2, tel3, mobile1, mobile2, mobile3, ";
			sql += "sample4_postcode, sample4_roadAddress, sample4_jibunAddress, sample4_detailAddress, sample4_extraAddress, ";
			sql += "email, gender, birth, bank, act) ";
			sql += "values (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";

			pstmt = conn.prepareStatement(sql); //문법이 완벽한지 검사함

			pstmt.setString(1, dto.getUserId());
			pstmt.setString(2, dto.getUserPwd());
			pstmt.setString(3, dto.getUserName());
			
			pstmt.setString(4, dto.getTel1());
			pstmt.setString(5, dto.getTel2());
			pstmt.setString(6, dto.getTel3());
			pstmt.setString(7, dto.getMobile1());
			pstmt.setString(8, dto.getMobile2());
			pstmt.setString(9, dto.getMobile3());
			
			pstmt.setString(10, dto.getSample4_postcode());
			pstmt.setString(11, dto.getSample4_roadAddress());
			pstmt.setString(12, dto.getSample4_jibunAddress());
			pstmt.setString(13, dto.getSample4_detailAddress());
			pstmt.setString(14, dto.getSample4_extraAddress());
			
			pstmt.setString(15, dto.getEmail());
			pstmt.setString(16, dto.getGender());
			pstmt.setString(17, dto.getBirth());
			pstmt.setString(18, dto.getBank());
			pstmt.setString(19, dto.getAct());

			result = pstmt.executeUpdate();

			pstmt.close();

		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	public SignUpDTO getReadData(String userId) {

		SignUpDTO dto = null;
		PreparedStatement pstmt = null;
		ResultSet rs =null;
		String sql;

		try {


			sql ="select userId,userPwd,userName,tel1,tel2,tel3,mobile1,mobile2,mobile3, ";
			sql += "sample4_postcode, sample4_roadAddress, sample4_jibunAddress, sample4_detailAddress, sample4_extraAddress, ";
			sql += "email,gender,birth,bank,act ";
			sql+="from signup where userId = ?";

			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, userId);

			rs = pstmt.executeQuery();
			if(rs.next()) {

				dto = new SignUpDTO();

				dto.setUserId(rs.getString("userId"));
				dto.setUserPwd(rs.getString("userPwd"));
				dto.setUserName(rs.getString("userName"));
				
				dto.setTel1(rs.getString("tel1"));
				dto.setTel2(rs.getString("tel2"));
				dto.setTel3(rs.getString("tel3"));
				dto.setMobile1(rs.getString("mobile1"));
				dto.setMobile2(rs.getString("mobile2"));
				dto.setMobile3(rs.getString("mobile3"));
				
				dto.setSample4_postcode(rs.getString("sample4_postcode"));
				dto.setSample4_roadAddress(rs.getString("sample4_roadAddress"));
				dto.setSample4_jibunAddress(rs.getString("sample4_jibunAddress"));
				dto.setSample4_detailAddress(rs.getString("sample4_detailAddress"));
				dto.setSample4_extraAddress(rs.getString("sample4_extraAddress"));
				
				dto.setEmail(rs.getString("email"));
				dto.setGender(rs.getString("gender"));
				dto.setBirth(rs.getString("birth"));
				dto.setBank(rs.getString("bank"));
				dto.setAct(rs.getString("act"));
			}
			rs.close();
			pstmt.close();
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return dto;
	}

	// 로그인
	public SignUpDTO login(String userId, String userPwd) {
		SignUpDTO dto = null;
	    PreparedStatement pstmt = null;
	    ResultSet rs = null;

	    try {
	        String sql = "SELECT * FROM signup WHERE userId=? AND userPwd=?";
	        pstmt = conn.prepareStatement(sql);
	        pstmt.setString(1, userId);
	        pstmt.setString(2, userPwd);

	        rs = pstmt.executeQuery();

	        if (rs.next()) {
	            dto = new SignUpDTO();
	            dto.setUserId(rs.getString("userId"));
	            dto.setUserPwd(rs.getString("userPwd"));
	            dto.setUserName(rs.getString("userName"));
//	            dto.setBirth(rs.getString("userBirth"));
//	            dto.setTel1(rs.getString("tel1"));
//	            dto.setTel2(rs.getString("tel2"));
//	            dto.setTel3(rs.getString("tel3"));
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return dto;
	}
	
	
	// 세션에 로그인한 유저의 정보
	 public static SignUpDTO getDTOByUserId(String userId) {
	        Connection conn = null;
	        PreparedStatement pstmt = null;
	        ResultSet rs = null;
	        SignUpDTO dto = null;

	        try {
	            conn = DBConn.getConnection();
	            String sql = "SELECT * FROM signup WHERE userId=?";
	            pstmt = conn.prepareStatement(sql);
	            pstmt.setString(1, userId);
	            rs = pstmt.executeQuery();

	            if (rs.next()) {
	                dto = new SignUpDTO();
	               
	                dto.setUserId(rs.getString("userId"));
					dto.setUserPwd(rs.getString("userPwd"));
					dto.setUserName(rs.getString("userName"));
					
					dto.setTel1(rs.getString("tel1"));
					dto.setTel2(rs.getString("tel2"));
					dto.setTel3(rs.getString("tel3"));
					dto.setMobile1(rs.getString("mobile1"));
					dto.setMobile2(rs.getString("mobile2"));
					dto.setMobile3(rs.getString("mobile3"));
					
					dto.setSample4_postcode(rs.getString("sample4_postcode"));
					dto.setSample4_roadAddress(rs.getString("sample4_roadAddress"));
					dto.setSample4_jibunAddress(rs.getString("sample4_jibunAddress"));
					dto.setSample4_detailAddress(rs.getString("sample4_detailAddress"));
					dto.setSample4_extraAddress(rs.getString("sample4_extraAddress"));
					
					dto.setEmail(rs.getString("email"));
					dto.setGender(rs.getString("gender"));
					dto.setBirth(rs.getString("birth"));
					dto.setBank(rs.getString("bank"));
					dto.setAct(rs.getString("act"));

	            }
	        } catch (Exception e) {
	            System.out.println(e.toString());
	        }

	        return dto;
	    }
	 
	public int updateData(SignUpDTO dto) {

		int result = 0;

		PreparedStatement pstmt = null;
		String sql;

		try {

			sql = "update signup set userpwd=?,username=?,userbirth=?,usertel=? ";
			sql+= "where userid=?";

			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, dto.getUserPwd());
	

			result = pstmt.executeUpdate();

			pstmt.close();


		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}
	
	
	// 비밀번호 찾기
	public SignUpDTO forgot(String userId, String userEmail) {
		SignUpDTO dto = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			String sql = "SELECT * FROM signup WHERE userId=? AND email=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			pstmt.setString(2, userEmail);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				dto = new SignUpDTO();
				dto.setUserId(rs.getString("userId"));
				dto.setUserPwd(rs.getString("userPwd"));
				dto.setUserName(rs.getString("userName"));
				dto.setBirth(rs.getString("userBirth"));
				dto.setTel1(rs.getString("tel1"));
				dto.setTel2(rs.getString("tel2"));
				dto.setTel3(rs.getString("tel3"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return dto;
	}

	
	// 삭제
		public int deleteData(String userId) {
			
			int result = 0;
			PreparedStatement pstmt = null;
			String sql;
			
			try {
				
				sql  = "delete from signup where userId= ?";
				
				pstmt = conn.prepareStatement(sql);
				pstmt.setNString(1, userId);
				result = pstmt.executeUpdate();
				
				pstmt.close();
			} catch (Exception e) {
				System.out.println(e.toString());
			}
			return result;
			
		}

}