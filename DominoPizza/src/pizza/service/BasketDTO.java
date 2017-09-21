package pizza.service;

import java.util.List;

public class BasketDTO {
	
	private String no; //피자 넘버
	private String name; //피자 이름
	private String price; //피자 가격
	private String qty;
	private String dough;
	private String img;
	private String size;
	private String doughno;
	private String kind;
	private String mkSauce;
	
	private List<ToppingDTO> toppingList;
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public String getQty() {
		return qty;
	}
	public void setQty(String qty) {
		this.qty = qty;
	}
	public String getDough() {
		return dough;
	}
	public void setDough(String dough) {
		this.dough = dough;
	}
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	public String getSize() {
		return size;
	}
	public void setSize(String size) {
		this.size = size;
	}
	public String getDoughno() {
		return doughno;
	}
	public void setDoughno(String doughno) {
		this.doughno = doughno;
	}
	public String getKind() {
		return kind;
	}
	public void setKind(String kind) {
		this.kind = kind;
	}
	public List<ToppingDTO> getToppingList() {
		return toppingList;
	}
	public void setToppingList(List<ToppingDTO> toppingList) {
		this.toppingList = toppingList;
	}
	public String getNo() {
		return no;
	}
	public void setNo(String no) {
		this.no = no;
	}
	public String getMkSauce() {
		return mkSauce;
	}
	public void setMkSauce(String mkSauce) {
		this.mkSauce = mkSauce;
	}
}
