package pizza.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import pizza.service.PizzaSauceDTO;
import pizza.service.PizzaSauceService;
@Repository
public class PizzaSauceDAO implements PizzaSauceService{
	@Resource(name="template")
	private SqlSessionTemplate template;
	@Override
	public List<PizzaSauceDTO> selectList() {
		return template.selectList("pizzaSauceSelectList");
	}

}
