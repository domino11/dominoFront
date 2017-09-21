package pizza.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import pizza.service.EventDTO;
import pizza.service.EventService;

@Service("eventService")
public class EventServiceImpl implements EventService{

	@Resource(name="eventDAO")
	private EventDAO dao;
	
	@Override
	public List<EventDTO> selectMain(Map map) {
		return dao.selectMain(map);
	}

	@Override
	public EventDTO selectOne(EventDTO dto) {
		return dao.selectOne(dto);
	}

	@Override
	public int insert(EventDTO dto) {
		return dao.insert(dto);
	}

	@Override
	public int update(EventDTO dto) {
		return dao.update(dto);
	}

	@Override
	public int delete(EventDTO dto) {
		return dao.delete(dto);
	}

}
