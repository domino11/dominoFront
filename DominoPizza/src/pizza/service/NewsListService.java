package pizza.service;

import java.util.List;
import java.util.Map;

public interface NewsListService {
	// 도미노뉴스 목록용
	List<NewsListDTO> selectNews(Map map);
	// 프레스 목록용
	List<NewsListDTO> selectPress(Map map);
	// 상세보기용
	NewsListDTO selectOne(NewsListDTO dto);
	// 입력/수정/삭제용
	int insert(NewsListDTO dto);
	int update(NewsListDTO dto);
	int delete(NewsListDTO dto);
	// 도미노뉴스 수 구하기
	int newsCount(Map map);
	// 프레스 수 구하기
	int pressCount(Map map);
}
