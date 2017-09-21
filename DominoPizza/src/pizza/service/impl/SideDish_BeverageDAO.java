package pizza.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import pizza.service.SideDish_BeverageDTO;
import pizza.service.SideDish_BeverageService;
import pizza.service.ToppingDTO;
@Repository
public class SideDish_BeverageDAO implements SideDish_BeverageService{
	@Resource(name="template")
	private SqlSessionTemplate template;
	
	@Override
	public List<SideDish_BeverageDTO> selectList() {
		return template.selectList("sideDishBvrgSelectList");
	}
}
