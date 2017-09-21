package pizza.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import pizza.service.SideDish_BeverageDTO;
import pizza.service.SideDish_BeverageService;
import pizza.service.ToppingDTO;

@Service("sideDish_BeverageService")
public class SideDish_BeverageServiceImpl implements SideDish_BeverageService{
	@Resource(name="sideDish_BeverageDAO")
	private SideDish_BeverageDAO dao;

	@Override
	public List<SideDish_BeverageDTO> selectList() {
		return dao.selectList();
	}
}
