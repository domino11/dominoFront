package pizza.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import pizza.service.StoresDTO;
import pizza.service.BranchDTO;
import pizza.service.BranchService;

@Service("branchService")
public class BranchServiceImpl implements BranchService{
	
	@Resource(name="branchDAO")
	private BranchDAO dao;

	@Override
	public List<BranchDTO> selectStore(Map map) {
		return dao.selectStore(map);
	}

	@Override
	public List<BranchDTO> shopList(Map map) {
		return dao.shopList(map);
	}
	
	@Override
	public BranchDTO selectOne(BranchDTO dto) {
		return dao.selectOne(dto);
	}

	@Override
	public int insert(BranchDTO dto) {
		return dao.insert(dto);
	}

	@Override
	public int update(BranchDTO dto) {
		return dao.update(dto);
	}

	@Override
	public int delete(BranchDTO dto) {
		return dao.delete(dto);
	}

	@Override
	public int count(Map map) {
		return dao.count(map);
	}




}
