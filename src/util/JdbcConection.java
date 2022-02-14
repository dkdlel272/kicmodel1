package util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

//src.jdbc.JdbcConection
//jdbc:oracle:thin:@localhost:1521:xe 연결 url

public class JdbcConection {
	//Connection :oracle server 연결 sql 전달 객체
	public static Connection getConnection() {
		Connection con =null;
		//String url ="jdbc:oracle:thin:@localhost:1521:xe";
		//String userId = "kic";
		//String passdword ="1111";
		try {
			Class.forName("oracle.jdbc.OracleDriver");
			con = DriverManager
					.getConnection("jdbc:oracle:thin:@localhost:1521:xe","kic","0627");
					//getConnection(url,userId,password);
			System.out.println("ok db");
		}catch(Exception e) {
			e.printStackTrace();
			System.out.println("error db");
		}
		return con;
	}
	public static void close(Connection con, PreparedStatement pstmt, ResultSet rs) {
		try {
			if(con !=null) {
				con.commit();
				con.close();
				
			}
			if(pstmt !=null) {
				pstmt.close();
			}
			if(rs !=null) {
				rs.close();
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
	}
}

//xe : 데이터베이스
//kic : user명
//1111 : passwoard