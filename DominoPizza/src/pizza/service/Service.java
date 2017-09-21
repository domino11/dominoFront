package pizza.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;


import pizza.service.impl.Daotest;
import pizza.service.impl.UserDto;

 public interface Service{
	

	
	int test(Map map) throws Exception;
	List<PizzaMenuList> menuList(Map map) throws Exception;	
	int selectaddr(Map map) throws Exception;
	
	int addrselect(Map map) throws Exception;
	PizzaDTO pizzaview(Map map) throws Exception;
	List<DoughDTO> doughlist(Map map) throws Exception;
	List<PNutrientDTO> pnutrient(Map map) throws Exception;
	int sinsert(Map map) throws Exception;
	int stinsert(BasketDTO dto) throws Exception;
	StoresDTO deladdrsel(Map map) throws Exception;
	int deladdrin(Map map) throws Exception;	
	List<StoresDTO> deladdrprint(Map map) throws Exception;
	StoresDTO sessionInDel(Map map) throws Exception;
	List<SaileCouponDTO> callcoupon(Map map);
	UserDto callUser(Map map);
	SideMenuList Sideview(Map map);
	SNutrientDTO snprint(Map map);
	DrPnsDTO getdpns(Map map);
	

}
