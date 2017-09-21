package pizza.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import pizza.service.MyPizzaDTO;
import pizza.service.MyPizzaService;
import pizza.service.PNutrientDTO;
@Repository
public class MyPizzaDAO implements MyPizzaService{
	@Resource(name="template")
	private SqlSessionTemplate template;
	@Override
	public List<MyPizzaDTO> selectList() {
		return template.selectList("pizzaSelectList");
	}
	@Override
	public List<MyPizzaDTO> selectSecondPizzaList(MyPizzaDTO dto) {
		return template.selectList("pizzaSecondSelectList", dto);
	}

	@Override
	public String hnhAddPriceSelectOne(Map map) {
		return template.selectOne("addHalfNHalfPriceSelectOne", map);
	}
	
	@Override
	public List<PNutrientDTO> PizzaNutrientSelectList() {
		return template.selectList("pizzaDoughNutrientSelectList");
	}

}
