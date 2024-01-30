package com.charge;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import com.user.SignUpDTO;

public class ChargeDAO {

	private Connection conn;

	public ChargeDAO(Connection conn) {

		this.conn = conn;
	}

	public int chargeGetDataCount(String userId) {

		int dataCount = 0;

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;

		try {

			sql = "select nvl(count(*),0) from orders where userid=?";

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

	public int chargeInsertData(ChargeDTO dto) {

		int result = 0;

		PreparedStatement pstmt = null;
		String sql;

		try {

			sql = "insert into orders (orderid,userId,userName,productName,price,productNum,saveFileName,created,qty) ";
			sql += "values (TO_CHAR(SYSDATE, 'YYYYMMDD') || order_seq.NEXTVAL,?,?,?,?,?,?,sysdate,?)";

			pstmt = conn.prepareStatement(sql); // Ϻ ˻

			pstmt.setString(1, dto.getUserId());
			pstmt.setString(2, dto.getUserName());
			pstmt.setString(3, dto.getProductName());
			pstmt.setInt(4, dto.getPrice());
			pstmt.setInt(5, dto.getProductNum());
			pstmt.setString(6, dto.getSaveFileName());
			pstmt.setInt(7, dto.getQty());

			result = pstmt.executeUpdate();

			pstmt.close();

		} catch (Exception e) {
			System.out.println(e.toString());
		}

		return result;

	}

	public List<ChargeDTO> chargeGetList(int start, int end, String userId) {

		List<ChargeDTO> lists = new ArrayList<ChargeDTO>();

		PreparedStatement pstmt = null;

		ResultSet rs = null;

		String sql;

		try {

			sql = "select * from (";
			sql += "select rownum rnum, data.* from(";
			sql += "select orderid,userId,userName,productName,productNum,price,saveFileName,created,qty from orders where userid=? order by oderid desc) data) ";
			sql += "where rnum>=? and rnum<=?";

			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, userId);
			pstmt.setInt(2, start);
			pstmt.setInt(3, end);

			rs = pstmt.executeQuery();

			while (rs.next()) {

				ChargeDTO dto = new ChargeDTO();

				dto.setOrderid(rs.getString("orderid"));
				dto.setUserId(rs.getString("userId"));
				dto.setUserName(rs.getString("userName"));
				dto.setProductName(rs.getString("productName"));
				dto.setProductNum(rs.getInt("productNum"));
				dto.setPrice(rs.getInt("price"));
				dto.setSaveFileName(rs.getString("saveFileName"));
				dto.setCreated(rs.getString("created"));
				dto.setQty(rs.getInt("qty"));

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

	public SignUpDTO chargeGetReadData(String userId) {

		SignUpDTO dto = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;

		try {

			sql = "select mobile1||'-'||mobile2||'-'||mobile3,";
			sql += "SAMPLE4_ROADADDRESS||' '||SAMPLE4_JIBUNADDRESS||' '||SAMPLE4_DETAILADDRESS||' '||SAMPLE4_EXTRAADDRESS  ";
			sql += "from signup where userId=?";

			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, userId);

			rs = pstmt.executeQuery();

			if (rs.next()) {

				dto = new SignUpDTO();

				dto.setMobile1(rs.getString(1));
				dto.setSample4_roadAddress(rs.getString(2));

			}

			rs.close();
			pstmt.close();

		} catch (Exception e) {
			System.out.println(e.toString());
		}

		return dto;

	}

}
