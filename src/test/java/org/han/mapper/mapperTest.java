package org.han.mapper;

import java.util.List;

import javax.inject.Inject;

import org.apache.log4j.Logger;
import org.han.vo.BbsVO;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(
		locations = {"file:src/main/**/*-context.xml"})
public class mapperTest {

	static Logger logger = Logger.getLogger("TEST");
	
	@Inject
	BbsMapper mapper;
	
	@Inject
	BbsVO vo;


	@Test
	public void createTest() {
		vo.setTitle("Today is Wednesday");
		vo.setUserid("han07");
		vo.setCont("∏€¡¯¿Ã«¸¥‘ »≠¿Ã∆√!");
		mapper.create(vo);
	}
	
//	@Test
//	public void listTest(){
//		logger.info(mapper.read(545));
//	}

}
