package bean;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.PrintWriter;
import java.util.Random;
import javax.servlet.RequestDispatcher;

@WebServlet("/uploadServlet")
@MultipartConfig(maxFileSize = 16177215)

public class ProductDAO extends HttpServlet 
{
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException 
    {
                response.setContentType("text/html;charset=UTF-8");
                PrintWriter out = response.getWriter();
                final Connection con;
                con=ConnectionProvider.getCon();
                InputStream inputStream = null;

                Random rand = new Random();
                int  n = rand.nextInt(9999) + 1;
                String idTemp=(String.valueOf(n));

                String name_msg=(String)request.getParameter("ProductName");  
              
                String category_msg=(String)request.getParameter("Category");  
              
                String sell_msg=(String)request.getParameter("SellOrDonate");  
                
                String price_msg= request.getParameter("Price");  
               
                String charity_msg=(String)request.getParameter("Charity");  
              
                Part filePart=request.getPart("file");  
                
                
                if (filePart != null) 
                {
                    System.out.println(filePart.getName());
                    System.out.println(filePart.getSize());
                    System.out.println(filePart.getContentType());

                    inputStream = filePart.getInputStream();
                }
        
                try 
                {

            		String query = "INSERT INTO products ("
            				    + " product_id"
            				    + " Category,"
            				    + " product_thumbnail,"
            				    + " SellorDonate,"
            				    + " price,"
            				    + " charity,"
            				    + " product_name ) VALUES ("
            				    + "NULL, ?, ?, ?, ?, ?, ?)";
            			
            			PreparedStatement ps=con.prepareStatement(query);
            			
            			ps.setString(2, category_msg);
            			ps.setString(4, sell_msg);
            			ps.setInt(5, Integer.parseInt(price_msg));
            			ps.setString(6, charity_msg);
            			ps.setString(7, name_msg);
            			 if (inputStream != null) 
                         {
                             ps.setBinaryStream(3, inputStream, (int) filePart.getSize());
                         }
            }catch(Exception e){e.printStackTrace();}     
    }   
}