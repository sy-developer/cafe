package notice.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import notice.bean.NoticeDTO;
import notice.dao.NoticeDAO;

@Service
public class NoticeServiceImpl implements NoticeService {
	@Autowired
	NoticeDAO noticeDAO;
	
	@Override
	public int noticeWrite(NoticeDTO noticeDTO) {
		return noticeDAO.noticeWrite(noticeDTO);
	}
	@Override
	public int noticeDelete(int notice_num) {
		return noticeDAO.noticeDelete(notice_num);
	}
	@Override
	public NoticeDTO noticeView(int notice_num) {
		return noticeDAO.noticeView(notice_num);
	}
	@Override
	public List<NoticeDTO> noticeList(int startNum, int endNum) {
		return noticeDAO.noticeList(startNum, endNum);
	}
	@Override
	public int getTotal() {
		return noticeDAO.getTotal(); 
	}
	@Override
	public int updateHit(int notice_num) {
		return noticeDAO.updateHit(notice_num);
	}
	@Override
	public int noticeModify(NoticeDTO noticeDTO) {
		return noticeDAO.noticeModify(noticeDTO);
	}
}
	





