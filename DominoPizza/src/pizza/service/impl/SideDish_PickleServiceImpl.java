package pizza.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import pizza.service.SideDish_PickleDTO;
import pizza.service.SideDish_PickleService;

@Service("sideDish_PickleService")
public class SideDish_PickleServiceImpl implements SideDish_PickleService{
	@Resource(name="sideDish_PickleDAO")
	private SideDish_PickleDAO dao;

	@Override
	public List<SideDish_PickleDTO> selectList() {
		return dao.selectList();
	}	
}
