package pizza.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import pizza.service.NewsListDTO;
import pizza.service.NewsListService;

@Service("newsListService")
public class NewsListServiceImpl implements NewsListService{
	
	@Resource(name="newsListDAO")
	private NewsListDAO dao;

	@Override
	public List<NewsListDTO> selectNews(Map map) {
		return dao.selectNews(map);
	}

	@Override
	public List<NewsListDTO> selectPress(Map map) {
		return dao.selectPress(map);
	}
	
	@Override
	public NewsListDTO selectOne(NewsListDTO dto) {
		return dao.selectOne(dto);
	}

	@Override
	public int insert(NewsListDTO dto) {
		return dao.insert(dto);
	}

	@Override
	public int update(NewsListDTO dto) {
		return dao.update(dto);
	}

	@Override
	public int delete(NewsListDTO dto) {
		return dao.delete(dto);
	}

	@Override
	public int newsCount(Map map) {
		return dao.newsCount(map);
	}

	@Override
	public int pressCount(Map map) {
		return dao.pressCount(map);
	}



}
