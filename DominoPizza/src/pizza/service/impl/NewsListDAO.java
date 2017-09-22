package pizza.service.impl;

import java.util.List;

import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import pizza.service.NewsListDTO;
import pizza.service.NewsListService;

@Repository
public class NewsListDAO implements NewsListService{
	@Resource(name="template")
	private SqlSessionTemplate template;

	@Override
	public List<NewsListDTO> selectNews(Map map) {
		return template.selectList("newsListSelect", map);
	}

	@Override
	public List<NewsListDTO> selectPress(Map map) {
		return template.selectList("pressListSelect", map);
	}

	@Override
	public NewsListDTO selectOne(NewsListDTO dto) {
		return null;
	}

	@Override
	public int insert(NewsListDTO dto) {
		return 0;
	}

	@Override
	public int update(NewsListDTO dto) {
		return 0;
	}

	@Override
	public int delete(NewsListDTO dto) {
		return 0;
	}

	@Override
	public int newsCount(Map map) {
		return template.selectOne("newsListTotal",map);
	}

	@Override
	public int pressCount(Map map) {
		return template.selectOne("pressListTotal", map);
	}

}
