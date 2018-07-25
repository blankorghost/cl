package common;
import java.sql.Connection;
import java.sql.DriverManager;
public class DBConnection {
	static Connection connection=null;
	static String url="jdbc:mysql://localhost:3306/clothshop?useUnicoding=true&characterEncoding=utf-8";
	static String user="root";
	static String password="1234";
	
	public static Connection getConnection(){
		try {
			Class.forName("com.mysql.jdbc.Driver");
			connection=DriverManager.getConnection(url, user, password);
			return connection;
		} catch (Exception e) {
			System.out.println("连接数据库失败！");// TODO: handle exception
		}
		return null;
	}
}
