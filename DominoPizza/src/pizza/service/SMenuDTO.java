package pizza.service;

import java.util.List;

public class SMenuDTO {
	
	private String sa_no;
	private String menu_name;
	private String menu_img;
	private String menu_kind;
	private String menu_qty;
	private String menu_price;
	private String sm_no;
	private String menu_no;
	private String menu_size;
	private List<ToppingDTO> toppingList;
	
	
	public String getSa_no() {
		return sa_no;
	}
	public void setSa_no(String sa_no) {
		this.sa_no = sa_no;
	}
	public String getMenu_name() {
		return menu_name;
	}
	public void setMenu_name(String menu_name) {
		this.menu_name = menu_name;
	}
	public String getMenu_img() {
		return menu_img;
	}
	public void setMenu_img(String menu_img) {
		this.menu_img = menu_img;
	}
	public String getMenu_kind() {
		return menu_kind;
	}
	public void setMenu_kind(String menu_kind) {
		this.menu_kind = menu_kind;
	}
	public String getMenu_qty() {
		return menu_qty;
	}
	public void setMenu_qty(String menu_qty) {
		this.menu_qty = menu_qty;
	}
	public String getMenu_price() {
		return menu_price;
	}
	public void setMenu_price(String menu_price) {
		this.menu_price = menu_price;
	}
	public String getSm_no() {
		return sm_no;
	}
	public void setSm_no(String sm_no) {
		this.sm_no = sm_no;
	}
	public String getMenu_no() {
		return menu_no;
	}
	public void setMenu_no(String menu_no) {
		this.menu_no = menu_no;
	}
	public String getMenu_size() {
		return menu_size;
	}
	public void setMenu_size(String menu_size) {
		this.menu_size = menu_size;
	}
	
	

	

}
