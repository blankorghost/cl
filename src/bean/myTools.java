package bean;
import java.io.UnsupportedEncodingException;

public class myTools {
	public static int strToint(String str){			//将String型数据转换为int型数据的方法
		if(str==null||str.equals(""))
			str="0";
		int i=0;
		try{
			i=Integer.parseInt(str);
		}catch(NumberFormatException e){
			i=0;
			e.printStackTrace();
		}
		return i;		
	}
	public static float strToFloat(String str){			//将String型数据转换为float型数据的方法
		if(str==null||str.equals(""))
			str="0";
		float f=0.0f;
		try{
			f=Float.parseFloat(str);
		}catch(NumberFormatException e){
			f=0.0f;
			e.printStackTrace();
		}
		return f;		
	}
	public static String toChinese(String str){		//进行转码操作的方法
		if(str==null)
			str="";
		try {
			str=new String(str.getBytes("ISO-8859-1"),"gb2312");
		} catch (UnsupportedEncodingException e) {
			str="";
			e.printStackTrace();
		}
		return str;
	}
}	

