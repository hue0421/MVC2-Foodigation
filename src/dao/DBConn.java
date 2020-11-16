package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class DBConn {
	
	
	public static Connection getConn() {
		Connection conn=null;
		try {
			Context initContext = new InitialContext();
			Context envContext  = (Context)initContext.lookup("java:/comp/env");
			DataSource ds = (DataSource)envContext.lookup("jdbc/foracle");
			conn = ds.getConnection();
			System.out.println("db연결");
		}catch(Exception ex) {
			ex.printStackTrace();
		}
		return conn;
	}
	public static void close(Connection conn,PreparedStatement ps,ResultSet rs) {
		try {
			if(rs!=null)rs.close();
			if(ps!=null)ps.close();
			if(conn!=null)conn.close();
			
		}catch(Exception ex) {}
	}

	//DML(isert, update, delete)을 수행한 후 리소스 해제를 위한 메소드
	public static void close(Connection conn,PreparedStatement ps) {
		try {
			if(ps!=null)ps.close();
			if(conn!=null)conn.close();
			
		}catch(Exception ex) {}
	}
}
