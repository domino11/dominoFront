package pizza.web;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import pizza.service.NewsListDTO;
import pizza.service.impl.NewsListServiceImpl;

@Controller
public class NewsListController {

	@Resource(name="newsListService")
	private NewsListServiceImpl newsListService;
	
	@RequestMapping("/NewsList.pz")
	public String newsList(Map map, Model model, HttpServletRequest req) throws Exception{
		
		int type = 0;
		if(req.getParameter("type") != null) {
			req.setAttribute("type", req.getParameter("type"));
			type = Integer.parseInt(req.getParameter("type"));
		}
		if(type == 1) {
			List<NewsListDTO> newslist = newsListService.selectNews(map);
			req.setAttribute("type", "1");
			map.put("newslist", newslist);
		}
		else {
			List<NewsListDTO> newslist = newsListService.selectPress(map);
			req.setAttribute("type", "2");
			map.put("newslist", newslist);
		}
		

		int newsTotal = newsListService.newsCount(map);
		map.put("newsTotal", newsTotal);
		
		int pressTotal = newsListService.pressCount(map);
		map.put("pressTotal", pressTotal);
	
		
		return "/WEB-INF/Pizza/view/NewsList/NewsList.jsp";
	}
}
