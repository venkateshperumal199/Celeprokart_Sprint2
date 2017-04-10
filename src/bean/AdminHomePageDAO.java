package bean;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class AdminHomePageDAO {
	
	public static ArrayList<AddCharityBean> listCharity()
	{
		ArrayList<AddCharityBean> listOfCharities=new ArrayList<>();
		try{  
			Connection con=ConnectionProvider.getCon();  
			              
			PreparedStatement ps=con.prepareStatement("select * from Charity"); 		             
			ResultSet rs=ps.executeQuery(); 
			while (rs.next()) 
			{
				String name = rs.getString("name");
				AddCharityBean bean = new AddCharityBean();
				bean.setName(name);
				listOfCharities.add(bean);
			}
			
			}catch(Exception e){
				
				e.printStackTrace();
			}  	
		
		return listOfCharities;	
	}
	public static ArrayList<SignUpCelebrityBean> listCelebrities()
	{
		ArrayList<SignUpCelebrityBean> listOfCelebrities=new ArrayList<>();
		try{  
			Connection con=ConnectionProvider.getCon();  
			              
			PreparedStatement ps=con.prepareStatement("select * from Celebrity"); 		             
			ResultSet rs=ps.executeQuery(); 
			while (rs.next()) 
			{
				String name = rs.getString("email_ID");
				SignUpCelebrityBean bean = new SignUpCelebrityBean();
				bean.setEmailID(name);
				System.out.println(bean.getEmailID());
				
				listOfCelebrities.add(bean);
			}
			
			}catch(Exception e){
				
				e.printStackTrace();
			}  	
		
		return listOfCelebrities;	
	
	}
	public static ArrayList<ProductBean> listProducts()
	{
		ArrayList<ProductBean> listOfProducts=new ArrayList<>();
		try{  
			Connection con=ConnectionProvider.getCon();  
			              
			PreparedStatement ps=con.prepareStatement("select * from Products"); 		             
			ResultSet rs=ps.executeQuery(); 
			while (rs.next()) 
			{
				String name = rs.getString("PRODUCT_NAME");
				int id=rs.getInt("PRODUCT_ID");
				ProductBean bean = new ProductBean();
				bean.setProductName(name);
				bean.setId(id);
				System.out.println(bean.getProductName());				
				listOfProducts.add(bean);
			}
			
			}catch(Exception e){
				
				e.printStackTrace();
			}  	
		
		return listOfProducts;	
	
	}

}
