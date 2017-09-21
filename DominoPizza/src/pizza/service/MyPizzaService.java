package pizza.service;

import java.util.List;
import java.util.Map;

public interface MyPizzaService {
	List<MyPizzaDTO> selectList();
	List<MyPizzaDTO> selectSecondPizzaList(MyPizzaDTO dto);
	String hnhAddPriceSelectOne(Map map);
	List<PNutrientDTO> PizzaNutrientSelectList();
}
