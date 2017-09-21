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

	
	
	
}
