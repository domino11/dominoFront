package pizza.service;

import java.util.List;
import java.util.Map;

public interface ToppingService {
	List<ToppingDTO> selectList(); //내맘대로피자-추가토핑안내
	List<ToppingDTO> selectAddToppingList(Map map); //내맘대로피자-하프앤하프-토핑추가하기
	List<ToppingDTO> selectToppingallergyList(); //토핑 알레르기 유발성분 출력용
	List<ToppingDTO> selectToppingKindList(); //토핑 분류 가져오기용
	List<ToppingDTO> selectToppingNameList(Map map); //토핑명 가져오기용
	List<ToppingDTO> selectToppingNutrientList(); //토핑 영양성분 출력용
}
