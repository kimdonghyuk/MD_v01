package org.han.mapper;

import static org.junit.Assert.fail;

import javax.inject.Inject;

import org.apache.log4j.Logger;
import org.han.vo.ReplyVO;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(
		locations = {"file:src/main/**/*-context.xml"})
public class ReplyMapperTest {


	static Logger logger = Logger.getLogger("TEST");
	
	@Inject
	ReplyMapper mapper;
	
	@Inject
	ReplyVO vo;

	@Test
	public void readTest() {
		System.out.println(mapper.rReply(585));
	}
	
	@Test
	public void createTest(){
		vo.setBno(603);
		vo.setCont("두기두기두기 당당당");
		vo.setUserid("han07");
		mapper.rCreate(vo);
		System.out.println(mapper.rReply(603));
	}

}
