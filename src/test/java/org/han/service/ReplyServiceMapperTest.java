package org.han.service;

import javax.inject.Inject;

import org.apache.log4j.Logger;
import org.han.vo.ReplyVO;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "file:src/main/**/*-context.xml" })
public class ReplyServiceMapperTest {

	static Logger logger = Logger.getLogger("TEST");

	@Inject
	ReplyService service;

	@Inject
	ReplyVO vo;

	@Test
	public void reatTest() {
		System.out.println(service.rReply(585));

	}
	
	@Test
	public void createTest(){
		vo.setBno(603);
		vo.setCont("æ”≈ª«œ∏È ∏Ì¡¯¿Ã«¸¥‘¿Ã¡“");
		vo.setUserid("han07");
		service.rCreate(vo);
		System.out.println(service.rReply(603));
	}

}
