package org.han.web;

import javax.inject.Inject;

import org.han.service.BbsService;
import org.han.service.ReplyService;
import org.han.util.PageMaker;
import org.han.vo.BbsVO;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/bbs/*")
public class BbsController {
	
	@Inject
	BbsService service;

	
	@RequestMapping("/create")
	public void create(){		
	}
	
	@RequestMapping("/createdata")
	public String createdata(@ModelAttribute BbsVO vo){
		service.create(vo);
		return "redirect:read";
	}

	@RequestMapping("/read")
	public void read(@RequestParam(value="types", defaultValue="") String[] types, 
			@ModelAttribute PageMaker pm, Model model){
		pm.setTypeArr(types);
		model.addAttribute("read" ,service.read(pm));
	}
	
	@RequestMapping("/view")
	public void view(@RequestParam(value="bno", defaultValue="") String bno, Model model ){
		model.addAttribute("view",service.view(bno));
	}
	
	@RequestMapping("/delete")
	public String delete(@RequestParam(value="bno", defaultValue="") String bno){
		service.delete(bno);
		return "redirect:read";
	}
	
	@RequestMapping("/update")
	public void upboard(@ModelAttribute BbsVO vo, Model model){
		model.addAttribute("up", service.view(vo.getBno()));	// 수정하려고 선택한 페이지를 읽어들여 수정 전 정보를 보여줌.
	}	
	
	@RequestMapping("/updatedata")
	public String update(@ModelAttribute BbsVO bno ){
		service.update(bno);									// update 쿼리에 필요한 bno, title, cont 를 가진 vo를 던져줌.
		return "redirect:view?bno=" + bno.getBno();		// 수정한 후에 해당 page로 이동하여 수정한 모습을 보기위해 redirect 해줌.
	}
	
	
}
