package pizza.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import pizza.service.BasketDTO;
import pizza.service.DelAddrDTO;
import pizza.service.DoughDTO;
import pizza.service.DrPnsDTO;
import pizza.service.PNutrientDTO;
import pizza.service.PizzaDTO;
import pizza.service.PizzaMenuList;
import pizza.service.SMenuDTO;
import pizza.service.SNutrientDTO;
import pizza.service.SaileCouponDTO;
import pizza.service.SalesListDTO;
import pizza.service.SideMenuList;
import pizza.service.StoresDTO;
import pizza.service.TargetDTO;
import pizza.service.ToppingDTO;




/*
 * 이름 미 지정시 ID값은 소문자로 시작하는 클래스명이됨
 * 예]ReplyBBSServiceImpl클래인 경우 
 * ID값은 replyBBSServiceImpl
 * 지정도 가능 @Service("임의의ID값")
 */

@Service("service")
public class ServiceImpl implements pizza.service.Service {

	@Resource(name="daotest")
	private Daotest dao;

	
	
	
	@Override
	public int test(Map map) throws Exception {
		return dao.test(map);
	}
	
	@Override
	public List menuList(Map map) throws Exception {
		return dao.menuList(map);
	}

	@Override
	public int selectaddr(Map map) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}
	
	@Override
	public int addrselect(Map map) {
		return dao.addrselect(map);
		
	}
	@Override
	public PizzaDTO pizzaview(Map map) {
		return dao.pizzaview(map);
	}
	@Override
	public List<DoughDTO> doughlist(Map map) {
		return dao.doughlist(map);
	}
	@Override
	public List<PNutrientDTO> pnutrient(Map map) {
		return dao.pnutrient(map);
	}
	@Override
	public int sinsert(Map map) {
		return dao.sinsert(map);
		
	}
	@Override
	public int stinsert(BasketDTO dto) {
		return dao.stinsert(dto);
	}


	
	@Override
	public StoresDTO deladdrsel(Map map) {
		return dao.deladdrsel(map);
	}
	@Override
	public int deladdrin(Map map) {
		return dao.deladdrin(map);
	}
	@Override
	public List<StoresDTO> deladdrprint(Map map) {
		return dao.deladdrprint(map);
	}
	@Override
	public StoresDTO sessionInDel(Map map) {
		return dao.sessionInDel(map);
	}

	@Override
	public UserDto callUser(Map map) {
		return dao.callUser(map);
	}
	@Override
	public SideMenuList Sideview(Map map) {
		return dao.sideView(map);
	}
	@Override
	public SNutrientDTO snprint(Map map) {
		return dao.snprint(map);
	}
	@Override
	public List<SaileCouponDTO> callcoupon(Map map) {
		return dao.callcoupon(map);
	}
	@Override
	public DrPnsDTO getdpns(Map map) {
		return dao.getdpns(map);
	}

	public void setsrc(Map map) {
		dao.setsrc(map);
		
	}

	public ToppingDTO callTopping(Map map) {
		return dao.callTopping(map);
		
	}

	public int insal(Map map) {
		return dao.insal(map);
	}

	public int insalmenu(BasketDTO dto) {
		return dao.insalmenu(dto);
	}

	public int s_topping(ToppingDTO tdto) {
		return dao.s_topping(tdto);
	}

	public String getd_no(Map map) {
		return dao.getd_no(map);
	}

	public void usecoupon(Map map) {
		dao.usecoupon(map);
	}

	public int inPizzaRank(BasketDTO dto) {
		return dao.inPizzaRank(dto);
	}

	public List<PizzaMenuList> menuRank(Map map) {
		return dao.menuRank(map);
	}

	public int inSalesPrice(Map map) {
		return dao.inSalesPrice(map);
	}

	public List<SalesListDTO> salesList(Map map) {
		return dao.salesList(map);
	}

	public List<SMenuDTO> callSalesMenu(Map map) {
		return dao.callSalesMenu(map);
	}

	public String getfprice(Map map) {
		return dao.getfprice(map);
	}

	public TargetDTO getsalescount(Map map) {
		return dao.getsalescount(map);
	}


	

	
	
	

}
