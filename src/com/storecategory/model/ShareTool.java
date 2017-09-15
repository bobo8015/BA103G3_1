package com.storecategory.model;
import java.io.BufferedReader;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.FileReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.io.Reader;
import java.io.StringReader;
import java.io.StringWriter;
import java.sql.Blob;
import java.sql.Clob;
import java.sql.SQLException;

public class ShareTool {

	public static byte[] sendPicture(String path) throws IOException {
		
		FileInputStream in = new FileInputStream(path);
		ByteArrayOutputStream out = new ByteArrayOutputStream();
		byte[] buff = new byte[in.available()];
		int len;
		while((len=in.read(buff)) != -1) {
			out.write(buff, 0 , len);
		}
		out.close();
		in.close();
		return out.toByteArray();
	}
	
	public static String sendInfo(String text) throws IOException {
		
		BufferedReader in = new BufferedReader(new FileReader(text));
		StringBuilder sb = new StringBuilder();
		String info;
		while((info = in.readLine()) != null) {
			sb.append(info);
			sb.append("\n\r");
		}
		return sb.toString();
	}
	
	public static void readPicture(byte[] bytes) throws IOException {
		
		FileOutputStream out = null;
		if(bytes.length != 0) {
			out = new FileOutputStream("show/"+ TestStocaJDBCGetOne.path + ".png");
			out.write(bytes);
			out.flush();
		}
		
		out.close();
		
	}
	
	public static void readFile(String str) throws IOException {
		
		PrintWriter out = null;
		if(str.length() != 0) {
			out = new PrintWriter("show/" + TestStocaJDBCGetOne.name + ".txt");
			out.write(str);
			out.flush();
		}
		
		out.close();
		
	}
}
