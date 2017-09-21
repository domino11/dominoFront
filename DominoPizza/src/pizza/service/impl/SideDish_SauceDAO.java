package pizza.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import pizza.service.SideDish_SauceDTO;
import pizza.service.SideDish_SauceService;

@Repository
public class SideDish_SauceDAO implements SideDish_SauceService {
	@Resource(name="template")
	private SqlSessionTemplate template;

	@Override
	public List<SideDish_SauceDTO> selectList() {
		return template.selectList("sideDishSauceSelectList");
	}
}
