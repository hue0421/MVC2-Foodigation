package dao;

import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import vo.Member;

public class MemberDao {
	private MemberDao() {}

	private static MemberDao instance = new MemberDao();

	public static MemberDao getInstance() {
		return instance;
	}
	// 전체 user return
	public List<Member> selectAll() {
		List<Member> list = new ArrayList<Member>();
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;

		String sql = "select * from f_member";

		try {
			conn = DBConn.getConn();
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			while (rs.next()) {
				Member member = new Member();
				member.setId(rs.getString("id"));
				member.setPw(rs.getString("pw"));
				member.setName(rs.getString("name"));
				member.setNickname(rs.getString("nickname"));
				list.add(member);
			}
		} catch (Exception ex) {
			ex.getStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (ps != null)
					ps.close();
				if (conn != null)
					conn.close();
			} catch (Exception ex) {
				ex.getStackTrace();
			} finally {
				DBConn.close(conn, ps, rs);
			}
		}
		return list;
	}

	// 특정 user return
	public Member selectOne(String id) {
		Member member = null;
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;

		String sql = "select * from f_member where id=?";

		try {
			conn = DBConn.getConn();
			ps = conn.prepareStatement(sql);
			ps.setString(1, id);
			rs = ps.executeQuery();

			if (rs.next()) {
				member = new Member();
				member.setId(rs.getNString("id"));
				member.setPw(rs.getNString("pw"));
				member.setName(rs.getNString("name"));
				member.setNickname(rs.getNString("nickname"));
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			DBConn.close(conn, ps, rs);
		}
		return member;
	}

	
	public String nickname_return(String id) {
		Member member = null;
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;

		String sql = "select * from f_member where id=?";

		try {
			conn = DBConn.getConn();
			ps = conn.prepareStatement(sql);
			ps.setString(1, id);
			rs = ps.executeQuery();

			if (rs.next()) {
				member = new Member();
				member.setId(rs.getNString("id"));
				member.setPw(rs.getNString("pw"));
				member.setName(rs.getNString("name"));
				member.setNickname(rs.getNString("nickname"));
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			DBConn.close(conn, ps, rs);
		}
		return member.getNickname();
	}
	
	// user insert
	public boolean insert(Member member) {
		boolean flag = false;
		
		Connection conn = null;
		PreparedStatement ps = null;
		
		String sql = "insert into f_member(id,pw,name,nickname) " + "values(?,?,?,?)";
		
		try {
			conn = DBConn.getConn();
			ps = conn.prepareStatement(sql);
			ps.setString(1, member.getId());
			ps.setString(2, member.getPw());
			ps.setString(3, member.getName());
			ps.setString(4, member.getNickname());
		
			int n = ps.executeUpdate();
			
			if (n == 1) {
				flag = true;
				System.out.println("회원가입 성공");
			} else {
				System.out.println("회원가입 실패");
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			DBConn.close(conn, ps);
		}
		return flag;
	}

	// user(ID) check
	public boolean overappedId(String id) {
		boolean flag = false;
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		String sql = "select * from f_member where id=?";
		
		try {
			conn = DBConn.getConn();
			ps = conn.prepareStatement(sql);
			ps.setString(1, id);
			rs = ps.executeQuery();
		
			if (rs.next()) {
				flag = true;
				//System.out.println("아이디 중복");
			} else {
				//System.out.println("중복 아이디 없음");
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			DBConn.close(conn, ps, rs);
		}
		return flag;
	}

	// login check
	public int login(String id, String pw) {
		int n = -1;
		
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		String sql = "select pw from f_member where id=?";
		
		try {
			conn = DBConn.getConn();
			ps = conn.prepareStatement(sql);
			ps.setString(1, id);
			rs = ps.executeQuery();
		
			if (rs.next()) {
				if (pw.equals(rs.getString(1))) {
					n = 1;
					//System.out.println("로그인 성공");
				} else {
					n = 0;
					//System.out.println("패스워드 다름");
				}
			} else {
				//System.out.println("아이디 없음");
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			DBConn.close(conn, ps, rs);
		}
		return n;
	}

	// user update
	public boolean update(Member member) {
		boolean flag = false;
		
		Connection conn = null;
		PreparedStatement ps = null;

		String sql = "update f_member set pw=?,name=?,nickname=? where id=?";
		
		try {
			conn = DBConn.getConn();
			ps = conn.prepareStatement(sql);
			ps.setNString(1, member.getPw());
			ps.setNString(2, member.getName());
			ps.setNString(3, member.getNickname());
			ps.setNString(4, member.getId());
			int n = ps.executeUpdate();
			if (n == 1) {
				flag = true;
				System.out.println("업데이트 성공");
			} else {
				System.out.println("업데이트 실패");
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			DBConn.close(conn, ps);
		}
		return flag;
	}

	// user delete
	public boolean delete(String id) {
		boolean flag = false;

		Connection conn = null;
		PreparedStatement ps = null;
		
		String sql = "delete from f_member where id=?";
		
		try {
			conn = DBConn.getConn();
			ps = conn.prepareStatement(sql);
			ps.setString(1, id);
			int n = ps.executeUpdate();
			if (n == 1) {
				flag = true;
				System.out.println("삭제 성공");
			} else {
				System.out.println("삭제 실패");
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			DBConn.close(conn, ps);
		}
		return flag;
	}
}
