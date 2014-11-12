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
		model.addAttribute("up", service.view(vo.getBno()));	// �����Ϸ��� ������ �������� �о�鿩 ���� �� ������ ������.
	}	
	
	@RequestMapping("/updatedata")
	public String update(@ModelAttribute BbsVO bno ){
		service.update(bno);									// update ������ �ʿ��� bno, title, cont �� ���� vo�� ������.
		return "redirect:view?bno=" + bno.getBno();		// ������ �Ŀ� �ش� page�� �̵��Ͽ� ������ ����� �������� redirect ����.
	}
	
	
}
