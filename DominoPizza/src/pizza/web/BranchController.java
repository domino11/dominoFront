package pizza.web;

import java.util.List;
import java.util.Map;
import java.util.Vector;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.sun.org.apache.xalan.internal.xsltc.compiler.util.MatchGenerator;

import pizza.service.BranchDTO;
import pizza.service.StoresDTO;
import pizza.service.impl.BranchServiceImpl;

@Controller
public class BranchController {
	
	@Resource(name="branchService")
	private BranchServiceImpl branchService;
	
	// 매장찾기
	@RequestMapping("/branch.pz")
	public String branch(@RequestParam Map map, Map map2, HttpServletRequest req) throws Exception{
		String where = "where 1=1 ";
		req.setCharacterEncoding("UTF-8");


		
		if(map.get("gugun")!=null && map.get("gugun").toString().length()>0) {
			String gugun = map.get("gugun").toString();
			String si = map.get("si").toString();
			where += " and st_addr like ('%"+si+"%') and st_addr like ('%"+gugun+"%')";
			System.out.println(where);
			if(map.get("sido1")!=null) {
			map2.put("gugun", map.get("sido1").toString());
			map2.put("sido", map.get("sido2").toString());
			}
		}

		if(map.get("nameSearch")!=null && map.get("nameSearch").toString().length()>0) {
			String nameSearch = map.get("nameSearch").toString();
			map2.put("names", "1");
			where += " and st_name like ('%"+nameSearch+"%')";
			System.out.println(where);
			System.out.println("sido3"+nameSearch);
			req.setAttribute("nameSearch", nameSearch);
			
		}
		
		
		map.put("where",where);
		List<BranchDTO> shoplist = branchService.selectStore(map);	// 매장 전체목록
		for(BranchDTO dto:shoplist) {
			dto.setSt_addr(dto.getSt_addr().replace("%&@#*^$@!", ""));
			System.out.println(dto.getSt_xpos());
			System.out.println(dto.getSt_ypos()+"y");
		}
		
		
		
/*		List<BranchDTO> shoplist = branchService.shopList(map);		// 같은 구/군에 위치한 매장출력용
		map2.put("shoplist", shoplist);*/
		System.out.println("shoplist:"+shoplist);
		if(shoplist.size() !=0) {  ////////////////////////2017-09-28추가
		map2.put("centerX", shoplist.get(0).getSt_xpos());
		map2.put("centerY", shoplist.get(0).getSt_ypos());
	
		System.out.println(shoplist+"shoplist");
		int size=0;
		double minx = 0;
		double miny = 0;
		double maxx = 0;
		double maxy = 0;
		for(int i=0; i < shoplist.size() ; i++) {
			if(i==0) {
				minx=Double.parseDouble(shoplist.get(i).getSt_xpos());
				maxx=Double.parseDouble(shoplist.get(i).getSt_xpos());
				miny=Double.parseDouble(shoplist.get(i).getSt_ypos());
				maxy=Double.parseDouble(shoplist.get(i).getSt_ypos());
			}
			
			if(minx>=Double.parseDouble(shoplist.get(i).getSt_xpos())) {
				minx=Double.parseDouble(shoplist.get(i).getSt_xpos());
			}
			if(maxx<=Double.parseDouble(shoplist.get(i).getSt_xpos())) {
				maxx=Double.parseDouble(shoplist.get(i).getSt_xpos());
			}
			if(miny<=Double.parseDouble(shoplist.get(i).getSt_ypos())) {
				miny=Double.parseDouble(shoplist.get(i).getSt_ypos());
			}
			if(maxy<=Double.parseDouble(shoplist.get(i).getSt_ypos())) {
				maxy=Double.parseDouble(shoplist.get(i).getSt_ypos());
			}
		}
		double xpos = (minx+maxx)/2;
		double ypos = (miny+maxy)/2;
		
/*		String wi = map.get("wido").toString();
		String gn = map.get("gndo").toString();
		
		System.out.println("wi"+wi+"gn"+gn);
		
		
		double wido = Double.parseDouble(wi);
		double gndo = Double.parseDouble(gn);
		
		System.out.println("wido"+wido+"gndo"+gndo);
		*/
		
		/*String wi = req.getParameter("xpos");
		String gn = req.getParameter("ypos");
		*/
		int idx = 0;
		double siz = 0;
		if(maxx-minx>maxy-miny) {
			siz = maxx-minx;
		}else siz = maxy-miny;
		if(siz>0.3) {
			size = 13;
		}else if(siz>0.2) {
			size = 12;
		}
		else if(siz>0.05) {
			size = 11;
		}
		else if(siz>0.03) {
			size = 8;
		}
		else if(siz>0.012) {
			size = 6;
		}
		else if(siz>0.009) {
			size = 5;
		}else if(siz>0.007) {
			size = 4;
		}else if(siz>0.005) {
			size = 3;
		}else if(siz>0.003) {
			size = 2;
		}
		else size = 3;
		System.out.println("siz"+siz);
		map2.put("centerX",xpos);
		map2.put("centerY",ypos);
		
		
		double x1 = 0;
		double x2 = 0;
		double y1 = 0;
		double y2 = 0;
		
		if(map.get("xpos") != null) {
			String wi = map.get("xpos").toString();
			String gn = map.get("ypos").toString();
	
			double wido = Double.parseDouble(wi);
			double gndo = Double.parseDouble(gn);
			double nearxy = 0;
			
			System.out.println("wido : "+wido+" /gndo : "+gndo);
			
			for(int i=0; i<shoplist.size(); i++) {
				double nearx = Math.pow((Math.abs((wido-Double.parseDouble(shoplist.get(i).getSt_xpos())))),2);
				double neary = Math.pow((Math.abs((gndo-Double.parseDouble(shoplist.get(i).getSt_ypos())))),2);
				if(i == 0) {
					nearxy = Math.sqrt(nearx+neary);
				}
				if(nearxy >= Math.sqrt(nearx+neary)) {
					nearxy = Math.sqrt(nearx+neary);
					idx = i;
				}
			}
		}
		
		
		
		List<BranchDTO> nearshop = new Vector();
		nearshop.add(shoplist.get(idx));
		if(map.get("slist") != null && map.get("slist").toString().length() > 0) {
		shoplist = nearshop;
		xpos = Double.parseDouble(shoplist.get(0).getSt_xpos().toString());
		ypos = Double.parseDouble(shoplist.get(0).getSt_ypos().toString());
		size = 3;
		}
		
		
		
		
		
		
		map2.put("mapsize", size);
		map2.put("centerX",xpos);
		map2.put("centerY",ypos);
		
		}////////////////////////2017-09-28추가
		
		int count = branchService.count(map2);
		count = shoplist.size();
		map2.put("count", count);
		
		
		
		
		map2.put("si", map.get("si"));
		map2.put("gugun", map.get("gugun"));
		map2.put("sido1",map.get("sido1"));
		map2.put("shoplist", shoplist);

		return "/WEB-INF/Pizza/view/Branch/branch.jsp";
		
		
		
	}

}
