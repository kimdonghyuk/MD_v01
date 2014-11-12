package org.han.service;

import java.util.List;

import javax.inject.Inject;

import org.han.mapper.BbsMapper;
import org.han.util.PageMaker;
import org.han.vo.BbsVO;
import org.springframework.stereotype.Service;

@Service
public class BbsService {
	
	@Inject
	BbsMapper mapper;
	
	
	public void create(BbsVO vo){
		mapper.create(vo);
	}
	
	public List<BbsVO> read(PageMaker pm){
		List<BbsVO> list = mapper.read(pm);
		pm.setCnt(list.get(0).getCnt());
		return list;
	}
	
	public BbsVO view(String bno){
		return mapper.view(bno);
	}

	public void delete(String bno){
		mapper.delete(bno);
	}
	
	public void update(BbsVO vo){
		mapper.update(vo);
	}
}
