package pizza.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import pizza.service.EventDTO;
import pizza.service.EventService;

@Repository
public class EventDAO implements EventService{
	@Resource(name="template")
	private SqlSessionTemplate template;

	@Override
	public List<EventDTO> selectMain(Map map) {
		return template.selectList("eventSelectMain", map);
	}

	@Override
	public EventDTO selectOne(EventDTO dto) {
		return null;
	}

	@Override
	public int insert(EventDTO dto) {
		return 0;
	}

	@Override
	public int update(EventDTO dto) {
		return 0;
	}

	@Override
	public int delete(EventDTO dto) {
		return 0;
	}
	
	
}
