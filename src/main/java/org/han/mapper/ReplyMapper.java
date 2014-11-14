package org.han.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.han.vo.ReplyVO;

public interface ReplyMapper {

	@Select(" select rno, bno, userid, cont"
			+ " from tbl_reply "
			+ " where bno = #{bno}")
	public List<ReplyVO> rReply(int bno);
	
	@Insert("insert into tbl_reply(rno, bno, userid, cont)"
			+ " values(seq_reply.nextval,#{bno}, #{userid}, #{cont})")
	public void rCreate(ReplyVO vo);
	
	
//	@Delete("delete tbl_reply"
//			+ "where rno=#{rno}")
//	public void rDelete(ReplyVO vo);
	
	@Delete("delete tbl_reply"
			+ "	where rno=#{rno}")
	public void rDelete(ReplyVO vo);
	
//	@Update("update tbl_reply"
//			+ "	set cont = '이것이 바로 댓글입니다.'"
//			+ "	where rno = 163")
//	public void rUpdate(ReplyVO vo);
	
}
