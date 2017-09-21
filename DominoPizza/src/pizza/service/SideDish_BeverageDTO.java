package pizza.service;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;

public class SideDish_BeverageDTO {
	@Resource(name="template")
	private SqlSessionTemplate template;
	
	private String dr_no;
	private String d_name;
	private String d_price;
	private String d_img;
	public String getDr_no() {
		return dr_no;
	}
	public void setDr_no(String dr_no) {
		this.dr_no = dr_no;
	}
	public String getd_name() {
		return d_name;
	}
	public void setd_name(String d_name) {
		this.d_name = d_name;
	}
	public String getd_price() {
		return d_price;
	}
	public void setd_price(String d_price) {
		this.d_price = d_price;
	}
	public String getd_img() {
		return d_img;
	}
	public void setd_img(String d_img) {
		this.d_img = d_img;
	}
	
}
