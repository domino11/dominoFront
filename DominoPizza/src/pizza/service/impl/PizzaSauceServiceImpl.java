package pizza.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import pizza.service.PizzaSauceDTO;
import pizza.service.PizzaSauceService;
@Service("pizzaSauceService")
public class PizzaSauceServiceImpl implements PizzaSauceService {
	@Resource(name="pizzaSauceDAO")
	private PizzaSauceDAO dao;

	@Override
	public List<PizzaSauceDTO> selectList() {
		return dao.selectList();
	}
}
