package pizza.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import pizza.service.DoughDTO;
import pizza.service.DoughService;


@Repository
public class DoughDAO implements DoughService{
	@Resource(name="template")
	private SqlSessionTemplate template;

	@Override
	public List<DoughDTO> selectList() {
		return template.selectList("doughSelectList");
	}
}
