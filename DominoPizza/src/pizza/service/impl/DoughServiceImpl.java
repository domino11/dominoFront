package pizza.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import pizza.service.DoughDTO;
import pizza.service.DoughService;

@Service("doughService")
public class DoughServiceImpl implements DoughService{
	@Resource(name="doughDAO")
	private DoughDAO dao;

	@Override
	public List<DoughDTO> selectList() {
		return dao.selectList();
	}

}
