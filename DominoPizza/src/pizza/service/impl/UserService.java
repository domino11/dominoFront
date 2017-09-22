package pizza.service.impl;

import java.sql.SQLException;
import java.util.List;

public interface UserService {

	//회원가입
	public int insert(UserDto dto) throws SQLException;
	
	//로그인 체크용
	public String loginCheck(UserDto dto) throws SQLException;

	//회원 아이디
	public int showMember(UserDto dto) throws SQLException;
	
	//아이디 찾기
	public String SearchId(UserDto dto) throws SQLException;
	
	//비밀번호 찾기
	public int SearchPwd(UserDto dto) throws SQLException;	
	
	//회원 수정
	public int UpdateCustomer(UserDto dto) throws SQLException;
	
	public int Couponnum(UserDto dto) throws SQLException;
	
	public int UpdatePwd(UserDto dto) throws SQLException;
}
