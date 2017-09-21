package pizza.service;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;

public class ToppingDTO {
	@Resource(name="template")
	private SqlSessionTemplate template;
	
	private String t_code;
	private String t_name;
	private String t_img;
	private String t_kind;
	private String t_allergy;
	
	//프로그램 효율성을 위한 추가
	private String ts_no;
	private String t_size;
	private String t_price;
	private String t_gram;
	
	private String t_Ssize;
	private String t_Sprice;
	private String t_Msize;
	private String t_Mprice;
	private String t_Lsize;
	private String t_Lprice;
	
	private String t_kcal;
	private String t_protein;
	private String t_sfat;
	private String t_natrium;
	private String t_sugar;
	
	public String getT_code() {
		return t_code;
	}
	public void setT_code(String t_code) {
		this.t_code = t_code;
	}
	public String getT_name() {
		return t_name;
	}
	public void setT_name(String t_name) {
		this.t_name = t_name;
	}
	public String getT_img() {
		return t_img;
	}
	public void setT_img(String t_img) {
		this.t_img = t_img;
	}
	public String getT_kind() {
		return t_kind;
	}
	public void setT_kind(String t_kind) {
		this.t_kind = t_kind;
	}
	public String getTs_no() {
		return ts_no;
	}
	public void setTs_no(String ts_no) {
		this.ts_no = ts_no;
	}
	public String getT_size() {
		return t_size;
	}
	public void setT_size(String t_size) {
		this.t_size = t_size;
	}
	public String getT_price() {
		return t_price;
	}
	public void setT_price(String t_price) {
		this.t_price = t_price;
	}
	public String getT_gram() {
		return t_gram;
	}
	public void setT_gram(String t_gram) {
		this.t_gram = t_gram;
	}
	public String getT_allergy() {
		return t_allergy;
	}
	public void setT_allergy(String t_allergy) {
		this.t_allergy = t_allergy;
	}
	public SqlSessionTemplate getTemplate() {
		return template;
	}
	public void setTemplate(SqlSessionTemplate template) {
		this.template = template;
	}
	public String getT_Ssize() {
		return t_Ssize;
	}
	public void setT_Ssize(String t_Ssize) {
		this.t_Ssize = t_Ssize;
	}
	public String getT_Sprice() {
		return t_Sprice;
	}
	public void setT_Sprice(String t_Sprice) {
		this.t_Sprice = t_Sprice;
	}
	public String getT_Msize() {
		return t_Msize;
	}
	public void setT_Msize(String t_Msize) {
		this.t_Msize = t_Msize;
	}
	public String getT_Mprice() {
		return t_Mprice;
	}
	public void setT_Mprice(String t_Mprice) {
		this.t_Mprice = t_Mprice;
	}
	public String getT_Lsize() {
		return t_Lsize;
	}
	public void setT_Lsize(String t_Lsize) {
		this.t_Lsize = t_Lsize;
	}
	public String getT_Lprice() {
		return t_Lprice;
	}
	public void setT_Lprice(String t_Lprice) {
		this.t_Lprice = t_Lprice;
	}
	public String getT_kcal() {
		return t_kcal;
	}
	public void setT_kcal(String t_kcal) {
		this.t_kcal = t_kcal;
	}
	public String getT_protein() {
		return t_protein;
	}
	public void setT_protein(String t_protein) {
		this.t_protein = t_protein;
	}
	public String getT_sfat() {
		return t_sfat;
	}
	public void setT_sfat(String t_sfat) {
		this.t_sfat = t_sfat;
	}
	public String getT_natrium() {
		return t_natrium;
	}
	public void setT_natrium(String t_natrium) {
		this.t_natrium = t_natrium;
	}
	public String getT_sugar() {
		return t_sugar;
	}
	public void setT_sugar(String t_sugar) {
		this.t_sugar = t_sugar;
	}
	
	
	
}
