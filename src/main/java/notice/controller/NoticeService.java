package notice.controller;

import java.util.List;

import notice.bean.NoticeDTO;

public interface NoticeService {
	// 저장하기
	public int noticeWrite(NoticeDTO noticeDTO);
	// 삭제하기
	public int noticeDelete(int notice_num);
	// 상세보기
	public NoticeDTO noticeView(int notice_num);
	// 목록보기
	public List<NoticeDTO> noticeList(int startNum, int endNum);
	// 전체 데이타 갯수 구하기 
	public int getTotal();
	// 조회수 증가하기
	public int updateHit(int notice_num);
	// 수정하기
	public int noticeModify(NoticeDTO noticeDTO);
}



