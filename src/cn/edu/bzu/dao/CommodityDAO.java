package cn.edu.bzu.dao;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import cn.edu.bzu.entity.Commodity;

public class CommodityDAO {
	public List readFirstTitle(){
		         List<Commodity> list =new ArrayList<Commodity>();
		         Connection con=null;
		         PreparedStatement psmt=null;
		         ResultSet rs=null;
		         try {
		             Class.forName("com.mysql.jdbc.Driver");
		         } catch (ClassNotFoundException e) {
		             e.printStackTrace();
		         }
		         
		         try {
		             con=DriverManager.getConnection("jdbc:mysql://localhost:3306/markets?serverTimezone=UTC","root","1234"); 
		             String sql="select * from commodity";
		             psmt=con.prepareStatement(sql);
		             rs=psmt.executeQuery();
		               
		             while(rs.next())
		             {
		                 int id=rs.getInt("id");
		                 String name=rs.getString("name");
		                 int amounts=rs.getInt("amounts");
		                 double prices=rs.getDouble("prices");
		                 Commodity tl=new Commodity(id, name, amounts, prices);
		                 list.add(tl);
		             }
		             
		         } catch (SQLException e) {
		             e.printStackTrace();
		         }finally
		         {
		             try {
		                 if(rs!=null)
		                 {
		                     rs.close();
		                 }
		                 if(psmt!=null)
		                 {
		                     psmt.close();
		                 }
		                 if(con!=null)
		                 {
		                     con.close();
		                 }
		             } catch (SQLException e) {
		                 e.printStackTrace();
		             }
		         }
		         return list;
		     }     
		 }