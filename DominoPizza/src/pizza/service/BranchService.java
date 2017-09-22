package pizza.service;

import java.util.List;
import java.util.Map;

public interface BranchService {
	// 목록용
	List<BranchDTO> selectStore(Map map);
	List<BranchDTO> shopList(Map map);
	// 상세보기용
	BranchDTO selectOne(BranchDTO dto);
	// 입력/수정/삭제용
	int insert(BranchDTO dto);
	int update(BranchDTO dto);
	int delete(BranchDTO dto);
}
