package pizza.resource;

import java.sql.SQLException;
import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.ibatis.sqlmap.engine.config.SqlMapConfiguration;

import pizza.service.impl.UserDto;
import pizza.service.impl.UserService;
@Repository
public class UserDao implements UserService {
	
	@Resource(name="template")
	private SqlSessionTemplate template;
	
	@Override
	public int insert(UserDto dto) throws SQLException {
		return template.insert("UserInsert",dto);
		
	}

	@Override
	public String loginCheck(UserDto dto) throws SQLException {
		
		return template.selectOne("UserSelectOne",dto);
	}

	
}
