<%@ page import="java.io.*,java.sql.*,java.util.zip.*" %>
<%
String saveFile="";
String name_msg=(String)request.getParameter("ProductName");  
String category_msg=(String)request.getParameter("Category");  
String sell_msg=(String)request.getParameter("SellOrDonate");  
String price_msg= request.getParameter("Price");  
System.out.println(price_msg);
String charity_msg=(String)request.getParameter("Charity");  
String contentType = request.getContentType();
if((contentType != null)&&(contentType.indexOf("multipart/form-data") >= 0)){
DataInputStream in = new DataInputStream(request.getInputStream());
int formDataLength = request.getContentLength();
byte dataBytes[] = new byte[formDataLength];
int byteRead = 0;
int totalBytesRead = 0;
while(totalBytesRead < formDataLength){
byteRead = in.read(dataBytes, totalBytesRead,formDataLength);
totalBytesRead += byteRead;
}
String file = new String(dataBytes);
saveFile = file.substring(file.indexOf("filename=\"") + 10);
saveFile = saveFile.substring(0, saveFile.indexOf("\n"));
saveFile = saveFile.substring(saveFile.lastIndexOf("\\") + 1,saveFile.indexOf("\""));
int lastIndex = contentType.lastIndexOf("=");
String boundary = contentType.substring(lastIndex + 1,contentType.length());
int pos;
pos = file.indexOf("filename=\"");
pos = file.indexOf("\n", pos) + 1;
pos = file.indexOf("\n", pos) + 1;
pos = file.indexOf("\n", pos) + 1;
int boundaryLocation = file.indexOf(boundary, pos) - 4;
int startPos = ((file.substring(0, pos)).getBytes()).length;
int endPos = ((file.substring(0, boundaryLocation)).getBytes()).length;
File ff = new File("C:/UploadedFiles/"+saveFile);
FileOutputStream fileOut = new FileOutputStream(ff);
fileOut.write(dataBytes, startPos, (endPos - startPos));
fileOut.flush();
fileOut.close();
%><br><table border="2"><tr><td><b>You have successfully upload the file:</b>
<%out.println(saveFile);%></td></tr></table>
<%
PreparedStatement psmnt;
try{
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection connection = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl","SSDI","SSDI_29");
	System.out.println("Connected");

psmnt = connection.prepareStatement("insert into products(CATEGORY,SELLORDONATE,CHARITY,PRODUCT_NAME,IMAGE,PRICE) values(?,?,?,?,?,?)");
//psmnt.setString(1, "NULL");
psmnt.setString(1, category_msg);
psmnt.setString(2, sell_msg);
psmnt.setString(3, charity_msg);
psmnt.setString(4, name_msg);
psmnt.setString(5, ff.getPath());
psmnt.setString(6, price_msg);

int s = psmnt.executeUpdate();
if(s>0){
System.out.println("Uploaded successfully !");
}
else{
System.out.println("Error!");
}
}
catch(Exception e){
    e.printStackTrace();
}
}
%>