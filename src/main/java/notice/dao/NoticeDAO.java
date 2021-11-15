package notice.dao;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import notice.bean.NoticeDTO;

@Repository
public class NoticeDAO {
	@Autowired
	SqlSessionTemplate sqlSession;

	// 저장하기
	public int noticeWrite(NoticeDTO noticeDTO) {
		return sqlSession.insert("mybatis.noticeMapper.noticeWrite", noticeDTO);
	}
	// 삭제하기
	public int noticeDelete(int notice_num) {
		return sqlSession.delete("mybatis.noticeMapper.noticeDelete", notice_num);
	}
	// 목록보기
	public List<NoticeDTO> noticeList(int startNum, int endNum) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("startNum", startNum);
		map.put("endNum", endNum);
		return sqlSession.selectList("mybatis.noticeMapper.noticeList", map);
	}
	// 상세보기
	public NoticeDTO noticeView(int notice_num) {
		return sqlSession.selectOne("mybatis.noticeMapper.noticeView", notice_num);
	}
	// 전체 데이타 갯수 구하기 
	public int getTotal() {
		return sqlSession.selectOne("mybatis.noticeMapper.getTotal");
	}
	// 조회수 증가하기
	public int updateHit(int notice_num) {
		return sqlSession.update("mybatis.noticeMapper.updateHit", notice_num);
	}
	// 수정하기
	public int noticeModify(NoticeDTO noticeDTO) {
		return sqlSession.update("mybatis.noticeMapper.noticeModify", noticeDTO);
	}
	// 작성자 확인하기
	public boolean isArticlenNoticeWriter(String board_id) {	
		boolean exist = false;
		if(sqlSession.selectOne("mybatis.noticeMapper.isArticleNoticeWriter", board_id) != null) {
			exist = true;
		}
		return exist;
	}
}


