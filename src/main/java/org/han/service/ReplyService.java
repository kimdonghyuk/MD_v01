package org.han.service;

import javax.inject.Inject;

import org.han.mapper.ReplyMapper;
import org.han.vo.ReplyVO;
import org.springframework.stereotype.Service;

@Service
public class ReplyService {

	@Inject
	ReplyMapper mapper;
	
	public ReplyVO rReply(String bno){
		return mapper.rReply(bno);
	}
}
