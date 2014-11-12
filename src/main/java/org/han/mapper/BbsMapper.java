package org.han.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.han.util.PageMaker;
import org.han.vo.BbsVO;


public interface BbsMapper {
	
	@Select("insert into tbl_bbs(bno, title, userid, cont) "
			+ " values(seq_bbs.nextval, #{title}, #{userid}, #{cont})")
	public void create(BbsVO vo);

//	@Select("select rn, bno, title, userid, cont, ceil(cnt/10) cnt"
//			+ " from( select /*+INDEX_DESC(tbl_bbs pk_bbs) */"
//			+ " rownum rn, bno, title, userid, cont, count(*) over() cnt"
//			+ " from tbl_bbs"
//			+ " where bno > 0 and rownum <= (ceil((#{page}/10)) * (10*10) ) + 1)"
//			+ " where rn > ((#{page}-1)*10) and rn <= (#{page}*10)")
	public List<BbsVO> read(PageMaker pm);
	
	@Select("select * from tbl_bbs where bno=#{bno}")
	public BbsVO view(String bno);

	@Delete("delete from tbl_bbs where bno=#{bno}")
	public void delete(String bno);
	
	@Update("update tbl_bbs set title=#{title}, cont=#{cont} where bno=#{bno}")
	public void update(BbsVO vo);
	
}
