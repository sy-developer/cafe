package board.dao;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import board.bean.BoardDTO;

@Repository
public class BoardDAO {
	@Autowired
	SqlSessionTemplate sqlSession;

	// 저장하기
	public int boardWrite(BoardDTO boardDTO) {
		return sqlSession.insert("mybatis.boardMapper.boardWrite", boardDTO);
	}
	// 삭제하기
	public int boardDelete(int board_num) {
		return sqlSession.delete("mybatis.boardMapper.boardDelete", board_num);
	}
	// 상세보기
	public BoardDTO boardView(int board_num) {
		return sqlSession.selectOne("mybatis.boardMapper.boardView", board_num);
	}
	// 목록보기
	public List<BoardDTO> boardList(int startNum, int endNum) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("startNum", startNum);
		map.put("endNum", endNum);
		return sqlSession.selectList("mybatis.boardMapper.boardList", map);
	}
	// 전체 데이타 갯수 구하기 
	public int getTotal() {
		return sqlSession.selectOne("mybatis.boardMapper.getTotal");
	}
	// 조회수 증가하기
	public int updateHit(int board_num) {
		return sqlSession.update("mybatis.boardMapper.updateHit", board_num);
	}
	// 수정하기
	public int boardModify(BoardDTO boardDTO) {
		return sqlSession.update("mybatis.boardMapper.boardModify", boardDTO);
	}
	// 댓글달기
	public int boardReply(BoardDTO boardDTO) {
		return sqlSession.insert("mybatis.boardMapper.boardWrite", boardDTO);
	}
	// 작성자 확인하기
	public boolean isArticleBoardWriter(String board_id) {
		boolean exist = false;
		if(sqlSession.selectOne("mybatis.boardMapper.isArticleBoardWriter", board_id) != null) {
			exist = true;
		}
		return exist;
	}
}


