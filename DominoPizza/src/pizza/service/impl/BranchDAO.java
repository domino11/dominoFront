package pizza.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import pizza.service.BranchDTO;
import pizza.service.BranchService;

@Repository
public class BranchDAO implements BranchService{
	
	@Resource(name="template")
	private SqlSessionTemplate template;

	@Override
	public List<BranchDTO> selectStore(Map map) {
		return template.selectList("branch", map);
	}
	
	@Override
	public List<BranchDTO> shopList(Map map) {
		return template.selectList("shoplist", map);
	}

	@Override
	public BranchDTO selectOne(BranchDTO dto) {
		return template.selectOne("branchShow", dto);
	}

	@Override
	public int insert(BranchDTO dto) {
		return 0;
	}

	@Override
	public int update(BranchDTO dto) {
		return 0;
	}

	@Override
	public int delete(BranchDTO dto) {
		return 0;
	}



	
}
