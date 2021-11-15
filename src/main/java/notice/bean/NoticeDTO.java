package notice.bean;

public class NoticeDTO {
	private int notice_num;									// 글 번호
	private String notice_id; 			  					// 글 작성자
	private String notice_subject; 							// 글 제목
	private String notice_content; 							// 글 내용
	private String notice_readcount; 						// 조회수
	private String logtime;									// 작성일
	
	public int getNotice_num() {
		return notice_num;
	}
	public void setNotice_num(int notice_num) {
		this.notice_num = notice_num;
	}
	public String getNotice_id() {
		return notice_id;
	}
	public void setNotice_id(String notice_id) {
		this.notice_id = notice_id;
	}
	public String getNotice_subject() {
		return notice_subject;
	}
	public void setNotice_subject(String notice_subject) {
		this.notice_subject = notice_subject;
	}
	public String getNotice_content() {
		return notice_content;
	}
	public void setNotice_content(String notice_content) {
		this.notice_content = notice_content;
	}
	public String getNotice_readcount() {
		return notice_readcount;
	}
	public void setNotice_readcount(String notice_readcount) {
		this.notice_readcount = notice_readcount;
	}
	public String getLogtime() {
		return logtime;
	}
	public void setLogtime(String logtime) {
		this.logtime = logtime;
	}	
}


