package pizza.service.impl;

import java.util.List;
import java.util.Map;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import pizza.service.MyPizzaDTO;
import pizza.service.MyPizzaService;
import pizza.service.PNutrientDTO;

@Service("myPizzaService")
public class MyPizzaServiceImpl implements MyPizzaService{
	@Resource(name="myPizzaDAO")
	private MyPizzaDAO dao;
	@Override
	public List<MyPizzaDTO> selectList() {
		return dao.selectList();
	}
	@Override
	public List<MyPizzaDTO> selectSecondPizzaList(MyPizzaDTO dto) {
		return dao.selectSecondPizzaList(dto);
	}
	@Override
	public String hnhAddPriceSelectOne(Map map) {
		return dao.hnhAddPriceSelectOne(map);
	}
	@Override
	public List<PNutrientDTO> PizzaNutrientSelectList() {
		return dao.PizzaNutrientSelectList();
	}
}
