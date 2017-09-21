package pizza.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import pizza.service.SideDish_PickleDTO;
import pizza.service.SideDish_PickleService;

@Repository
public class SideDish_PickleDAO implements SideDish_PickleService {
	@Resource(name="template")
	private SqlSessionTemplate template;

	@Override
	public List<SideDish_PickleDTO> selectList() {
		return template.selectList("sideDishPickleSelectList");
	}
	
}
