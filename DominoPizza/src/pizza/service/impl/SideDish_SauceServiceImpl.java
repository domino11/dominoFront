package pizza.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import pizza.service.SideDish_SauceDTO;
import pizza.service.SideDish_SauceService;

@Service("sideDish_SauceService")
public class SideDish_SauceServiceImpl implements SideDish_SauceService{
	@Resource(name="sideDish_SauceDAO")
	private SideDish_SauceDAO dao;

	@Override
	public List<SideDish_SauceDTO> selectList() {
		return dao.selectList();
	}
	
}
