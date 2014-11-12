package org.han.service;

import static org.junit.Assert.*;

import javax.inject.Inject;

import org.apache.log4j.Logger;
import org.han.mapper.BbsMapper;
import org.han.vo.BbsVO;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(
		locations = {"file:src/main/**/*-context.xml"})
public class ServiceMapperTest {

	static Logger logger = Logger.getLogger("TEST");
	
	@Inject
	BbsService service;
	
	@Inject
	BbsVO vo;

	@Test
	public void Createtest() {
		vo.setTitle("hello my name is myung dong");
		vo.setUserid("han07");
		vo.setCont("µµøÕ¡‡ø‰ ºº±’∏«~~");
		service.create(vo);
	}

}
