package pizza.service.impl;

import java.sql.SQLException;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import pizza.resource.UserDao;

@Service
public class UserServiceImpl implements UserService {
	
	@Resource(name="userDao")
	private UserDao dao;
	
	@Override
	public int insert(UserDto dto) throws SQLException{
		
		return dao.insert(dto);
	}

	@Override
	public String loginCheck(UserDto dto) throws SQLException {
		return dao.loginCheck(dto);
	}

	@Override
	public int showMember(UserDto dto) throws SQLException {
		
		return dao.showMember(dto);
	}

	@Override
	public String SearchId(UserDto dto) throws SQLException {
		return dao.SearchId(dto);
	}

	@Override
	public int SearchPwd(UserDto dto) throws SQLException {
		return dao.SearchPwd(dto);
	}

	@Override
	public int UpdateCustomer(UserDto dto) throws SQLException {
		return dao.UpdateCustomer(dto);
	}

	@Override
	public int Couponnum(UserDto dto) throws SQLException {
		return dao.Couponnum(dto);
	}

	@Override
	public int UpdatePwd(UserDto dto) throws SQLException {
		return dao.UpdatePwd(dto);
	}

	

	
	
	
}
