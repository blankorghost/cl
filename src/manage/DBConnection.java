package manage;
import java.sql.*;
public class DBConnection {
	static String NAME="root";
	static String KEY="1234";
	static Connection con=null;
	 /**数据库建立连接**/
	public static Connection getConnection(){
		if(con==null){
			try {
				Class.forName("com.mysql.jdbc.Driver");
			} catch (ClassNotFoundException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
				System.out.println("加载驱动失败！");
			}
			try {
				con = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/clothshop",NAME,KEY);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				System.out.println("数据库连接失败！");
			}
		}
		return con;
	}
	/** 关闭数据库的操作 */
    public static void closeConnection() {
     	if(con!=null)
			try {
				con.close();
				con=null;
			} catch (SQLException e) {
				e.printStackTrace();
				System.out.println("关闭con对象失败！");
			}
    }
}
