package pizza.service.impl;

import java.util.List;
import java.util.Map;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import pizza.service.ToppingDTO;
import pizza.service.ToppingService;

@Service("toppingService")
public class ToppingServiceImpl implements ToppingService{
	@Resource(name="toppingDAO")
	private ToppingDAO dao;
	@Override
	public List<ToppingDTO> selectList() {
		return dao.selectList();
	}
	@Override
	public List<ToppingDTO> selectAddToppingList(Map map) {
		return dao.selectAddToppingList(map);
	}
	@Override
	public List<ToppingDTO> selectToppingNameList(Map map) {
		return dao.selectToppingNameList(map);
	}
	@Override
	public List<ToppingDTO> selectToppingKindList() {
		return dao.selectToppingKindList();
	}
	@Override
	public List<ToppingDTO> selectToppingallergyList() {
		return dao.selectToppingallergyList();
	}
	@Override
	public List<ToppingDTO> selectToppingNutrientList() {
		return dao.selectToppingNutrientList();
	}

}
