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

	@Override
	public int showMember(UserDto dto) throws SQLException {		
		return template.selectOne("ShowMember",dto);
	}

	@Override
	public String SearchId(UserDto dto) throws SQLException {
		return template.selectOne("SearchId",dto);
	}

	@Override
	public int SearchPwd(UserDto dto) throws SQLException {
		return template.update("SearchPwd",dto);
	}

	@Override
	public int UpdateCustomer(UserDto dto) throws SQLException {
		return template.update("UpdateCustomer",dto);
	}

	@Override
	public int Couponnum(UserDto dto) throws SQLException {
		return template.selectOne("CountCoupon",dto);
	}

	@Override
	public int UpdatePwd(UserDto dto) throws SQLException {
		return template.update("UpdatePwd",dto);
	}
	
	
	
	
	
	
	
}
