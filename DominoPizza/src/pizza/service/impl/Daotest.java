package pizza.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import pizza.service.BasketDTO;
import pizza.service.DelAddrDTO;
import pizza.service.DoughDTO;
import pizza.service.DrPnsDTO;
import pizza.service.PNutrientDTO;
import pizza.service.PizzaDTO;
import pizza.service.PizzaMenuList;
import pizza.service.SNutrientDTO;
import pizza.service.SaileCouponDTO;
import pizza.service.SideMenuList;
import pizza.service.StoresDTO;
import pizza.service.ToppingDTO;


@Repository
public class Daotest {
	
	
	
	
	@Resource(name="template")
	private SqlSessionTemplate template;
	
	
	public int test(Map map){
		System.out.println("되냐");
		System.out.println(template);
		int count = template.insert("mybatisTest",map);
		return count;
	}
	
	
	public List<PizzaMenuList> menuList(Map map){
		System.out.println("dao 내부");
		
		System.out.println(map.get("fro"));
		System.out.println(map.get("sel"));
		List<PizzaMenuList> count = null;
		if(map.get("ty").toString().equals("104")) {
			
			count = template.selectList("mybatisSideMenu",map);
		}
		else {
			count = template.selectList("mybatisMenu",map);
		}
		System.out.println("바티스 내부"+count.size());
	/*	else if(map.get("ty").toString().equals("2"))
			count = template.selectList("mybatisMen2",map);
		else if(map.get("ty").toString().equals("3"))
			count = template.selectList("mybatisMenu3",map);*/
		System.out.println("바티스 종료");
		return count;
	}

	public int addrselect(Map map) {
		return template.insert("mybatisaddrselect",map);
		
	}

	public PizzaDTO pizzaview(Map map) {
		return template.selectOne("mybatisPizzaview",map);
	}

	public List<DoughDTO> doughlist(Map map) {
		return template.selectList("mybatisDoughlist",map);
	}

	public List<PNutrientDTO> pnutrient(Map map) {
		return template.selectList("mybatispnutrient",map);
	}

	public int sinsert(Map map) {
		return template.insert("mybatissinsert",map);
	}

	public int stinsert(BasketDTO dto) {
		return template.insert("mybatisstinsert",dto);
	}


	public StoresDTO deladdrsel(Map map) {
		
		String pos = map.get("ret").toString();
		String xposs=pos.replace(")", "").replace("(", "").split(",")[0].trim();
		String yposs=pos.replace(")", "").replace("(", "").split(",")[1].trim();
		System.out.println("x:"+xposs+" y:"+yposs);
		float xpos = Float.parseFloat(xposs);
		float ypos = Float.parseFloat(yposs);
		map.put("xpos", xpos);
		map.put("ypos", ypos);
		
		return template.selectOne("mybatisDeladdrsel",map);
	}

	public int deladdrin(Map map) {
		return template.insert("mybatisDeladdrin",map);
	}

	public List<StoresDTO> deladdrprint(Map map) {
		return template.selectList("mybatisdeladdrprint",map);
	}

	public StoresDTO sessionInDel(Map map) {
		return template.selectOne("mybatissessionInDel",map);
	}

	public UserDto callUser(Map id) {
		return template.selectOne("mybatiscallUser",id);
	}

	public SideMenuList sideView(Map map) {
		return template.selectOne("mybatisSideMenuView",map);
	}

	public SNutrientDTO snprint(Map map) {
		System.out.println("ASD?");
		return template.selectOne("mybatissnprint",map);
	}

	public List<SaileCouponDTO> callcoupon(Map map) {
		return template.selectList("mybatiscallcoupon",map);
	}

	public DrPnsDTO getdpns(Map map) {
		return template.selectOne("mybatisgetdpns",map);
	}

		public void setsrc(Map map) {
			template.delete("mybatisdelsrc");
			template.insert("mybatissetsrc",map);
		
	}

		public ToppingDTO callTopping(Map map) {
			return template.selectOne("mybatiscallTopping",map);
		}

		public int insal(Map map) {
			 System.out.println("id="+map.get("id")+"no="+map.get("st_no")+"addr="+map.get("sa_addr")+" rec="+map.get("sa_recipt")+"retel="+map.get("sa_rectel")+" request="+map.get("sa_request")+"   "+map.get("pay_no") );
			System.out.println("수정되나?");
			return template.insert("mybatisinsal",map);
		}

		public int insalmenu(BasketDTO dto) {
			System.out.println("no="+dto.getNo()+" kind="+dto.getKind()+" name="+dto.getName()+" qty="+dto.getQty()+" size="+dto.getSize()+" price="+dto.getPrice());
			
			 return template.insert("mybasketinsalmenu",dto);
		}

		public int s_topping(ToppingDTO tdto) {
			return template.insert("mybatiss_topping",tdto);
		}

		public String getd_no(Map map) {
			return template.selectOne("mybatisgetd_no",map);
		}

		public Object usecoupon(Map map) {
			return template.insert("mybatisusecoupon",map);
		}


		public int inPizzaRank(BasketDTO dto) {
			return template.insert("mybatisinPizzaRank",dto);
		}


		public List<PizzaMenuList> menuRank(Map map) {
			System.out.println(map.get("sel"));
			return template.selectList("mybatismenuRank",map);
		}


		public int inSalesPrice(Map map) {
			return template.insert("mybatisinSalesPrice",map);
		}

	
	
}
