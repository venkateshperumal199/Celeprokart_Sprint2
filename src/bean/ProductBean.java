package bean;
import javax.servlet.http.Part;
public class ProductBean {

	String productName;
	Part filePart;
	String Category;
	String sellOrDonate;
	int price;
	int id;
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	String charity;
	
	public ProductBean() 
	{
		// TODO Auto-generated constructor stub
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public Part getFilePart() {
		return filePart;
	}

	public void setFilePart(Part filePart) {
		this.filePart = filePart;
	}

	public String getCategory() {
		return Category;
	}

	public void setCategory(String category) {
		Category = category;
	}

	public String getSellOrDonate() {
		return sellOrDonate;
	}

	public void setSellOrDonate(String sellOrDonate) {
		this.sellOrDonate = sellOrDonate;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getCharity() {
		return charity;
	}

	public void setCharity(String charity) {
		this.charity = charity;
	}
	
	

}
