package pizza.web;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import pizza.service.BranchDTO;
import pizza.service.StoresDTO;
import pizza.service.impl.BranchServiceImpl;

@Controller
public class BranchController {
	
	@Resource(name="branchService")
	private BranchServiceImpl branchService;
	
	// 매장찾기
	@RequestMapping("/branch.pz")
	public String branch(Map map) throws Exception{
		List<BranchDTO> branch = branchService.selectStore(map);	// 매장 전체목록
		map.put("branch", branch);
		
		List<BranchDTO> shoplist = branchService.shopList(map);		// 같은 구/군에 위치한 매장출력용
		map.put("shoplist", shoplist);
		System.out.println(shoplist);
		
		//String st_addr = branch.get(4).getSt_addr().toString().replace("%&@#*^$@!", "");
		//System.out.println(branch.get(4).getSt_addr().toString().replace("%&@#*^$@!", ""));
		// map.get(branch).toString().replace("%&@#*^$@!", "");
		//map.put("st_addr", st_addr);
		return "/WEB-INF/Pizza/view/Branch/branch.jsp";
		
		
		
	}

}
