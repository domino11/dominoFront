package pizza.service;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;

public class BranchDTO {

	@Resource(name="template")
	private SqlSessionTemplate template;
	
	private String st_no;
	private String st_name;
	private String st_tel;
	private String st_post;
	private String st_addr;
	private String st_parkin;
	private String st_time;
	private String st_xpos;
	private String st_ypos;
	private String region_code_2; // 총 매장 수 구하기위한 
	
	public SqlSessionTemplate getTemplate() {
		return template;
	}
	public void setTemplate(SqlSessionTemplate template) {
		this.template = template;
	}
	public String getSt_no() {
		return st_no;
	}
	public void setSt_no(String st_no) {
		this.st_no = st_no;
	}
	public String getSt_name() {
		return st_name;
	}
	public void setSt_name(String st_name) {
		this.st_name = st_name;
	}
	public String getSt_tel() {
		return st_tel;
	}
	public void setSt_tel(String st_tel) {
		this.st_tel = st_tel;
	}
	public String getSt_post() {
		return st_post;
	}
	public void setSt_post(String st_post) {
		this.st_post = st_post;
	}
	public String getSt_addr() {
		return st_addr;
	}
	public void setSt_addr(String st_addr) {
		this.st_addr = st_addr;
	}
	public String getSt_parkin() {
		return st_parkin;
	}
	public void setSt_parkin(String st_parkin) {
		this.st_parkin = st_parkin;
	}
	public String getSt_time() {
		return st_time;
	}
	public void setSt_time(String st_time) {
		this.st_time = st_time;
	}
	public String getSt_xpos() {
		return st_xpos;
	}
	public void setSt_xpos(String st_xpos) {
		this.st_xpos = st_xpos;
	}
	public String getSt_ypos() {
		return st_ypos;
	}
	public void setSt_ypos(String st_ypos) {
		this.st_ypos = st_ypos;
	}
	public String getRegion_code_2() {
		return region_code_2;
	}
	public void setRegion_code_2(String region_code_2) {
		this.region_code_2 = region_code_2;
	}
	
	
}
