package org.han.mapper;

import org.apache.ibatis.annotations.Select;
import org.han.vo.ReplyVO;

public interface ReplyMapper {

	@Select(" select bno, userid, cont"
			+ " from tbl_reply "
			+ " where bno = #{bno}")
	public ReplyVO rReply(String bno);
	
}
