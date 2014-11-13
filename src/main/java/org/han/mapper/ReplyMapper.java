package org.han.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.han.vo.ReplyVO;

public interface ReplyMapper {

	@Select(" select rno, bno, userid, cont"
			+ " from tbl_reply "
			+ " where bno = #{bno}")
	public List<ReplyVO> rReply(int bno);
	
	@Insert("insert into tbl_reply(rno, bno, cont)"
			+ " values(seq_reply.nextval,#{bno}, #{cont})")
	public void rCreate(ReplyVO vo);
	
}
