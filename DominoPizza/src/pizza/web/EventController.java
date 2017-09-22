package pizza.web;

import java.util.List;

import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import pizza.service.EventDTO;
import pizza.service.impl.EventServiceImpl;
@Controller
public class EventController {
	
	@Resource(name="eventService")
	private EventServiceImpl eventService;
	
	// 이벤트메인페이지
	@RequestMapping("/EventMain.pz")
	public String eventMain(Map map) throws Exception{
		System.out.println("!!!");
		List<EventDTO> eventmain = eventService.selectMain(map);
		map.put("eventmain", eventmain);
		return "/WEB-INF/Pizza/view/Event/EventMain.jsp";
	}
	
	// 매니아페이지
	@RequestMapping("/mania.pz")
	public String mania(Map map) throws Exception{
		return "/WEB-INF/Pizza/view/Event/mania.jsp";
	}
	
}
