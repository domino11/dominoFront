package pizza.resource;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.ibatis.sqlmap.engine.config.SqlMapConfiguration;

import pizza.service.impl.CouponDto;
import pizza.service.impl.OrderDto;
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

	@Override
	public List<CouponDto> coupons(CouponDto dto) throws SQLException {
		return template.selectList("SelectMyCoupon_Name",dto);
	}

	@Override
	public List Uncoupons(CouponDto dto) throws SQLException {
		return template.selectList("SelectUncoupon",dto);
	}

	@Override
	public int UnCouponnum(CouponDto dto) throws SQLException {
		return template.selectOne("CountUnCoupon",dto);
	}

	@Override
	public List Order(OrderDto dto) throws SQLException {
		return template.selectList("SelectOrder",dto);
	}

	@Override
	public Map CountSales(Map map) throws SQLException {
		return template.selectOne("CountSales",map);
	}

	@Override
	public List<String> MyRatingCoupon(CouponDto dto) throws SQLException {
		return template.selectList("MyCouponByRating",dto);
	}

	@Override
	public int MyCouponByRatingForDownLoad(CouponDto dto) throws SQLException {
		return template.insert("MyCouponByRatingForDownLoad",dto);
	}

	public List<CouponDto> getrcoupon(CouponDto dto) {
		return template.selectList("mybatisgetrcoupon",dto);
	}

	
	
	
	
	
	
	
	
}
