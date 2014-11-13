package org.han.web;

import java.util.List;

import javax.inject.Inject;

import org.han.service.ReplyService;
import org.han.vo.BbsVO;
import org.han.vo.ReplyVO;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/bbs/reply/*")
public class ReplyController {

	@Inject
	ReplyService service;
	
	@RequestMapping("/view")
	public @ResponseBody List<ReplyVO> view(
			@RequestParam(value = "bno", defaultValue = "1") int bno) {
		return service.rReply(bno);
	}
	
	@RequestMapping("/create")
	public @ResponseBody void create(@ModelAttribute ReplyVO vo){
		service.rCreate(vo);
	}
	
	
	
}
