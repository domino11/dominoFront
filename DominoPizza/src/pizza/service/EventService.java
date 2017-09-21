package pizza.service;

import java.util.List;
import java.util.Map;

public interface EventService {
	// 목록용
	List<EventDTO> selectMain(Map map);
	// 상세보기용
	EventDTO selectOne(EventDTO dto);
	// 입력/수정/삭제용
	int insert(EventDTO dto); 
	int update(EventDTO dto); 
	int delete(EventDTO dto); 
	
}
