package pizza.service.impl;

import java.sql.SQLException;
import java.util.List;

public interface UserService {

	//입력/수정/삭제용]
	public int insert(UserDto dto) throws SQLException;
	
	//로그인 체크용
	public String loginCheck(UserDto dto) throws SQLException;
}
