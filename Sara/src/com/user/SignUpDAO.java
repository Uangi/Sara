package com.user;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.util.DBConn;

public class SignUpDAO {

	private Connection conn;

	public SignUpDAO(Connection conn) {

		this.conn = conn;
	}

	// 회원가입
	public int insertData(SignUpDTO dto) {

		int result = 0;

		PreparedStatement pstmt = null;
		String sql;

		try {

			sql = "insert into signup (userId,userPwd,userName,tel1,tel2, tel3, mobile1, mobile2, mobile3, ";
			sql += "sample4_postcode, sample4_roadAddress, sample4_jibunAddress, sample4_detailAddress, sample4_extraAddress, ";
			sql += "email, gender, birth, bank, act) ";
			sql += "values (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";

			pstmt = conn.prepareStatement(sql); // 문법이 완벽한지 검사함

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

	// 데이터 읽기
	public SignUpDTO getReadData(String userId) {

		SignUpDTO dto = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;

		try {

			sql = "select userId,userPwd,userName,tel1,tel2,tel3,mobile1,mobile2,mobile3, ";
			sql += "sample4_postcode, sample4_roadAddress, sample4_jibunAddress, sample4_detailAddress, sample4_extraAddress, ";
			sql += "email,gender,birth,bank,act ";
			sql += "from signup where userId = ?";

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

	// 회원정보 수정
	public int updateData(SignUpDTO dto) {

		int result = 0;

		PreparedStatement pstmt = null;
		String sql;

		try {

			sql = "update signup set userpwd=?,username=?,userbirth=?,usertel=? ";
			sql += "where userid=?";

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

	// 회원 탈퇴
	public int deleteData(String userId) {

		int result = 0;
		PreparedStatement pstmt = null;
		String sql;

		try {
			sql = "delete from signup where userId= ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setNString(1, userId);
			result = pstmt.executeUpdate();

			pstmt.close();
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

//		@@@@@@@@@@@@@@@

	public SignUpDTO productGetData(String pcode) {

		SignUpDTO dto = null;

		PreparedStatement pstmt = null;

		ResultSet rs = null;

		String sql;

		try {

			sql = "select num,subject,saveFileName,originalFileName,price,pcode,sor from imagetest ";
			sql += "where pcode=?";

			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, pcode);

			rs = pstmt.executeQuery();

			if (rs.next()) {

				dto = new SignUpDTO();

				dto.setNum(rs.getInt("num"));
				dto.setSubject(rs.getString("subject"));
				dto.setSaveFileName(rs.getString("saveFileName"));
				dto.setOriginalFileName(rs.getString("originalFileName"));
				dto.setPrice(rs.getInt("price"));
				dto.setPcode(rs.getString("pcode"));
				dto.setSor(rs.getString("sor"));

			}

			pstmt.close();
			rs.close();

		} catch (Exception e) {
			System.out.println(e.toString());
		}

		return dto;
	}

	public int reviewGetMaxNum() {

		int maxNum = 0;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;

		try {

			sql = "select nvl(max(num),0) from review";
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

	//////
	public int reviewGetDataCount(String pcode) {

		int dataCount = 0;

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;

		try {
			sql = "select nvl(count(*),0) from review where pcode=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, pcode);
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

	public int reviewInsertData(SignUpDTO dto) {

		int result = 0;
		PreparedStatement pstmt = null;
		String sql;
		try {

			sql = "insert into review (userId,userName,content,created,rev,pcode,num) ";
			sql += "values (?,?,?,sysdate,?,?,?)";

			pstmt = conn.prepareStatement(sql); // 문법이 완벽한지 검사함

			pstmt.setString(1, dto.getUserId());
			pstmt.setString(2, dto.getUserName());
			pstmt.setString(3, dto.getContent());
			pstmt.setInt(4, dto.getRev());
			pstmt.setString(5, dto.getPcode());
			pstmt.setInt(6, dto.getNum());

			result = pstmt.executeUpdate();

			pstmt.close();

		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	////////
	public List<SignUpDTO> reviewGetList(int start, int end, String pcode) {

		List<SignUpDTO> lists = new ArrayList<SignUpDTO>();

		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql;

		try {

			sql = "select * from (";
			sql += "select rownum rnum, data.* from(";
			sql += "select num,userid,username,content,created,rev,pcode from review where pcode=? order by num desc) data) ";
			sql += "where rnum>=? and rnum<=?";

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, pcode);
			pstmt.setInt(2, start);
			pstmt.setInt(3, end);

			rs = pstmt.executeQuery();

			while (rs.next()) {

				SignUpDTO dto = new SignUpDTO();

				dto.setNum(rs.getInt("num"));
				dto.setUserId(rs.getString("userId"));
				dto.setUserName(rs.getString("userName"));
				dto.setContent(rs.getString("content"));
				dto.setCreated(rs.getString("created"));
				dto.setRev(rs.getInt("rev"));
				dto.setPcode(rs.getString("pcode"));

				lists.add(dto);
			}

			pstmt.close();
			rs.close();

		} catch (Exception e) {
			System.out.println(e.toString());
		}

		return lists;
	}

	////////////
	public SignUpDTO reviewGetReadData(String userId) {

		SignUpDTO dto = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;

		try {

			sql = "select userId,userName,content,created,rev,pcode ";
			sql += "from review where userId=?";

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			rs = pstmt.executeQuery();

			if (rs.next()) {

				dto = new SignUpDTO();

				dto.setUserId(rs.getString("userId"));
				dto.setUserName(rs.getString("userName"));
				dto.setUserName(rs.getString("content"));
				dto.setUserName(rs.getString("createde"));
				dto.setUserName(rs.getString("rev"));
			}

			rs.close();
			pstmt.close();

		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return dto;
	}

	// 장바구니@@@@@@@@@@@@@@@@@@@@
	public int basketGetMaxNum() {

		int maxNum = 0;

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;

		try {

			sql = "select nvl(max(num),0) from basket";

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

	public int basketGetDataCount(String userId) {

		int dataCount = 0;

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;

		try {

			sql = "select nvl(count(*),0) from basket where userid=?";

			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, userId);

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

	public int basketInsertData(SignUpDTO dto) {

		int result = 0;

		PreparedStatement pstmt = null;
		String sql;

		try {

			sql = "insert into basket (userId,userName,subject,price,pcode,num,saveFileName,created) ";
			sql += "values (?,?,?,?,?,?,?,sysdate)";

			pstmt = conn.prepareStatement(sql); // 문법이 완벽한지 검사함

			pstmt.setString(1, dto.getUserId());
			pstmt.setString(2, dto.getUserName());
			pstmt.setString(3, dto.getSubject());
			pstmt.setInt(4, dto.getPrice());
			pstmt.setString(5, dto.getPcode());
			pstmt.setInt(6, dto.getNum());
			pstmt.setString(7, dto.getSaveFileName());

			result = pstmt.executeUpdate();

			pstmt.close();

		} catch (Exception e) {
			System.out.println(e.toString());
		}

		return result;

	}

	public List<SignUpDTO> basketGetList(int start, int end, String userId) {

		List<SignUpDTO> lists = new ArrayList<SignUpDTO>();

		PreparedStatement pstmt = null;

		ResultSet rs = null;

		String sql;

		try {

			sql = "select * from (";
			sql += "select rownum rnum, data.* from(";
			sql += "select num,userId,userName,subject,pcode,price,saveFileName,created from basket where userid=? order by num desc) data) ";
			sql += "where rnum>=? and rnum<=?";

			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, userId);
			pstmt.setInt(2, start);
			pstmt.setInt(3, end);

			rs = pstmt.executeQuery();

			while (rs.next()) {

				SignUpDTO dto = new SignUpDTO();

				dto.setNum(rs.getInt("rnum"));
				dto.setUserId(rs.getString("userId"));
				dto.setUserName(rs.getString("userName"));
				dto.setSubject(rs.getString("subject"));
				dto.setPcode(rs.getString("pcode"));
				dto.setPrice(rs.getInt("price"));
				dto.setSaveFileName(rs.getString("saveFileName"));
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

	public SignUpDTO basketGetReadData(String userId) {

		SignUpDTO dto = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;

		try {

			sql = "select userId,userName,content,created,rev,pcode ";
			sql += "from review where userId=?";

			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, userId);

			rs = pstmt.executeQuery();

			if (rs.next()) {

				dto = new SignUpDTO();

				dto.setUserId(rs.getString("userId"));
				dto.setUserName(rs.getString("userName"));
				dto.setUserName(rs.getString("content"));
				dto.setUserName(rs.getString("created"));
				dto.setUserName(rs.getString("rev"));

			}

			rs.close();
			pstmt.close();

		} catch (Exception e) {
			System.out.println(e.toString());

		}

		return dto;

	}

}