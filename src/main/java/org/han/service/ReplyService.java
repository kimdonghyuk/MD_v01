package org.han.service;

import java.util.List;

import javax.inject.Inject;

import org.han.mapper.ReplyMapper;
import org.han.vo.ReplyVO;
import org.springframework.stereotype.Service;

@Service
public class ReplyService {

	@Inject
	ReplyMapper mapper;
	
	public List<ReplyVO> rReply(int bno){
		return mapper.rReply(bno);
	}
	 
	public void rCreate(ReplyVO vo){
		mapper.rCreate(vo);
	}
	
	public void rDelete(ReplyVO vo){
		mapper.rDelete(vo);
	}
	
	public void rUpdate(ReplyVO vo){
		mapper.rUpdate(vo);
	}
	

}
